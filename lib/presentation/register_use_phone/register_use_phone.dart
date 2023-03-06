import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterUsePhoneView extends StatefulWidget {
  const RegisterUsePhoneView({super.key});

  @override
  State<RegisterUsePhoneView> createState() => _RegisterUsePhoneViewState();
}

class _RegisterUsePhoneViewState extends State<RegisterUsePhoneView> {
  final TextEditingController _controller = TextEditingController();
  String _region = '+1';
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p40,
            right: AppPadding.p40,
            top: AppPadding.p100 + AppPadding.p40,
            bottom: AppPadding.p40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "My Phone",
            style: getBoldStyle(color: ColorManager.black, fontSize: 34),
          ),
          Text(
            "Please enter your valid phone number. We will send you a 4-digit code to verify your account.",
            style: getBoldStyle(color: ColorManager.blackOpacity70),
          ),
          const SizedBox(
            height: 32,
          ),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
            textStyle: TextStyle(color: ColorManager.black),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: PhoneNumber(isoCode: 'VN'),
            textFieldController: _controller,
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
          ),
          const SizedBox(
            height: 64,
          ),
          SizedBox(
            width: double.infinity,
            height: AppSize.s56,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.registerUsePhoneSMSRoute);
              },
              child: Text(
                "Continue",
                style: getBoldStyle(color: ColorManager.white, fontSize: 16),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
