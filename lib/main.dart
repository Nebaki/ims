import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ims/routes.dart';
import 'package:ims/screens/splash/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.routes,
    );
  }
}