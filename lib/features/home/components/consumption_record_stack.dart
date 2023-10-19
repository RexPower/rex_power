import 'package:flutter/material.dart';

class ConsumptionRecordStack extends StatefulWidget {
  const ConsumptionRecordStack({super.key});

  @override
  State<ConsumptionRecordStack> createState() => _ConsumptionRecordStackState();
}

class _ConsumptionRecordStackState extends State<ConsumptionRecordStack> {
  @override
  Widget build(BuildContext context) {
    double cardHeight = 100;
    double widthOFirst = (MediaQuery.of(context).size.width * 0.7) - 16;
    double widthOfSecond = (MediaQuery.of(context).size.width * 0.85) - 16;
    double widthOfThird = (MediaQuery.of(context).size.width) - 16;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            left:
                (MediaQuery.of(context).size.width / 2) - (widthOFirst / 2) - 8,
            child: Container(
              width: widthOFirst,
              height: cardHeight,
              child: Card(
                color: Theme.of(context).primaryColor.withOpacity(.3),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: (MediaQuery.of(context).size.width / 2) -
                (widthOfSecond / 2) -
                8,
            child: Container(
              width: widthOfSecond,
              height: cardHeight,
              child: Card(
                color: Theme.of(context).primaryColor.withOpacity(.6),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: (MediaQuery.of(context).size.width / 2) -
                (widthOfThird / 2) -
                8,
            child: Container(
              width: widthOfThird,
              height: cardHeight,
              child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    children: [
                      Text(
                        "Daytime ocnsumption Record",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
