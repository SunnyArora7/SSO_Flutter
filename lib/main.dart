import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sso/auth/pages/login_page.dart';
import 'package:sso/page_routes/store_page_routes.dart';
import 'package:sso/utils/color_constants.dart';
import 'package:sso/utils/size_utils.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
            // Define the cursor color for the entire app
            textSelectionTheme: const TextSelectionThemeData(
                cursorColor: TextColor.royalBlue,
                selectionColor: BackgroundColor.lightBlue,
                selectionHandleColor: TextColor.royalBlue
                // Change this to your desired color
                ),
          ),
          debugShowCheckedModeBanner: false,
          home: const LoginPage(),
          // home: const ProfilePage(),
          getPages: StorePageRoute.mainPageRoute,
          navigatorKey: navigatorKey,
          // theme: appPrimaryTheme,
        );
      },
    );
  }
}
