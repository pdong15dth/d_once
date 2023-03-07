// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:d_once/app/app_prefs.dart';
import 'package:d_once/app/di.dart';
import 'package:d_once/presentation/common/state_renderer/state_render_impl.dart';
import 'package:d_once/presentation/login/login_viewmodel.dart';
import 'package:d_once/presentation/resources/assets_manager.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/font_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/strings_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p40,
            right: AppPadding.p40,
            top: AppPadding.p100,
            bottom: AppPadding.p40),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppPadding.p40),
                    child: Image.asset(
                      "assets/images/logo_ic.png",
                      width: 108,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 78,
                  ),
                  Text(
                    "Sign up to continue",
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: AppSize.s56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.registerUseEmailSMSRoute);
                      },
                      child: const Text("Continue with email"),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.registerUsePhoneRoute);
                    },
                    child: Text(
                      "Use phone number",
                      style: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: ColorManager.blackOpacity40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'or sign up with',
                          style: getRegularStyle(
                              color: ColorManager.black, fontSize: 12),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: ColorManager.blackOpacity40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/facebook.png'),
                        iconSize: 44,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/google.png'),
                        iconSize: 44,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/apple.png'),
                        iconSize: 44,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Terms of use",
                      style: getRegularStyle(color: ColorManager.primary),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Privacy Policy",
                      style: getRegularStyle(color: ColorManager.primary),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
