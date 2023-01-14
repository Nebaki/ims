import 'package:get/get.dart';
import 'package:ims/screens/onbord_screen/onboard_screen.dart';
import 'package:ims/screens/signIn/components/signIn.dart';
import 'package:ims/screens/splash/splashScreen.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(name: '/', page: () =>  SplashScreen()),
    GetPage(name: '/signIn', page: () => const Signin()),
  ];
}
