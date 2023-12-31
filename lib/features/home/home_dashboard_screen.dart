import 'package:flutter/material.dart';
import 'package:rexpower/features/home/components/consumption_record_stack.dart';
import 'package:rexpower/features/home/components/global_bottom_nav.dart';
import 'package:rexpower/features/home/components/summary_card.dart';
import 'package:rexpower/global_components/global_appbar.dart';
import 'package:rexpower/features/home/components/daily_usage_chart.dart';
import 'package:rexpower/global_components/global_heading_text.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalAppBar(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    GlobalHeadingText('Daily Usage'),
                    const DailyUsageChart(),
                    SummaryCard(
                      columns: [
                        SummaryCardItem(
                            titleText: "Peak usage", valueText: "250w"),
                        SummaryCardItem(
                            titleText: "Lowest usage", valueText: "20w"),
                        SummaryCardItem(
                            titleText: "Units used", valueText: "N200"),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GlobalHeadingText('Consumption Record'),
                    ConsumptionRecordStack(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GlobalBottomNav(),
      ),
    );
  }
}
