import 'package:clima/utilities/colours.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularIndicator extends StatefulWidget {
  final Color indicatorColor;
  final double percent;
  final String icon;
  final String title;
  final String amount;
  final String mark;

  const CircularIndicator(
      {this.indicatorColor,
      this.percent,
      this.icon,
      this.title,
      this.mark,
      this.amount});

  @override
  _CircularIndicatorState createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  double amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
      ),
      child: Container(
        height: 170,
        width: 110,
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.indicatorColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: CircularPercentIndicator(
          radius: 80.0,
          lineWidth: 5.0,
          animation: true,
          percent: widget.percent,
          center: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: light,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image.asset(
                widget.icon,
                height: 35,
                width: 35,
              ),
            ),
          ),
          footer: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    widget.amount,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: light),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    widget.mark,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                        color: light),
                  ),
                ],
              ),
              Text(
                widget.title,
                style: TextStyle(fontSize: 12.0, color: light),
              ),
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: light,
        ),
      ),
    );
  }
}
