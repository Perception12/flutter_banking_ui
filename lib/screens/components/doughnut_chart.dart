import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/screens/components/transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_banking_ui/colors.dart' as color;

class DoughnutChart extends StatelessWidget {
  final List<Transaction> data;
  const DoughnutChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        palette: [color.createMaterialColor(color.AppColor.primaryColor)],
        series: <CircularSeries>[
          DoughnutSeries<Transaction, String>(
            dataSource: data,
            xValueMapper: (Transaction series, _) => series.date,
            yValueMapper: (Transaction series, _) =>
                series.incoming + series.spending,
            radius: '100%',
          ),
        ],
      ),
    );
  }
}
