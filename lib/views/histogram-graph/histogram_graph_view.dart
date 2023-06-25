import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../models/class_model.dart';
import '../../widgets/appbar_action_sobre.dart';
import '../../widgets/base_background.dart';
import '../../widgets/cs_appbar.dart';

class HistogramGraphView extends StatefulWidget {
  const HistogramGraphView({
    required this.classes,
    super.key,
  });

  final List<ClassModel> classes;

  @override
  State<HistogramGraphView> createState() => _HistogramGraphViewState();
}

class _HistogramGraphViewState extends State<HistogramGraphView> {
  @override
  Widget build(BuildContext context) {
    return BaseBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CsAppbar(
          title: 'Tabela de Distribuição de Frequências',
          actions: [AppbarActionSobre()],
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Histograma das Classes',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      barGroups: [
                        for (int i = 0; i < widget.classes.length; i++) ...[
                          BarChartGroupData(
                            x: i,
                            showingTooltipIndicators: [0],
                            barsSpace: 0,
                            barRods: [
                              BarChartRodData(
                                toY: widget.classes[i].frequenciaAbsoluta.toDouble(),
                                width: (MediaQuery.of(context).size.width * widget.classes.length) / (100),
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue[900]!,
                                    Colors.blue[900]!,
                                    Colors.blue[600]!,
                                    Colors.blue[900]!,
                                    Colors.blue[900]!,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                      barTouchData: BarTouchData(
                        enabled: true,
                        allowTouchBarBackDraw: true,
                        handleBuiltInTouches: true,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipMargin: 0,
                          tooltipRoundedRadius: 8,
                          tooltipBorder: const BorderSide(style: BorderStyle.none, color: Colors.transparent),
                          getTooltipItem: (data, dataIndex, rod, rodIndex) {
                            return BarTooltipItem(
                              '${rod.toY.toInt()}',
                              const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      maxY: widget.classes.map<int>((e) => e.frequenciaAbsoluta).toList().reduce((e, p) => max(e, p)) + 2,
                      minY: 0,
                      alignment: BarChartAlignment.spaceAround,
                      backgroundColor: Colors.black.withOpacity(0.5),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        drawVerticalLine: false,
                        horizontalInterval: 1,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.white,
                            strokeWidth: 2,
                            dashArray: [0, 2, 3],
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        topTitles: AxisTitles(),
                        bottomTitles: AxisTitles(
                          axisNameWidget: const Text(
                            'Classes',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (index, meta) {
                              final classe = widget.classes[index.toInt()];

                              return Text(
                                '${classe.limiteInferior} |----- ${classe.limiteSuperior}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              );
                            },
                            reservedSize: 20,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          axisNameWidget: const Text(
                            'Frequência absoluta',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          sideTitles: SideTitles(
                            getTitlesWidget: (value, __) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '${value.toInt()}',
                                  textScaleFactor: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                            interval: 1,
                            showTitles: true,
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            getTitlesWidget: (value, __) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '${value.toInt()}',
                                  textScaleFactor: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                            interval: 1,
                            showTitles: true,
                            reservedSize: 50,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(border: Border.all(color: Colors.white, width: 3)),
                    ),
                    swapAnimationCurve: Curves.linearToEaseOut,
                    swapAnimationDuration: const Duration(milliseconds: 500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
