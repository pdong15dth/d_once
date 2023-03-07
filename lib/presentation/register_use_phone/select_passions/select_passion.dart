import 'package:d_once/presentation/common/navigation_custom/navigation_custom.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SelectPassionView extends StatefulWidget {
  const SelectPassionView({super.key});

  @override
  State<SelectPassionView> createState() => _SelectPassionViewState();
}

class PassionsObject {
  String title;
  IconData icon;
  bool selected;
  PassionsObject(this.title, this.icon, {this.selected = false});
}

class _SelectPassionViewState extends State<SelectPassionView> {
  List<PassionsObject> _passions = [
    PassionsObject("Photography", Icons.camera),
    PassionsObject("Shopping", Icons.shopping_bag),
    PassionsObject("Karaoke", Icons.record_voice_over),
    PassionsObject("Yoga", Icons.bungalow),
    PassionsObject("Cooking", Icons.cookie_sharp),
    PassionsObject("Tennis", Icons.text_increase),
    PassionsObject("Run", Icons.emoji_people),
    PassionsObject("Swimming", Icons.switch_camera_outlined),
    PassionsObject("Art", Icons.art_track),
    PassionsObject("Traveling", Icons.travel_explore),
    PassionsObject("Extreme", Icons.extension_rounded),
    PassionsObject("Music", Icons.music_note),
    PassionsObject("Drink", Icons.local_drink),
    PassionsObject("Video games", Icons.games),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              NavigationCustomView(
                displayTitle: false,
                displaySettingButton: true,
                displaySettingTitle: "Skip",
                onPressedBack: () {
                  Navigator.pop(context);
                },
                onPressedSetting: () {},
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 48),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your interests",
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 34),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select a few of your interests and let everyone know what you’re passionate about.",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 48),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: List.generate(_passions.length, (index) {
                    return SizedBox(
                      height: 46,
                      width: MediaQuery.of(context).size.width / 2 - 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _passions[index].selected
                              ? ColorManager.primary
                              : ColorManager.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _passions[index].selected =
                                !_passions[index].selected;
                          });
                        },
                        child: Row(
                          children: [
                            Icon(
                              _passions[index].icon,
                              color: _passions[index].selected
                                  ? ColorManager.white
                                  : ColorManager.primary,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                _passions[index].title,
                                style: _passions[index].selected
                                    ? getBoldStyle(
                                        color: ColorManager.white,
                                      )
                                    : getRegularStyle(
                                        color: ColorManager.black,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 48),
            child: SizedBox(
              width: double.infinity,
              height: AppSize.s56,
              child: ElevatedButton(
                onPressed: () {
                  List<PassionsObject> passionsSelected =
                      _passions.where((element) => element.selected).toList();
                  passionsSelected.forEach((element) {
                    print(element.title);
                  });

                  Navigator.pushNamed(
                      context, Routes.registerRequestPermissionFriendsRoute);
                },
                child: Text(
                  "Continue",
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
