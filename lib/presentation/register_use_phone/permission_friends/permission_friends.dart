import 'package:d_once/presentation/common/navigation_custom/navigation_custom.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class RequestPermissionFriendsView extends StatefulWidget {
  const RequestPermissionFriendsView({super.key});

  @override
  State<RequestPermissionFriendsView> createState() =>
      _RequestPermissionFriendsViewState();
}

class _RequestPermissionFriendsViewState
    extends State<RequestPermissionFriendsView> {
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
                      "assets/images/people.png",
                    ),
                    const SizedBox(height: 56),
                    Text(
                      "Search friend’s",
                      style: getBoldStyle(
                          color: ColorManager.black, fontSize: 34),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "You can find friends from your contact lists to connected",
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
                onPressed: () {
                  Navigator.pushNamed(context, Routes.registerRequestPermissionNotificationsRoute);
                },
                child: Text(
                  "Access to a contact list",
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
