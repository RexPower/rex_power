import 'package:flutter/material.dart';
import 'package:rexpower/global_components/global_heading_text.dart';

class SummaryCard extends StatefulWidget {
  List<SummaryCardItem> columns;

  SummaryCard({super.key, required this.columns});

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    assert(widget.columns.length == 3);

    return Card(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [for (var column in widget.columns) column]),
      ),
    );
  }
}

class SummaryCardItem extends StatelessWidget {
  String titleText;
  String valueText;

  SummaryCardItem(
      {super.key, required this.titleText, required this.valueText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleText,
          style: const TextStyle(color: Colors.white),
        ),
        GlobalHeadingText(
          valueText,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
