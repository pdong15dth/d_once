import 'package:d_once/presentation/home/home.dart';
import 'package:d_once/presentation/home/tinder_card.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TinderActionView extends StatefulWidget {
  const TinderActionView({super.key});

  @override
  State<TinderActionView> createState() => _TinderActionViewState();
}

class _TinderActionViewState extends State<TinderActionView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _curveAnimation;
  late Animation<double> _opacityAnimation;

  List<CardObject> _listCardObjects = [];
  CardObject _card = CardObject(listUrl: [
    'https://toigingiuvedep.vn/wp-content/uploads/2020/12/hinh-nen-phong-canh-thien-nhien-hoa-co-dep.jpg',
    'https://toigingiuvedep.vn/wp-content/uploads/2020/12/anh-phong-canh-thien-nhien-tuyet-dep.jpg',
    'https://uploads.nguoidothi.net.vn/content/f29d9806-6f25-41c0-bcf8-4095317e3497.jpg'
  ]);
  CardObject _card2 = CardObject(listUrl: [
    'https://uploads.nguoidothi.net.vn/content/f29d9806-6f25-41c0-bcf8-4095317e3497.jpg',
    'https://toigingiuvedep.vn/wp-content/uploads/2020/12/hinh-nen-phong-canh-thien-nhien-hoa-co-dep.jpg',
    'https://toigingiuvedep.vn/wp-content/uploads/2020/12/anh-phong-canh-thien-nhien-tuyet-dep.jpg',
  ]);
  CardObject _card3 = CardObject(listUrl: [
    'https://toigingiuvedep.vn/wp-content/uploads/2020/12/hinh-nen-phong-canh-thien-nhien-hoa-co-dep.jpg',
    'https://uploads.nguoidothi.net.vn/content/f29d9806-6f25-41c0-bcf8-4095317e3497.jpg',
    'https://toigingiuvedep.vn/wp-content/uploads/2020/12/anh-phong-canh-thien-nhien-tuyet-dep.jpg',
  ]);

  @override
  void initState() {
    super.initState();
    _listCardObjects = [_card, _card2, _card3];
    _controller =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    _animation = Tween<double>(begin: 231, end: 295).animate(_controller);
    _curveAnimation = Tween<double>(begin: 0, end: 20).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _listCardObjects.length == 0
        ? Center(
            child: Text("no data"),
          )
        : Column(
            children: [
              Stack(
                children: _getMatchCard(),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(78 / 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 5,
                              offset: Offset(0, 4), // Shadow position
                            ),
                          ],
                        ),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                _listCardObjects.removeAt(0);
                                resetAnimation();
                              });
                            },
                            icon: Image.asset("assets/images/close-small.png")),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.withAlpha(100),
                              blurRadius: 5,
                              offset: Offset(0, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset("assets/images/like.png")),
                      ),
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(78 / 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 5,
                              offset: Offset(0, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset("assets/images/star.png")),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  void resetAnimation() {
    _controller.reset();
    _animation = Tween<double>(begin: 231, end: 295).animate(_controller);
    _curveAnimation = Tween<double>(begin: 0, end: 20).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  List<Widget> _getMatchCard() {
    print("re-redering ui");
    List<Widget> cardList = [];
    for (int i = 0; i < _listCardObjects.length; i++) {
      CardObject element = _listCardObjects[i];

      cardList.add(
        i == 0 || i == 1
            ? AnimatedBuilder(
                animation: _animation,
                builder: (_, child) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 295,
                        height: 450,
                        child: TinderCard(
                            key: GlobalKey(debugLabel: UniqueKey().toString()),
                            image: element.listUrl[0],
                            onPanEnd: () {
                              setState(() {
                                _listCardObjects.removeAt(i);
                                resetAnimation();
                              });
                            },
                            isComplated: _animation.isCompleted),
                      ),
                    ),
                  );
                },
              )
            : AnimatedBuilder(
                animation: _animation,
                builder: (_, child) {
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: SizedBox(
                          width: 230,
                          height: 450,
                          child: TinderCard(
                            image: element.listUrl[0],
                            onPanEnd: () {},
                            isComplated: _animation.isCompleted,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    }
    cardList = cardList.reversed.toList();
    return cardList;
  }
}
