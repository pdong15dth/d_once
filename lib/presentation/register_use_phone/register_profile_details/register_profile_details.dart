import 'package:d_once/app/extensions.dart';
import 'package:d_once/presentation/base/polygon_painter.dart';
import 'package:d_once/presentation/common/navigation_custom/navigation_custom.dart';
import 'package:d_once/presentation/resources/color_manager.dart';
import 'package:d_once/presentation/resources/routes_manager.dart';
import 'package:d_once/presentation/resources/styles_manager.dart';
import 'package:d_once/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterProfileDetailsView extends StatefulWidget {
  const RegisterProfileDetailsView({super.key});

  @override
  State<RegisterProfileDetailsView> createState() =>
      _RegisterProfileDetailsViewState();
}

class _RegisterProfileDetailsViewState
    extends State<RegisterProfileDetailsView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              NavigationCustomView(
                displayBack: false,
                displayTitle: false,
                displaySettingButton: true,
                displaySettingTitle: "Skip",
                onPressedBack: () {
                  print("onPressedBack");
                  Navigator.pop(context);
                },
                onPressedSetting: () {
                  print("onPressedBack");
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Profile details",
                        textAlign: TextAlign.center,
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 34),
                      ),
                    ),
                    const SizedBox(height: 90),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const AvatarFormSelect(),
                          const SizedBox(height: 36),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "First name",
                                labelText: "First name"),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Last name", labelText: "Last name"),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: AppSize.s56,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.primaryOutline,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    builder: (BuildContext context) {
                                      return CalendarView();
                                    });
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                        "assets/images/calendar.png",
                                        width: 18,
                                        height: 20),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Choose birthday date",
                                      style: getBoldStyle(
                                          color: ColorManager.primary,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 48),
            child: SizedBox(
              width: double.infinity,
              height: AppSize.s56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.registerSelectGenderRoute);
                },
                child: Text(
                  "Confirm",
                  style: getBoldStyle(color: ColorManager.white, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CalendarData {}

class CalendarView extends StatefulWidget {
  const CalendarView({
    super.key,
  });

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  var now = DateTime.now();
  var daysInMonth = DateTime(DateTime.now().year, DateTime.now().month + 1)
      .difference(DateTime(DateTime.now().year, DateTime.now().month))
      .inDays;
  int _selectDay = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 515,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(children: [
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - 27.5,
          top: 0,
          child: SizedBox(
            child: Center(
              child: SvgPicture.asset("assets/images/indicator.svg",),
            ),
          ),
        ),
        
        CustomPaint(
          size: Size.infinite,
          painter: PolygonPainter(),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _showCalendar(0);
                        },
                        icon: const Icon(Icons.keyboard_arrow_left),
                      ),
                      Column(
                        children: [
                          Text(
                            "Birthday",
                            style: getRegularStyle(color: ColorManager.black),
                          ),
                          Text(
                            "${now.year}",
                            style: getBoldStyle(
                                color: ColorManager.primary, fontSize: 34),
                          ),
                          Text(
                            now.month.convertMonthIntToString(),
                            style: getRegularStyle(color: ColorManager.primary),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          _showCalendar(1);
                        },
                        icon: const Icon(Icons.keyboard_arrow_right),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 16,
                    ),
                    height: 43 * 6,
                    child: Wrap(
                      children: List.generate(
                        daysInMonth,
                        (index) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              print(index + 1);
                              setState(() {
                                _selectDay = index + 1;
                              });
                            },
                            child: Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                color: (index + 1) == _selectDay
                                    ? ColorManager.primary
                                    : ColorManager.white,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text(
                                  '${index + 1}',
                                  style: getRegularStyle(
                                      color: (index + 1) == _selectDay
                                          ? ColorManager.white
                                          : ColorManager.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        print(DateTime(now.year, now.month, _selectDay));
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Save",
                        style: getBoldStyle(
                            color: ColorManager.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void _showCalendar(int type) {
    if (type == 0) {
      int year = now.year;
      int month = now.month;
      int previusMonth = month - 1;
      DateTime previusTime = DateTime(year, previusMonth);
      int inDays = DateTime(now.year, now.month).difference(previusTime).inDays;
      setState(() {
        now = previusTime;
        daysInMonth = inDays;
      });
    } else {
      int year = now.year;
      int month = now.month;
      int nextMonth = month + 1;
      DateTime nextTime = DateTime(year, nextMonth);
      // calculate days next next time
      int year2 = nextTime.year;
      int month2 = nextTime.month;
      int nextMonth2 = month2 + 1;
      DateTime nextTime2 = DateTime(year2, nextMonth2);
      int inDays = nextTime2.difference(nextTime).inDays;

      setState(() {
        now = nextTime;
        daysInMonth = inDays;
      });
    }
  }
}

class AvatarFormSelect extends StatelessWidget {
  const AvatarFormSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 101,
      height: 106,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/avatar.png"),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: IconButton(
                icon: Image.asset(
                  "assets/images/camera.png",
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
