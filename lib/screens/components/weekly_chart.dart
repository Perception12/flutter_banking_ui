import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_banking_ui/screens/components/transaction.dart';
import 'package:flutter_banking_ui/colors.dart' as color;

class WeeklyChart extends StatelessWidget {
  final List<Transaction> data;
  const WeeklyChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Transaction, String>> series = [
      charts.Series(
          id: "incoming",
          data: data,
          domainFn: (Transaction series, _) => series.date,
          measureFn: (Transaction series, _) => series.incoming,
          seriesColor:
              charts.ColorUtil.fromDartColor(color.AppColor.greyColor)),
      charts.Series(
          id: "spend",
          data: data,
          domainFn: (Transaction series, _) => series.date,
          measureFn: (Transaction series, _) => series.spending,
          seriesColor:
              charts.ColorUtil.fromDartColor(color.AppColor.primaryColor)),
    ];

    return charts.BarChart(
      series, animate: true,
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(30),
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
              fontSize: 12, // size in Pts.
              color: charts.ColorUtil.fromDartColor(color.AppColor.greyColor)),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.ColorUtil.fromDartColor(color.AppColor.greyColor),
          ),
        ),
      ),

      /// Assign a custom style for the measure axis.
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
          // Tick and Label styling here.
          labelStyle: charts.TextStyleSpec(
              fontSize: 12, // size in Pts.
              color: charts.ColorUtil.fromDartColor(color.AppColor.greyColor)),

          // Change the line colors to match text color.
          lineStyle: charts.LineStyleSpec(
            color: charts.ColorUtil.fromDartColor(color.AppColor.greyColor),
          ),
        ),
      ),
    );
  }
}
