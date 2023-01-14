import 'package:flutter/material.dart';
import 'package:ims/screens/splash/components/body.dart';

import '../../sizeConfig.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
