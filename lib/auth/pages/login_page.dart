import 'package:aad_oauth/model/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sso/auth/controller/login_controller.dart';
import 'package:sso/auth/services/login_service.dart';
import 'package:sso/utils/size_utils.dart';
import '../../main.dart';
import '../../utils/color_constants.dart';
import '../../utils/custom_button.dart';
import '../../utils/regex_validators.dart';
import '../../utils/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                autofocus: true,
                validator: Validators.isTouchedValidator,
                controller: loginController.emailController,
                style: appPrimaryTheme.textTheme.labelMedium?.copyWith(
                    color: TextColor.black, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    fillColor: BackgroundColor.white,
                    filled: true,
                    errorStyle: appPrimaryTheme.textTheme.labelSmall?.copyWith(
                        color: TextColor.red, fontWeight: FontWeight.w400),
                    hintStyle: appPrimaryTheme.textTheme.labelMedium?.copyWith(
                        color: TextColor.darkHintColor,
                        fontWeight: FontWeight.w400),
                    hintText: 'Enter your mobile or email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: BorderColor.blue,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: TextColor.red,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      // Added this line
                      borderSide: const BorderSide(
                        color: TextColor.red,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: BorderColor.blue,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,

                onFieldSubmitted: (_) {},
                validator: Validators.isEmptyValidator,
                keyboardType: TextInputType.text,
                controller: loginController.passController,
                // Use the boolean variable to toggle visibility
                style: appPrimaryTheme.textTheme.labelMedium?.copyWith(
                  color: TextColor.black,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  fillColor: BackgroundColor.white,
                  filled: true,
                  counterText: "",
                  errorStyle: appPrimaryTheme.textTheme.labelSmall?.copyWith(
                    color: TextColor.red,
                    fontWeight: FontWeight.w400,
                  ),
                  hintStyle: appPrimaryTheme.textTheme.labelMedium?.copyWith(
                    color: TextColor.darkHintColor,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: 'Password',
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: TextColor.red,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: TextColor.red,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: BorderColor.blue,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: BorderColor.blue,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Eye icon suffix and its functionality
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                  onPressed: () {
                    LoginService().loginApi();
                  },
                  context: context,
                  child: Text("Login",
                      style: appPrimaryTheme.textTheme.headlineLarge
                          ?.copyWith(color: TextColor.white))),
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                  onPressed: () async {
                    UserCredential userCredential =
                        await LoginService().signInWithGoogle();
                    loginController.googleToken.value =
                        (await userCredential.user?.getIdToken())!;
                    print("token token");
                    print(loginController.googleToken.value);
                    await LoginService().loginApiWithGoogle();
                  },
                  context: context,
                  child: Text("Login with Google",
                      style: appPrimaryTheme.textTheme.headlineLarge
                          ?.copyWith(color: TextColor.white))),
              SizedBox(
                height: 30.h,
              ),
              PrimaryButton(
                  onPressed: () async {
                    //LoginService().signInWithMicrosoft(context);
                    await LoginService().azureSignInApi(true, context);
                    LoginService().loginApiWithMicrosoft();
                  },
                  context: context,
                  child: Text("Login with Microsoft",
                      style: appPrimaryTheme.textTheme.headlineLarge
                          ?.copyWith(color: TextColor.white))),
            ],
          ),
        ),
      ),
    );
  }
}
