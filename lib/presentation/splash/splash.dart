import 'dart:async';

import 'package:d_once/app/app_prefs.dart';
import 'package:d_once/app/di.dart';
import 'package:d_once/presentation/resources/assets_manager.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
          // if (isUserLoggedIn)
          //   {
          //     // navigate to main screen
          //     Navigator.pushReplacementNamed(context, Routes.mainRoute)
          //   }
          // else
          //   {
          //     _appPreferences
          //         .isOnBoardingScreenViewed()
          //         .then((isOnBoardingScreenViewed) => {
          //               if (isOnBoardingScreenViewed)
          //                 {
          //                   Navigator.pushReplacementNamed(
          //                       context, Routes.loginRoute)
          //                 }
          //               else
          //                 {
          //                   Navigator.pushReplacementNamed(
          //                       context, Routes.onBoardingRoute)
          //                 }
          //             })
          //   }
        });
  }

  @override
  void initState() {
    super.initState();
    print("_startDelay");
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/images/logo_ic.png"),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
