import 'package:flutter/material.dart';
import 'package:chart_it/chart_it.dart';
import 'package:get/get.dart';
import 'package:rexpower/utilities/generate_random_color.dart';

class DailyUsageChart extends StatefulWidget {
  const DailyUsageChart({super.key});

  @override
  State<DailyUsageChart> createState() => _DailyUsageChartState();
}

class _DailyUsageChartState extends State<DailyUsageChart> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartStyle: RadialChartStyle(
          backgroundColor: Get.isDarkMode ? Colors.black : Colors.white),
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height / 2) + 100,
      data: PieSeries(
        donutRadius: 50.0,
        interactionEvents: const PieInteractionEvents(isEnabled: true),
        donutSpaceColor: Colors.white,
        donutLabel: () => '1,500 watts',
        slices: <SliceData>[
          for (int i = 0; i < 24; i++)
            SliceData(
              style:
                  SliceDataStyle(radius: 105.0, color: generateRandomColor()),
              label: (percent, value) => '$i:00',
              value: 1500 / 24,
            )
        ],
      ),
    );
  }
}
