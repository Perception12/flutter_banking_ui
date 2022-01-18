import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/screens/components/doughnut_chart.dart';
import 'package:flutter_banking_ui/screens/components/transaction.dart';
import 'package:flutter_banking_ui/colors.dart' as color;

class MonthlyChart extends StatelessWidget {
  final List<DoughData> data;
  const MonthlyChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<num> amounts = [];
    for (int i = 0; i < data.length; i++) {
      amounts.add(data[i].amount);
    }
    num minAmount = amounts.reduce(min);

    List<Color> colors = [
      color.AppColor.chartColor4,
      color.AppColor.chartColor3,
      color.AppColor.chartColor2,
      color.AppColor.chartColor1,
      color.AppColor.primaryColor,
    ];

    List radius = ['30', '35', '40', '45', '50'];

    return Stack(
      children: <Widget>[
        for (int i = 0; i < data.length; i++)
          DoughnutChart(
            data: [data[i]],
            end_angle: ((minAmount / data[i].amount) * 360).toInt() + 15,
            color: colors[i],
            inner_radius: radius[i],
          )
      ],
    );
  }
}
