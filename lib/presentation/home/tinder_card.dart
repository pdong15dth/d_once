import 'dart:async';
import 'dart:ui';

import 'package:d_once/presentation/common/navigation_custom/navigation_custom.dart';
import 'package:d_once/presentation/home/home.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(delay, action);
  }
}

class TinderCard extends StatefulWidget {
  final String image;
  final VoidCallback onPanEnd;
  final VoidCallback? isComplated;
  final bool isDisLikePressed;
  final bool isLikePressed;
  const TinderCard(
      {Key? key,
      required this.image,
      required this.onPanEnd,
      required this.isComplated,
      required this.isDisLikePressed,
      required this.isLikePressed})
      : super(key: key);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  double _xOffset = 0;
  double _yOffset = 0;
  double _angle = 0;
  bool dismissed = false;
  int statusMatch = 0;
  final _debouncer = Debouncer(delay: Duration(milliseconds: 10));
  int _counter = 0;
  bool _isAnimating = true;

  void _makeAnimationDisLike() {
    if (!_isAnimating) {
      return;
    }

    _debouncer.run(() {
      setState(() {
        if (_counter < 40) {
          _counter++;
          _xOffset += -_counter * 0.7;
          _yOffset += -_counter * 0.7;
          _angle = _xOffset / 1000;
        } else {
          _isAnimating = false;
          widget.isComplated!();
          return;
        }
      });
    });
  }

  void _makeAnimationLike() {
    if (!_isAnimating) {
      return;
    }

    _debouncer.run(() {
      setState(() {
        if (_counter < 40) {
          _counter++;
          _xOffset += _counter * 0.7;
          _yOffset += -_counter * 0.7;
          _angle = _xOffset / 1000;
        } else {
          _isAnimating = false;
          widget.isComplated!();
          return;
        }
      });
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _xOffset += details.delta.dx * 0.7;
      _yOffset += details.delta.dy * 0.7;
      _angle = _xOffset / 1000;
      if (_xOffset > 50) {
        statusMatch = 1;
      } else if (_xOffset < -50) {
        statusMatch = 2;
      } else {
        statusMatch = 0;
      }
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      if (_xOffset > 50) {
        dismissed = true;

        print('User swiped right!');
      } else if (_xOffset < -50) {
        dismissed = true;
        print('User swiped left!');
      } else {}
      if (dismissed) {
        print("remove");
        widget.onPanEnd();
      } else {
        _xOffset = 0;
        _yOffset = 0;
        _angle = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.isDisLikePressed == true
        ? {
            if (_counter == 0)
              {
                setState(() {
                  statusMatch = 2;
                })
              },
            _makeAnimationDisLike()
          }
        : null;
    widget.isLikePressed == true
        ? {
            if (_counter == 0)
              {
                print("dongne"),
                setState(() {
                  statusMatch = 1;
                })
              },
            _makeAnimationLike()
          }
        : null;
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform(
        transform: Matrix4.translationValues(_xOffset, _yOffset, 0)
          ..rotateZ(_angle),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (statusMatch != 0) _statusMatchView(statusMatch),
            Visibility(
              visible: true,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 16),
                child: buildBlur(
                  sigmaX: 2,
                  sigmaY: 2,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/local-two.png",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "1 km",
                              style: getBoldStyle(
                                  color: ColorManager.white, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: buildBlur(
                  sigmaX: 4,
                  sigmaY: 4,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jessica Parker, 23",
                              style: getBoldStyle(
                                  color: ColorManager.white, fontSize: 24),
                            ),
                            Text("Professional model"),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBlur({
    required Widget child,
    BorderRadius? borderRadius,
    double sigmaX = 10,
    double sigmaY = 10,
  }) =>
      ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );
}

Widget _statusMatchView(int statusMatch) {
  String icName = statusMatch == 1 ? "like-red" : "close-small";
  return Center(
    child: Container(
      width: 78,
      height: 78,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(78 / 2),
      ),
      child: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/$icName.png",
            width: 40,
            height: 40,
          )),
    ),
  );
}
