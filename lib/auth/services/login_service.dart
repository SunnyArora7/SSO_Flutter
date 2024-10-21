import 'dart:convert';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sso/page_routes/page_route_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../common/widget/error_dialog/error_dialog.dart';
import '../../main.dart';
import '../../network/common_api_service.dart';
import '../../utils/preference_manager.dart';
import '../../utils/utils.dart';
import '../controller/login_controller.dart';
import 'package:http/http.dart' as http;

class LoginService {
  LoginController loginController = Get.put(LoginController());
  final Config config = Config(
    tenant: "2b55602e-647a-4625-87b8-f2493d349000",
    clientId: "8f71ec4b-47a6-42d2-82e6-921f8a572aec",
    scope: "openid profile offline_access User.Read Mail.Read",
    redirectUri: kIsWeb
        ? "https://login.live.com/oauth20_desktop.srf"
        : "https://login.live.com/oauth20_desktop.srf",
    navigatorKey: navigatorKey,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  var result;
  loginApi() async {
    final response = await CommonApiService().login({
      "username": loginController.emailController.value.text,
      "password": loginController.passController.value.text
    });
    if (response.statusCode == 200) {
      var loginResp = json.decode(response.body);
      PreferenceManager.setData(PreferenceManager.token, loginResp['access']);
      saveData(loginResp['access']);
      Get.offAllNamed(PageRouteConstant.home);
    } else {
      Get.dialog(ErrorDialog(
          errorText: "Invalid Credentials",
          onPressed: () {
            Get.back();
          }));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    loginController.googleToken.value = googleAuth!.accessToken!;
    print(googleAuth?.accessToken);
    print(googleAuth?.idToken);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  loginApiWithGoogle() async {
    final response = await CommonApiService().googleLogin({
      "token": loginController.googleToken.value,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var loginResp = json.decode(response.body);
      PreferenceManager.setData(PreferenceManager.token, loginResp['access']);
      saveData(loginResp['access']);
      Get.offAllNamed(PageRouteConstant.home);
    } else {
      Get.dialog(ErrorDialog(
          errorText: "Invalid Credentials",
          onPressed: () {
            Get.back();
          }));
    }
  }

  // This is the code using firebase , without any package this doesnt work as required
  // Future<void> signInWithMicrosoft(BuildContext context) async {
  //   OAuthProvider provider = OAuthProvider('microsoft.com');
  //   provider.setCustomParameters({
  //     "tenant": "2b55602e-647a-4625-87b8-f2493d349000",
  //     "clientId": '1075f8fc-dfcf-48e7-ad9f-0556850cfbde',
  //     "scopes": "api://8f71ec4b-47a6-42d2-82e6-921f8a572aec/vvv",
  //
  //     // Add necessary scopes
  //   });
  //
  //   try {
  //     if (kIsWeb) {
  //       result = await auth.signInWithPopup(provider);
  //     } else {
  //       result = await auth.signInWithProvider(provider);
  //     }
  //     if (result != null) {
  //       final String? accessToken = result?.credential?.accessToken;
  //       if (accessToken != null) {
  //         loginController.microsoftToken.value = accessToken;
  //
  //         //loginApiWithMicrosoft();loginApiWithMicrosoft
  //         loginApiWithMicrosoft();
  //         print(accessToken);
  //         print("************");
  //       }
  //     }
  //   } catch (exception) {
  //     print('Sign-in failed: ${exception.toString()}');
  //   }
  // }

  Future<void> azureSignInApi(bool redirect, BuildContext context) async {
    final AadOAuth oauth = AadOAuth(config);
    config.webUseRedirect = redirect;
    final result = await oauth.login();

    result.fold(
      (l) => print("Microsoft Authentication Failed!"),
      //showError("Microsoft Authentication Failed!", context),
      (r) async {
        final accessToken = r.accessToken; // Get the access token
        if (accessToken != null) {
          loginController.microsoftToken.value = accessToken; // Store the token
          // Fetch user details or any other API call with the token
          final userDetails = await fetchAzureUserDetails(accessToken);
          print(loginController.microsoftToken.value);
          print(userDetails);
        } else {
          print("Failed to retrieve access token.");
          //showError("Failed to retrieve access token.", context);
        }
      },
    );
  }

  void showError(dynamic ex, BuildContext context) {
    showMessage(ex.toString(), context);
  }

  void showMessage(String text, BuildContext context) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      TextButton(
          child: const Text('Ok'),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  static Future fetchAzureUserDetails(String accessToken) async {
    final response = await http.get(
      Uri.parse("https://graph.microsoft.com/v1.0/me"),
      headers: {"Authorization": "Bearer $accessToken"},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load user details: ${response.body}");
    }
  }

  loginApiWithMicrosoft() async {
    final response = await CommonApiService().microsoftLogin({
      "access_token": loginController.microsoftToken.value,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var loginResp = json.decode(response.body);
      PreferenceManager.setData(PreferenceManager.token, loginResp['access']);
      saveData(loginResp['access']);
      Get.offAllNamed(PageRouteConstant.home);
    } else {
      Get.dialog(ErrorDialog(
          errorText: "Invalid Credentials",
          onPressed: () {
            Get.back();
          }));
    }
  }

  void whereToGo() async {
    var isToken = PreferenceManager.getString(PreferenceManager.token);
    if (isToken == null || isToken == "" || isToken == "null") {
      Get.offNamed(PageRouteConstant.login);
    } else {
      Get.offNamed(PageRouteConstant.home);
    }
  }
}
