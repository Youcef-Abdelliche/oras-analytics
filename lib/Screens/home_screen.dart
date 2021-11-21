import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oras_analytics/Screens/details_screen.dart';
import 'package:oras_analytics/widgets/dropdown_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math' as math;

import '../Constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double percent = 0.0;

  List selectedCategory = [false, true];
  @override
  void initState() {
    // TODO: implement initState
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds: 2000), (_) {
      setState(() {
        percent += 45;
        if (percent <= 100) {
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/picture.png"),
                  radius: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Youcef Abdelliche",
                      style: GoogleFonts.montserrat(textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
                    SizedBox(height: 8),
                    Text(
                      "youcef@gmail.com",
                      style: GoogleFonts.montserrat(textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      )),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      height: 2,
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/icons/hourglass-1543585-1306088.svg"),
                        Text("11/19/2021",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [SvgPicture.asset("assets/icons/star.svg")],
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text("Overall water consumption",
                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700))),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CustomDropdown<int>(
                          icon: Transform.rotate(
                              angle: 90 * math.pi / 180,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text('Month',
                                style: GoogleFonts.montserrat(textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700))),
                          ),
                          onChange: (int value, int index) => print(value),
                          dropdownButtonStyle: DropdownButtonStyle(
                            width: 170,
                            height: 40,
                            elevation: 1,
                            backgroundColor: kPrimaryColor,
                            primaryColor: Colors.white,
                          ),
                          dropdownStyle: DropdownStyle(
                              borderRadius: BorderRadius.circular(8),
                              elevation: 6,
                              padding: EdgeInsets.all(5),
                              color: kPrimaryColor),
                          items: [
                            'Day',
                            'Day / week',
                            'Month',
                          ]
                              .asMap()
                              .entries
                              .map(
                                (item) => DropdownItem<int>(
                                  value: item.key + 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        margin: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color:
                                                kPrimaryColor.withOpacity(0.8)),
                                        child: Text(
                                          item.value,
                                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white)),
                                        )),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                CircularPercentIndicator(
                  radius: 200.0,
                  lineWidth: 20.0,
                  animation: true,
                  percent: percent / 100,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/water-glass-1440342-1216076.svg",
                        width: 40,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1500 liters",
                        style: GoogleFonts.montserrat(textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.grey[300],
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.redAccent,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "safe usage",
                                style: GoogleFonts.montserrat(textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kSecondryColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )))),
                        TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "overusage",
                                style: GoogleFonts.montserrat(textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )))),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "See details",
                            style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white, fontSize: 20)),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        )),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(color: (Colors.white), boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 3))
            ]),
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory[0] = true;
                      selectedCategory[1] = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: (selectedCategory[0]
                            ? kPrimaryColor
                            : Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            "assets/icons/bolt-1439777-1214348.svg",
                            color: selectedCategory[0]
                                ? Colors.white
                                : Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          "Energy",
                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                              color: selectedCategory[0]
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 20)),
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory[1] = true;
                      selectedCategory[0] = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: (selectedCategory[1]
                            ? kPrimaryColor
                            : Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            "assets/icons/water-drop-1442311-1218380.svg",
                            color: selectedCategory[1]
                                ? Colors.white
                                : Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          "Water",
                          style: GoogleFonts.montserrat(textStyle: TextStyle(
                              color: selectedCategory[1]
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 20)),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Criteria {
  int id;
  String name;

  Criteria(this.id, this.name);

  static List<Criteria> getCriteria() {
    return <Criteria>[
      Criteria(1, "Day"),
      Criteria(2, "Day / Week"),
      Criteria(3, "Month"),
    ];
  }
}
