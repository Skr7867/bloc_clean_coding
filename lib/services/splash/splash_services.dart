import 'dart:async';

import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/services/sessionManager/session_controller.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController()
        .getUserFromPreference()
        .then((value) {
          debugPrint("SPLASH isLogin = ${SessionController().isLogin}");

          if (SessionController().isLogin) {
            debugPrint("GO HOME");
            Timer(
              Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.homeScreen,
                (route) => false,
              ),
            );
          } else {
            Timer(
              Duration(seconds: 2),
              () => Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.loginScreen,
                (route) => false,
              ),
            );
          }
        })
        .onError((error, stacktrace) {
          Timer(
            Duration(seconds: 2),
            () => Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesName.loginScreen,
              (route) => false,
            ),
          );
        });
  }
}
