import 'package:d_once/presentation/common/navigation_custom/navigation_custom.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SelectGenderView extends StatefulWidget {
  const SelectGenderView({super.key});

  @override
  State<SelectGenderView> createState() => _SelectGenderViewState();
}

class GenderObject {
  String title;
  bool selected;

  GenderObject(this.title, {this.selected = false});
}

class _SelectGenderViewState extends State<SelectGenderView> {
  final List<GenderObject> _genderList = [
    GenderObject("Woman"),
    GenderObject("Man"),
    GenderObject("Choose another"),
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
                displayBack: true,
                displayTitle: false,
                displaySettingButton: true,
                displaySettingTitle: "Skip",
                onPressedBack: () {
                  print("onPressedBack");
                  Navigator.pop(context);
                },
                onPressedSetting: () {
                  print("onPressedBack");
                },
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 48),
                child: Column(children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "I am a",
                      textAlign: TextAlign.center,
                      style:
                          getBoldStyle(color: ColorManager.black, fontSize: 34),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _genderList.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: _genderList[index].selected
                                      ? ColorManager.primary
                                      : ColorManager.white),
                              onPressed: () {
                                setState(() {
                                  _genderList.forEach((element) {
                                    element.selected = false;
                                  });
                                  _genderList[index].selected = true;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.ltr,
                                  children: [
                                    Text(
                                      _genderList[index].title,
                                      style: getBoldStyle(
                                          color: _genderList[index].selected
                                              ? ColorManager.white
                                              : ColorManager.black,
                                          fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.check,
                                      color: _genderList[index].selected
                                          ? ColorManager.white
                                          : ColorManager.blackOpacity40,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
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
                  Navigator.pushNamed(
                      context, Routes.registerSelectPassionRoute);
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
