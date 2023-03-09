import 'package:d_once/presentation/home/home.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MainTabbarController extends StatefulWidget {
  const MainTabbarController({super.key});

  @override
  State<MainTabbarController> createState() => _MainTabbarControllerState();
}

class _MainTabbarControllerState extends State<MainTabbarController> {
  int _currentIndexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 34),
          child: TabBar(
            onTap: (index) {
              setState(() {
                _currentIndexTab = index;
              });
            },
            indicator: CustomTabIndicator(),
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.credit_card,
                  color: _currentIndexTab == 0
                      ? ColorManager.primary
                      : ColorManager.blackOpacity40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.heart_broken,
                  color: _currentIndexTab == 1
                      ? ColorManager.primary
                      : ColorManager.blackOpacity40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.chat_sharp,
                  color: _currentIndexTab == 2
                      ? ColorManager.primary
                      : ColorManager.blackOpacity40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: _currentIndexTab == 3
                      ? ColorManager.primary
                      : ColorManager.blackOpacity40,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomeView(),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here 2"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = Offset(offset.dx, 0) & Size(configuration.size!.width, 4.0);
    final paint = Paint()..color = ColorManager.primary;
    canvas.drawRect(rect, paint);
  }
}
