import 'package:flutter/material.dart';
import 'dart:math';

var q1 = "Be vulnerable, be courageous, and find comfort in the uncomfortable.";
var q2 = "Prepare like you have never won and perform like you have never lost.";
var q3 = "Trust the process.";
var q4 = "A vision is a dream with a plan.";
var q5 = "You only fail when you stop trying.";
var list = [q1, q2, q3, q4, q5];



class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Center(
            child: const Text(
              "Hello",
              style: TextStyle(fontSize: 38, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}