// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:d_once/presentation/common/navigation_custom/navigation_custom.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/font_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';

class SMSCodeView extends StatefulWidget {
  const SMSCodeView({super.key});

  @override
  State<SMSCodeView> createState() => _SMSCodeViewState();
}

class _SMSCodeViewState extends State<SMSCodeView> {
  List<String> _passCode = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              NavigationCustomView(
                  displayTitle: false,
                  displaySettingButton: false,
                  onPressedBack: () {
                    print("onPressedBack");
                    Navigator.pop(context);
                  },
                  onPressedSetting: () {
                    print("onPressedBack");
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 40, right: 40),
                child: Column(children: [
                  Text(
                    "00:42",
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s34),
                  ),
                  Text(
                    "Type the verification code \nwe’ve sent you",
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  PassCodeView(
                    passCode: _passCode,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                ]),
              ),
            ],
          ),
          KeyboardNumberView(
            onEnterNumberKeyboard: (String value) {
              if (value == "-1" && _passCode.length > 0) {
                setState(() {
                  _passCode.removeLast();
                });

                return;
              }
              if (_passCode.length < 4 && value != "-1") {
                setState(() {
                  _passCode.add(value);
                });
              } else {
                if (_passCode.length == 0) {
                  // handle clear all
                } else {
                  // handle full fill
                  if (true) {
                    Navigator.pushNamed(
                        context, Routes.registerProfileDetailsRoute);
                  }
                }
              }
            },
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _passCode = ["1", "3", "9", "2"];
              });
            },
            child: Text(
              "Send again",
              style: getBoldStyle(color: ColorManager.primary, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class KeyboardNumberView extends StatefulWidget {
  final ValueChanged<String> onEnterNumberKeyboard;

  KeyboardNumberView({Key? key, required this.onEnterNumberKeyboard})
      : super(key: key);

  @override
  State<KeyboardNumberView> createState() => _KeyboardNumberViewState();
}

class _KeyboardNumberViewState extends State<KeyboardNumberView> {
  _handleOnEnterNumberKeyboard(String value) {
    widget.onEnterNumberKeyboard(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("1")},
                  child: Center(
                    child: Text(
                      "1",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("2")},
                  child: Center(
                    child: Text(
                      "2",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("3")},
                  child: Center(
                    child: Text(
                      "3",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("4")},
                  child: Center(
                    child: Text(
                      "4",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("5")},
                  child: Center(
                    child: Text(
                      "5",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("6")},
                  child: Center(
                    child: Text(
                      "6",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("7")},
                  child: Center(
                    child: Text(
                      "7",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("8")},
                  child: Center(
                    child: Text(
                      "8",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("9")},
                  child: Center(
                    child: Text(
                      "9",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: Visibility(
                  visible: false,
                  child: TextButton(
                    onPressed: () => {_handleOnEnterNumberKeyboard("_")},
                    child: Center(
                      child: Text(
                        "_",
                        style:
                            getRegularStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () => {_handleOnEnterNumberKeyboard("0")},
                  child: Center(
                    child: Text(
                      "0",
                      style: getRegularStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  padding: const EdgeInsets.only(top: 10),
                  icon: Image.asset(
                    "assets/images/delete_ic.png",
                    width: 24,
                    height: 18,
                  ),
                  onPressed: () => {_handleOnEnterNumberKeyboard("-1")},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PassCodeView extends StatefulWidget {
  List<String> passCode;
  PassCodeView({Key? key, required this.passCode}) : super(key: key);

  @override
  State<PassCodeView> createState() => _PassCodeViewState();
}

class _PassCodeViewState extends State<PassCodeView> {
  int lengthFields = 4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        lengthFields,
        (index) {
          var number = "_";
          if (index < widget.passCode.length) {
            number = widget.passCode[index];
          }
          if (number == "_") {
            return Container(
              width: 67,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.passCode.length == index
                      ? ColorManager.primary
                      : ColorManager.lightGrey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text("$number",
                    style: getBoldStyle(
                        color: widget.passCode.length == index
                            ? ColorManager.primary
                            : ColorManager.lightGrey,
                        fontSize: 34),
                    textAlign: TextAlign.center),
              ),
            );
          } else {
            return Container(
              width: 67,
              height: 70,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text("$number",
                    style:
                        getBoldStyle(color: ColorManager.white, fontSize: 34),
                    textAlign: TextAlign.center),
              ),
            );
          }
        },
      ),
    );
  }
}
