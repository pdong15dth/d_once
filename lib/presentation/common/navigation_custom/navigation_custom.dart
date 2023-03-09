import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/font_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class TitleNavigationObject {
  String? title;
  String? subTitle;

  TitleNavigationObject({required this.title, required this.subTitle});
}

class NavigationCustomView extends StatefulWidget {
  var displayBack;
  var displayTitle;
  var displaySettingButton;
  var displaySettingTitle;
  TitleNavigationObject? titleNavigationObject;
  final VoidCallback onPressedBack;
  final VoidCallback onPressedSetting;

  NavigationCustomView({
    Key? key,
    this.displayBack = true,
    required this.displayTitle,
    this.titleNavigationObject,
    required this.displaySettingButton,
    this.displaySettingTitle = "",
    required this.onPressedBack,
    required this.onPressedSetting,
  }) : super(key: key);

  @override
  State<NavigationCustomView> createState() => _NavigationCustomViewState();
}

class _NavigationCustomViewState extends State<NavigationCustomView> {
  _handlePressBack() {
    widget.onPressedBack(); // call the callback function
  }

  _handlePressSetting() {
    widget.onPressedSetting(); // call the callback function
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: widget.displayBack,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // adjust the radius value as needed
                border: Border.all(
                  width: 1,
                  color: ColorManager.greyBorder,
                ),
              ),
              child: IconButton(
                iconSize: 24,
                icon: Image.asset('assets/images/arrow_back_right.png'),
                onPressed: _handlePressBack,
              ),
            ),
          ),
          Visibility(
            visible: widget.displayTitle,
            child: Column(
              children: [
                Text(
                  widget.titleNavigationObject?.title ?? "",
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.s24),
                ),
                Text(
                  widget.titleNavigationObject?.subTitle ?? "",
                  style: getRegularStyle(
                      color: ColorManager.blackOpacity70,
                      fontSize: FontSize.s12),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.displaySettingButton,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10), // adjust the radius value as needed
                border: Border.all(
                  width: widget.displaySettingTitle == "" ? 1 : 0,
                  color: widget.displaySettingTitle == ""
                      ? ColorManager.greyBorder
                      : ColorManager.white,
                ),
              ),
              child: widget.displaySettingTitle == ""
                  ? IconButton(
                      iconSize: 24,
                      icon: Image.asset('assets/images/setting-config.png'),
                      onPressed: _handlePressSetting,
                    )
                  : TextButton(
                      onPressed: _handlePressSetting,
                      child: Text(
                        widget.displaySettingTitle,
                        style: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s16),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
