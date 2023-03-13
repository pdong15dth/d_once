import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MatchFriendView extends StatefulWidget {
  const MatchFriendView({super.key});

  @override
  State<MatchFriendView> createState() => _MatchFriendViewState();
}

class _MatchFriendViewState extends State<MatchFriendView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 450,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(75, 50, 0)
                      ..rotateZ(0.3),
                    child: Container(
                        width: 200,
                        height: 280,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                width: 160,
                                height: 240,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorManager.grey.withAlpha(150),
                                      offset: Offset(-4, 8),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/images/girl1.png')),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60 / 2),
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/images/like-red.png",
                                      width: 30,
                                      height: 30,
                                    )),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(-80, 200, 0)
                      ..rotateZ(-0.3),
                    child: Container(
                        width: 200,
                        height: 280,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                width: 160,
                                height: 240,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorManager.grey.withAlpha(150),
                                      offset: Offset(-4, 8),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/images/girl1.png')),
                            Positioned(
                              bottom: -0,
                              left: -0,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(60 / 2),
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      "assets/images/like-red.png",
                                      width: 30,
                                      height: 30,
                                    )),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Text(
              "It’s a match, Jake!",
              style: getBoldStyle(color: ColorManager.primary, fontSize: 36),
            ),
            Text(
              "Start a conversation now with each other",
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Say hello",
                  style: getBoldStyle(color: ColorManager.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primaryOutline),
                onPressed: () {},
                child: Text(
                  "Keep swiping",
                  style: getBoldStyle(color: ColorManager.primary, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
