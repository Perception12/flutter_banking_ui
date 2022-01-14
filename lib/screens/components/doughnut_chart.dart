import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/screens/components/transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatefulWidget {
  final List<DoughData> data;
  final int end_angle;
  final Color color;
  final String inner_radius;
  const DoughnutChart({
    Key? key,
    required this.data,
    required this.end_angle,
    required this.color,
    required this.inner_radius,
  }) : super(key: key);

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  late List<DoughData> _chartData;

  @override
  void initState() {
    _chartData = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        palette: [widget.color],
        series: <CircularSeries>[
          DoughnutSeries<DoughData, String>(
            dataSource: _chartData,
            xValueMapper: (DoughData series, _) => series.date,
            yValueMapper: (DoughData series, _) => series.amount,
            startAngle: 15,
            endAngle: widget.end_angle,
            innerRadius: widget.inner_radius,
            opacity: 0.8,
          ),
        ],
      ),
    );
  }
}
