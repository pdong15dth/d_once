import 'package:d_once/presentation/login/login.dart';
import 'package:d_once/presentation/onboarding/onboarding.dart';
import 'package:d_once/presentation/register_use_phone/register_profile_details/register_profile_details.dart';
import 'package:d_once/presentation/register_use_phone/register_use_phone.dart';
import 'package:d_once/presentation/register_use_phone/select_gender/select_gender.dart';
import 'package:d_once/presentation/register_use_phone/sms_code/sms_code.dart';
import 'package:d_once/presentation/resources/strings_manager.dart';
import 'package:d_once/presentation/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app/di.dart';

class Routes {
  static const String splashRoute = "/123"; // update /
  static const String onBoardingRoute = "/onBoarding"; // update /onBoarding
  static const String loginRoute = "/login"; // update /login
  static const String registerRoute = "/register";
  static const String registerUsePhoneRoute =
      "/registerUsePhone"; // update /registerUsePhone
  static const String registerUsePhoneSMSRoute =
      "/registerUsePhoneSMSRoute"; // update /registerUsePhoneSMSRoute
  static const String registerProfileDetailsRoute =
      "/registerProfileDetailsRoute"; // update /registerProfileDetailsRoute
  static const String registerSelectGenderRoute =
      "/"; // update /registerSelectGenderRoute
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        //initLoginModule(); // init viewmodel by DI
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerUsePhoneRoute:
        return MaterialPageRoute(builder: (_) => const RegisterUsePhoneView());
      case Routes.registerUsePhoneSMSRoute:
        return MaterialPageRoute(builder: (_) => const SMSCodeView());
      case Routes.registerProfileDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const RegisterProfileDetailsView());
      case Routes.registerSelectGenderRoute:
        return MaterialPageRoute(
            builder: (_) => const SelectGenderView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound).tr(),
              ),
              body: Center(child: Text(AppStrings.noRouteFound).tr()),
            ));
  }
}
