import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/presentation/custom_icons_icons.dart';
import 'package:flutter_banking_ui/screens/components/barchart_legend.dart';
import 'package:flutter_banking_ui/screens/components/piechart_legend.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import '../colors.dart' as color;
import 'components/barchart.dart';
import 'components/piechart.dart';
import 'components/purchase.dart';
import 'components/transaction.dart';

final formatCurrency = NumberFormat.simpleCurrency();

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List transData = [];
  List<Transaction> data = [];
  List transactions = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/data.json")
        .then((value) => {transactions = json.decode(value)});
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  String period = 'Week';
  final double _balance = 2090.20;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < transactions.length; i++) {
      data += [
        Transaction(
          date: transactions[i]["date"],
          incoming: transactions[i]["incomingPrice"],
          spending: transactions[i]["spendingPrice"],
        )
      ];
    }

    return Scaffold(
      backgroundColor: color.AppColor.mainBackground,
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, left: 30, bottom: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "2021",
              style: TextStyle(
                color: color.AppColor.greyColor,
              ),
            ),
            Row(
              children: [
                const Text(
                  "May 12 - Jun 22",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    formatCurrency.format(_balance),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Current Balance"),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: period == 'Week' ? BarChart(data: data) : const PieChart(),
            ),
            period == 'Week' ? const BarChartLegend() : const PieChartLegend(),
            Container(
              height: 2,
              color: color.AppColor.greyColor,
            ),
            const SizedBox(height: 20),
            const Text(
              "Spending",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Purchase(
                  name: "Travel",
                  icon: Icon(
                    CustomIcons.new_york_liberty_statue_svgrepo_com,
                    color: color.AppColor.primaryColor,
                  ),
                  price: 700.00,
                ),
                const SizedBox(width: 60),
                Purchase(
                  name: "Taxi",
                  icon: Icon(
                    Icons.directions_car,
                    color: color.AppColor.primaryColor,
                  ),
                  price: 420.21,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Purchase(
                  name: "Cafe",
                  icon: Icon(
                    Icons.local_cafe,
                    color: color.AppColor.primaryColor,
                  ),
                  price: 324.22,
                ),
                Expanded(child: Container()),
                Purchase(
                  name: "Food",
                  icon: Icon(
                    Icons.restaurant,
                    color: color.AppColor.primaryColor,
                  ),
                  price: 584.81,
                ),
              ],
            ),
            Expanded(child: Container()),
            SizedBox(
              height: 60,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: color.AppColor.greyColor,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                        color: color.AppColor.greyColor,
                      ),
                      const SizedBox(width: 30),
                      Icon(
                        Icons.bar_chart,
                        size: 30,
                        color: color.AppColor.primaryColor,
                      ),
                      const SizedBox(width: 30),
                      Container(
                        width: 60,
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        decoration: BoxDecoration(
                          color: color.AppColor.primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(Icons.add,
                            size: 30, color: Colors.white),
                      ),
                      const SizedBox(width: 30),
                      Icon(
                        Icons.credit_card_rounded,
                        size: 30,
                        color: color.AppColor.greyColor,
                      ),
                      const SizedBox(width: 30),
                      Icon(
                        Icons.person,
                        size: 30,
                        color: color.AppColor.greyColor,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
