// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';

enum RegisterType {
  Email,
  Phone,
}

class RegisterUsePhoneOrEmailView extends StatefulWidget {
  final RegisterType type;
  RegisterUsePhoneOrEmailView({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<RegisterUsePhoneOrEmailView> createState() =>
      _RegisterUsePhoneOrEmailViewState();
}

class _RegisterUsePhoneOrEmailViewState
    extends State<RegisterUsePhoneOrEmailView> {
  final TextEditingController _controller = TextEditingController();
  String _region = '+1';
  String _phoneNumber = '';
  String _title = "";
  String _description = "";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _title =
        widget.type == RegisterType.Phone ? "My mobile" : "My email address";
    _description = widget.type == RegisterType.Phone
        ? "Please enter your valid phone number. We will send you a 4-digit code to verify your account. "
        : "Please enter your valid email address. We will send you a 4-digit code to verify your account. ";
  }

  Widget contentView() {
    return widget.type == RegisterType.Phone
        ? InternationalPhoneNumberInput(
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
          )
        : Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 36),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "Email address", labelText: "Email address"),
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
  }

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
            _title,
            style: getBoldStyle(color: ColorManager.black, fontSize: 34),
          ),
          Text(
            _description,
            style: getBoldStyle(color: ColorManager.blackOpacity70),
          ),
          const SizedBox(
            height: 32,
          ),
          contentView(),
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
