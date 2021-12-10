import 'package:flutter/material.dart';
import '../colors.dart' as color;
import 'components/barchart.dart';
import 'components/piechart.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String period = 'Week';
  int balance = 2000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.mainBackground,
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, left: 30, bottom: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "2020",
              style: TextStyle(
                color: color.AppColor.greyColor,
              ),
            ),
            Row(
              children: [
                const Text(
                  "May 12 - Jun 22",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Container(
                  height: 30,
                  padding: const EdgeInsets.only(
                      top: 0, left: 15, bottom: 0, right: 15),
                  decoration: BoxDecoration(
                    color: color.AppColor.greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: period,
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      iconSize: 24,
                      onChanged: (String? newPeriod) {
                        setState(() {
                          period = newPeriod!;
                        });
                      },
                      items: <String>['Week', 'Month']
                          .map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                "\$ $balance",
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            period == 'Week' ? const BarChart() : const PieChart(),
          ],
        ),
      ),
    );
  }
}
