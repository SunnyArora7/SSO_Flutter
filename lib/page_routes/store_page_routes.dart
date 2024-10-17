import 'package:get/get_navigation/src/routes/get_route.dart';

import '../auth/pages/login_page.dart';
import '../home/pages/home_page.dart';
import '../splash/pages/splash_page.dart';
import 'page_route_constant.dart';

class StorePageRoute {
  static List<GetPage> mainPageRoute = [
    GetPage(name: PageRouteConstant.login, page: () => const LoginPage()),
    GetPage(name: PageRouteConstant.splash, page: () => const SplashPage()),
    GetPage(name: PageRouteConstant.home, page: () => const HomePage()),
  ];
}
