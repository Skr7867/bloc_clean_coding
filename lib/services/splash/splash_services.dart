import 'dart:async';

import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.homeScreen,
        (route) => false,
      ),
    );
  }
}
