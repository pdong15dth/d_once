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
    // _listCardObjects = [_card, _card2, _card3];
    _listCardObjects = [
      CardObject(listUrl: [
        'https://instagram.fsgn5-15.fna.fbcdn.net/v/t51.2885-15/334056393_2503792449777778_5699165876246016453_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=instagram.fsgn5-15.fna.fbcdn.net&_nc_cat=1&_nc_ohc=LEbDUFmMqcUAX8l4tSD&edm=AI8qBrIBAAAA&ccb=7-5&ig_cache_key=MzA0ODkwODMzNzYzOTcxNDA0MQ%3D%3D.2-ccb7-5&oh=00_AfDgbHFr6vJ6PQJsqpAZJYzgnVHkGNWnXifbDk03R1tVZA&oe=640E773A&_nc_sid=a0bfed',
        'https://instagram.fsgn5-6.fna.fbcdn.net/v/t51.2885-15/334291693_169356445887008_7930333660434312649_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=instagram.fsgn5-6.fna.fbcdn.net&_nc_cat=108&_nc_ohc=2EiGzwJk_F0AX_3r3pi&edm=AI8qBrIBAAAA&ccb=7-5&ig_cache_key=MzA1MTU5ODI3NDAxMzExNzc0Mg%3D%3D.2-ccb7-5&oh=00_AfBZ5Ga6p3UAV6FncFbAV3pTJ47ecZSAJD2JmiMh5TpK3Q&oe=640F3FB3&_nc_sid=a0bfed',
        'https://z-p4-instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-15/329231285_248570254162229_802682568970428115_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=z-p4-instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=WPKBvnlmpy4AX9CNii3&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjEzOTU3MzA5OTY2NTE1OQ%3D%3D.2-ccb7-5&oh=00_AfCXNeapwFSBYyASNeJmkWYBCBR4_4CTJzUf2iktcIOLhg&oe=640CFC71&_nc_sid=cff2a4R',
      ]),
      CardObject(listUrl: [
        'https://instagram.fsgn5-8.fna.fbcdn.net/v/t51.2885-15/333280318_875244023582133_1357398622150076589_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-8.fna.fbcdn.net&_nc_cat=109&_nc_ohc=oHmYeyrFAsAAX_N7MAC&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1NDU3Mzk0NjUzOTUwOTMzNA%3D%3D.2-ccb7-5&oh=00_AfAvBekc29BuTDi1UQJ9qLvhYvSm7IaSMHydQeK6JAT1Yg&oe=640F90A5&_nc_sid=cff2a4',
        'https://instagram.fsgn5-15.fna.fbcdn.net/v/t51.2885-15/328146006_4175327256025270_7339111605464631704_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-15.fna.fbcdn.net&_nc_cat=1&_nc_ohc=7XcbHFxN1VwAX-Lke1s&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MDI3MjM1MzQxNTUwOTQwOQ%3D%3D.2-ccb7-5&oh=00_AfB-jQgS79a2OX5rxp0fnUPr7brMfhcfCyRNGEpd__nZzw&oe=640EAB2E&_nc_sid=cff2a4',
        'https://instagram.fsgn5-11.fna.fbcdn.net/v/t51.2885-15/333574925_585726350135074_4041490952726511720_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-11.fna.fbcdn.net&_nc_cat=110&_nc_ohc=kEeB98gpmPcAX_6qY5c&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MDI3MjM1Mzc3NjIzMTg3MA%3D%3D.2-ccb7-5&oh=00_AfCSD48iLqSex99b8u9Jr5wJoIKA0r2W7ejj8himjiYxhQ&oe=640F9268&_nc_sid=cff2a4'
      ]),
      CardObject(listUrl: [
        'https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-15/334514140_3639829656303677_7984723544127430140_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=miL52Pjyc4QAX-Espqd&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjQ0OTA0MzQzOTI0MjQyMQ%3D%3D.2-ccb7-5&oh=00_AfCCEoDE2LJg3-ZbDy_5wQdN26_BZI_J4_aozkw1Uk1dOw&oe=640F4224&_nc_sid=cff2a4',
        'https://instagram.fsgn5-15.fna.fbcdn.net/v/t51.2885-15/332794946_752740822853699_7802451195289570326_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-15.fna.fbcdn.net&_nc_cat=111&_nc_ohc=JWDKCpFjtBEAX8A0Xm6&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjQ0OTA0MzQzMTAwMzcxMA%3D%3D.2-ccb7-5&oh=00_AfAutku_09V-tMSPffvpTl9aBvvlaS710_rEMI-7Is-_Cg&oe=640E0595&_nc_sid=cff2a4',
        'https://instagram.fsgn5-9.fna.fbcdn.net/v/t51.2885-15/332055536_610499457586682_1814362710172668331_n.jpg?stp=dst-jpg_e35_s480x480&_nc_ht=instagram.fsgn5-9.fna.fbcdn.net&_nc_cat=102&_nc_ohc=ad1EPp4Lx0IAX8zgD5M&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MzY3ODQ5NzEyOTk0NjY5NQ%3D%3D.2-ccb7-5&oh=00_AfCrC8l5boe6mI4c5H3eb-0HZydOlVKCaAmnemRt8zNAzg&oe=640DD4AC&_nc_sid=cff2a4'
      ]),
      CardObject(listUrl: [
        'https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-15/334846474_172929182183237_8278542703991169262_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=cicnAeyQClMAX_XGNps&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1NDQ1NDM1NjU5ODIzNjc2MA%3D%3D.2-ccb7-5&oh=00_AfDhtm9NlpaR-RtjuIqWp3nxoFqGNWpEPFLsHzcynSe-Fg&oe=640F535F&_nc_sid=cff2a4',
        'https://instagram.fsgn5-10.fna.fbcdn.net/v/t51.2885-15/334518025_171557635663531_7201125700443819872_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-10.fna.fbcdn.net&_nc_cat=107&_nc_ohc=SDgk1TWWPmMAX8GRJfq&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1NDQ1NDM1NjU0NzgyMDIxOA%3D%3D.2-ccb7-5&oh=00_AfAyPZu1fco5l1NlNKeo8m4pq56OpbdoUEITx6iBYXcTfQ&oe=640DDD3C&_nc_sid=cff2a4',
        'https://instagram.fsgn5-5.fna.fbcdn.net/v/t51.2885-15/334511765_895711844744052_3130503487583994429_n.jpg?stp=dst-jpg_e35&_nc_ht=instagram.fsgn5-5.fna.fbcdn.net&_nc_cat=100&_nc_ohc=HaCbitvMPOEAX-xk2Wy&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1NDQ1OTk1MjAwMDk5NTcxOA%3D%3D.2-ccb7-5&oh=00_AfCA9LcLCFz9SGIWWThD96j-FgavajmIXHVcqgLuD1Behw&oe=640E7C65&_nc_sid=cff2a4'
      ]),
      CardObject(listUrl: [
        'https://instagram.fsgn5-8.fna.fbcdn.net/v/t51.2885-15/333907333_1178314809513681_2359695007718558124_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-8.fna.fbcdn.net&_nc_cat=109&_nc_ohc=NXpYxiqDAO0AX_39AdZ&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MzkyODY5NTE4MTg2MDUxMg%3D%3D.2-ccb7-5&oh=00_AfDUzM8PeiBYnDkrFQxql_P6XsT37a443ZN9GPCOqi4QKQ&oe=640E3791&_nc_sid=cff2a4',
        'https://instagram.fsgn5-3.fna.fbcdn.net/v/t51.2885-15/332749733_192140893453504_796874780750578660_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-3.fna.fbcdn.net&_nc_cat=104&_nc_ohc=iJb7Wxa387QAX95JQKi&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1NDQ1OTI2MzI2MjcyMDUxNg%3D%3D.2-ccb7-5&oh=00_AfDwGM5TULxPm9rYy8LsHI4mVPOnMV34EcoP5BQcqcFCYA&oe=640DB080&_nc_sid=cff2a4',
        'https://instagram.fsgn5-8.fna.fbcdn.net/v/t51.2885-15/332332074_1986130498397805_3526559480962967813_n.jpg?stp=dst-jpg_e35_p480x480&_nc_ht=instagram.fsgn5-8.fna.fbcdn.net&_nc_cat=109&_nc_ohc=iPymCh_7QekAX8EBtcR&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1NDQyODA0NTIxODU0NDI5Nw%3D%3D.2-ccb7-5&oh=00_AfDtm_oYcZA2QWeQBZa5pa7ZJkL5i9_f-JHn6QfKRA9YOQ&oe=640E931A&_nc_sid=cff2a4',
      ]),
      CardObject(listUrl: [
        'https://z-p4-instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-15/329231285_248570254162229_802682568970428115_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=z-p4-instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=WPKBvnlmpy4AX9CNii3&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjEzOTU3MzA5OTY2NTE1OQ%3D%3D.2-ccb7-5&oh=00_AfCXNeapwFSBYyASNeJmkWYBCBR4_4CTJzUf2iktcIOLhg&oe=640CFC71&_nc_sid=cff2a4R',
        'https://z-p4-instagram.fsgn5-13.fna.fbcdn.net/v/t51.2885-15/334485485_154102277497710_6773879432031464458_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=z-p4-instagram.fsgn5-13.fna.fbcdn.net&_nc_cat=106&_nc_ohc=B5ZEtOkv-cYAX_nzzU3&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjMzNjQ3MjIyODUzNzQ2OQ%3D%3D.2-ccb7-5&oh=00_AfDW6x-kVF0XqZB5f3kHjW-NCp58VT39SANLDZiyEE2Azw&oe=640CEBB6&_nc_sid=cff2a4',
        'https://z-p4-instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-15/329231285_248570254162229_802682568970428115_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=z-p4-instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=WPKBvnlmpy4AX9CNii3&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjEzOTU3MzA5OTY2NTE1OQ%3D%3D.2-ccb7-5&oh=00_AfCXNeapwFSBYyASNeJmkWYBCBR4_4CTJzUf2iktcIOLhg&oe=640CFC71&_nc_sid=cff2a4R',
      ]),
      CardObject(listUrl: [
        'https://instagram.fsgn5-15.fna.fbcdn.net/v/t51.2885-15/334056393_2503792449777778_5699165876246016453_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=instagram.fsgn5-15.fna.fbcdn.net&_nc_cat=1&_nc_ohc=LEbDUFmMqcUAX8l4tSD&edm=AI8qBrIBAAAA&ccb=7-5&ig_cache_key=MzA0ODkwODMzNzYzOTcxNDA0MQ%3D%3D.2-ccb7-5&oh=00_AfDgbHFr6vJ6PQJsqpAZJYzgnVHkGNWnXifbDk03R1tVZA&oe=640E773A&_nc_sid=a0bfed',
        'https://instagram.fsgn5-6.fna.fbcdn.net/v/t51.2885-15/334291693_169356445887008_7930333660434312649_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=instagram.fsgn5-6.fna.fbcdn.net&_nc_cat=108&_nc_ohc=2EiGzwJk_F0AX_3r3pi&edm=AI8qBrIBAAAA&ccb=7-5&ig_cache_key=MzA1MTU5ODI3NDAxMzExNzc0Mg%3D%3D.2-ccb7-5&oh=00_AfBZ5Ga6p3UAV6FncFbAV3pTJ47ecZSAJD2JmiMh5TpK3Q&oe=640F3FB3&_nc_sid=a0bfed',
        'https://z-p4-instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-15/329231285_248570254162229_802682568970428115_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=z-p4-instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=WPKBvnlmpy4AX9CNii3&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjEzOTU3MzA5OTY2NTE1OQ%3D%3D.2-ccb7-5&oh=00_AfCXNeapwFSBYyASNeJmkWYBCBR4_4CTJzUf2iktcIOLhg&oe=640CFC71&_nc_sid=cff2a4R',
        'https://z-p4-instagram.fsgn5-13.fna.fbcdn.net/v/t51.2885-15/334485485_154102277497710_6773879432031464458_n.jpg?stp=dst-jpg_e35_p720x720&_nc_ht=z-p4-instagram.fsgn5-13.fna.fbcdn.net&_nc_cat=106&_nc_ohc=B5ZEtOkv-cYAX_nzzU3&edm=AJ9x6zYBAAAA&ccb=7-5&ig_cache_key=MzA1MjMzNjQ3MjIyODUzNzQ2OQ%3D%3D.2-ccb7-5&oh=00_AfDW6x-kVF0XqZB5f3kHjW-NCp58VT39SANLDZiyEE2Azw&oe=640CEBB6&_nc_sid=cff2a4',
      ])
    ];
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

  bool _isDisLikePressed = false;
  bool _isLikePressed = false;

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
                                _isDisLikePressed = true;
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
                            onPressed: () {
                              setState(() {
                                _isLikePressed = true;
                              });
                            },
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
                          isComplated: () {
                            print("Da thuc hien xong animation xoa");
                            setState(() {
                              _isDisLikePressed = false;
                              _isLikePressed = false;
                              _listCardObjects.removeAt(0);
                              resetAnimation();
                            });
                          },
                          isDisLikePressed: i == 0 ? _isDisLikePressed : false,
                          isLikePressed: i == 0 ? _isLikePressed : false,
                        ),
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
                            isComplated: null,
                            isDisLikePressed: false,
                            isLikePressed: false,
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
