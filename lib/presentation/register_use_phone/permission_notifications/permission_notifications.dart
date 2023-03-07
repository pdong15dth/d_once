import 'package:d_once/presentation/common/navigation_custom/navigation_custom.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class RequestPermissionNotificationView extends StatefulWidget {
  const RequestPermissionNotificationView({super.key});

  @override
  State<RequestPermissionNotificationView> createState() =>
      _RequestPermissionNotificationViewState();
}

class _RequestPermissionNotificationViewState
    extends State<RequestPermissionNotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              NavigationCustomView(
                displayBack: false,
                displayTitle: false,
                displaySettingButton: true,
                displaySettingTitle: "Skip",
                onPressedBack: () {},
                onPressedSetting: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 80),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/chat.png",
                    ),
                    const SizedBox(height: 56),
                    Text(
                      "Enable notification’s",
                      style:
                          getBoldStyle(color: ColorManager.black, fontSize: 34),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Get push-notification when you get the match or receive a message.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 48),
            child: SizedBox(
              width: double.infinity,
              height: AppSize.s56,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "I want to be notified",
                  style: getBoldStyle(color: ColorManager.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
