import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oras_analytics/widgets/dropdown_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Constants.dart';
import 'dart:math' as math;

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // Fetch content from the json file
  List _items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/db.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
    //print("************************"+_items.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    //readJson();
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (Colors.white),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kPrimaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "water consumption",
                              style: GoogleFonts.montserrat(textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0),
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
                        child: Text('Month',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
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
                                  padding: const EdgeInsets.all(0.0),
                                  child: Container(
                                      margin: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color:
                                              kPrimaryColor.withOpacity(0.8)),
                                      child: Text(
                                        item.value,
                                        style: GoogleFonts.montserrat(textStyle: TextStyle(
                                            fontSize: 18, color: Colors.white)),
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
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              children: [
                Text(
                  "Hydractiva shower",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 6),
                Text(
                  "October - November",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 6),
                SfCartesianChart(
                  series: <SplineSeries>[
                    SplineSeries<SalesData, double>(
                      dataSource: chartData,
                      color: kPrimaryColor,

                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      //  dataLabelSettings: DataLabelSettings(isVisible: true),
                    )
                  ],
                  primaryXAxis:
                      NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3))
                ]),
            child: Column(
              children: [
                Text(
                  "Kitchen optima faucet",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 6),
                Text(
                  "October - November",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w700)),
                ),
                SizedBox(height: 6),
                SfCartesianChart(
                  series: <SplineSeries>[
                    SplineSeries<SalesData, double>(
                      dataSource: chartData2,
                      color: Colors.blue,

                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      //  dataLabelSettings: DataLabelSettings(isVisible: true),
                    )
                  ],
                  primaryXAxis:
                      NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                ),
              ],
            ),
          ),


        ],
      ),
    )));
  }
}

final List<SalesData> chartData = [
  SalesData(1, 25),
  SalesData(2, 12),
  SalesData(3, 24),
  SalesData(4, 18),
  SalesData(5, 30),
  SalesData(6, 30),
  SalesData(7, 10),
  SalesData(8, 0),
  SalesData(9, 30),
  SalesData(10, 15),
  SalesData(11, 30),
  SalesData(12, 15),
  SalesData(13, 30),
  SalesData(14, 15),
  SalesData(15, 30),
  SalesData(16, 10),
  SalesData(17, 15),
  SalesData(18, 0),
  SalesData(19, 30),
  SalesData(20, 15),
  SalesData(21, 10),
  SalesData(22, 30),
  SalesData(23, 15),
  SalesData(24, 30),
  SalesData(26, 10),
  SalesData(27, 15),
  SalesData(28, 5),
  SalesData(29, 10),
  SalesData(30, 15),
];

final List<SalesData> chartData2 = [
  SalesData(1, 5),
  SalesData(2, 12),
  SalesData(3, 10),
  SalesData(4, 15),
  SalesData(5, 20),
  SalesData(6, 30),
  SalesData(7, 0),
  SalesData(8, 20),
  SalesData(9, 10),
  SalesData(10, 13),
  SalesData(11, 10),
  SalesData(12, 25),
  SalesData(13, 10),
  SalesData(14, 5),
  SalesData(15, 25),
  SalesData(16, 10),
  SalesData(17, 25),
  SalesData(18, 15),
  SalesData(19, 20),
  SalesData(20, 10),
  SalesData(21, 15),
  SalesData(22, 20),
  SalesData(23, 15),
  SalesData(24, 30),
  SalesData(26, 15),
  SalesData(27, 10),
  SalesData(28, 5),
  SalesData(29, 15),
  SalesData(30, 10),
];

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
