import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_banking_ui/screens/components/transaction.dart';
import 'package:flutter_banking_ui/colors.dart' as color;

class BarChart extends StatelessWidget {
  final List<Transaction> data;
  const BarChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Transaction, String>> series = [
      charts.Series(
        id: "incoming",
        data: data,
        domainFn: (Transaction series, _) => series.date,
        measureFn: (Transaction series, _) => series.incoming,
      ),
      charts.Series(
        id: "spend",
        data: data,
        domainFn: (Transaction series, _) => series.date,
        measureFn: (Transaction series, _) => series.spending,
      ),
    ];

    return charts.BarChart(series, animate: true);
  }
}
