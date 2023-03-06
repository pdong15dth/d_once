// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/strings_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  // ignore: prefer_final_fields
  List<OnboardingSliderData> _list = [
    OnboardingSliderData(
        "Algorithm",
        "Users going through a vetting process to ensure you never match with bots.",
        "assets/images/girl1.png"),
    OnboardingSliderData(
        "Matches",
        "We match you with people that have a large array of similar interests.",
        "assets/images/girl2.png"),
    OnboardingSliderData(
        "Premium",
        "Sign up today and enjoy the first month of premium benefits on us.",
        "assets/images/girl3.png"),
  ];
  OnboardingSliderData? _currentSlider;

  @override
  void initState() {
    super.initState();
    _currentSlider = _list[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.6,
                enlargeFactor: 0.25,
                onPageChanged: (index, value) {
                  setState(() {
                    _currentSlider = _list[index];
                  });
                },
              ),
              items: _list.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      child: Image.asset(
                        item.imageUrl,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            _contentSlider(),
            const SizedBox(
              height: AppSize.s20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p4, right: AppPadding.p4),
                  child: Icon(
                    Icons.circle,
                    size: 8,
                    color: ColorManager.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p4, right: AppPadding.p4),
                  child: Icon(
                    Icons.circle_outlined,
                    size: 8,
                    color: ColorManager.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p4, right: AppPadding.p4),
                  child: Icon(
                    Icons.circle_outlined,
                    size: 8,
                    color: ColorManager.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: AppPadding.p28, right: AppPadding.p28),
              child: SizedBox(
                width: double.infinity,
                height: AppSize.s56,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Create an account"),
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    "Sign In",
                    style: getBoldStyle(color: ColorManager.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _contentSlider() {
    return Column(children: [
      Text(
        _currentSlider?.title ?? "",
        style: getBoldStyle(color: ColorManager.primary, fontSize: 24),
      ),
      const SizedBox(
        height: AppSize.s20,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p40,
          right: AppPadding.p40,
        ),
        child: Text(
          _currentSlider?.description ?? "",
          style: getRegularStyle(color: ColorManager.secondary),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}

class OnboardingSliderData {
  String title;
  String description;
  String imageUrl;

  OnboardingSliderData(this.title, this.description, this.imageUrl);
}
