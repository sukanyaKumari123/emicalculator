import "dart:math";

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    title: 'EMI Calculator',
    theme: ThemeData(
      primaryColor: Colors.redAccent,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.redAccent),
    ),
    home: EMICalculator()));

class EMICalculator extends StatefulWidget {
  // const EMICalculator({super.key});

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  double principal = 0.0;
  double rate = 0.0;

  double time = 0.0;
  double a = 0.0;

  amountCalc() {
    setState(() {
      double r = rate / 12.0 / 100.0;
      double t = time * 12.0;
      a = (principal * r * pow(1 + r, t) / (pow(1 + r, t) - 1));
      //double amount = a.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("EMI CALCULATOR"),
      ),
      body: Column(children: <Widget>[
        Slider(
            min: 0,
            max: 200000,
            activeColor: Colors.teal,
            inactiveColor: Colors.tealAccent,
            onChanged: (_principal) {
              setState(() {
                principal = _principal;
              });
            },
            // divisions: 10,
            value: principal),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.teal),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Principal",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Text(
                      '${double.parse(principal.toStringAsFixed(0))}',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
              )),
        ),
        Slider(
            min: 0,
            max: 20,
            activeColor: Colors.teal,
            inactiveColor: Colors.teal[100],
            onChanged: (_rate) {
              setState(() {
                rate = _rate;
              });
            },
            // divisions: 10,
            value: rate),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.teal),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Interest rate",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Text(
                      '${double.parse(rate.toStringAsFixed(1))}%',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
              )),
        ),
        Slider(
            min: 0,
            max: 10,
            activeColor: Colors.teal,
            inactiveColor: Colors.teal[100],
            onChanged: (_time) {
              setState(() {
                time = _time;
              });
            },
            divisions: 10,
            value: time),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.teal),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Tenure",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Text(
                      '${double.parse(time.toStringAsFixed(0))}years',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    )
                  ],
                ),
              )),
        ),
        Flexible(
            fit: FlexFit.loose,
            child: ElevatedButton(
              onPressed: amountCalc,
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 30.0, color: Colors.teal),
              ),
            )),
        Text(
          "The total monthly amount is ${double.parse(a.toStringAsFixed(2))}",
          style: TextStyle(fontSize: 20.0, color: Colors.pink),
        )
      ]),
    ));
  }
}
