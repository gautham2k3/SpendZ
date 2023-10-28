import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'bar_data.dart';

class myBarGraph extends StatelessWidget {

  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  const myBarGraph(this.maxY, this.sunAmount, this.monAmount, this.tueAmount,
      this.wedAmount, this.thuAmount, this.friAmount, this.satAmount, {super.key});

  @override
  Widget build(BuildContext context) {
    BarData myBarGraphData = BarData(sunAmount, monAmount, tueAmount, wedAmount, thuAmount, friAmount, satAmount);
    myBarGraphData.initilizeBar();
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      barGroups: myBarGraphData.barData.map(
            (data) => BarChartGroupData(x: data.x,barRods: [
          BarChartRodData(
            toY: data.y,
            width: 12,
            color: Colors.lightBlueAccent,
            borderSide: BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.circular(3),
          )
        ],
        ),
      ).toList(),
    ));
  }
}