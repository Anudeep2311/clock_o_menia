import 'package:clock_o_menia/ClockViwer.dart';
import 'package:flutter/material.dart';

void main() => runApp( MaterialApp(
  home: Scaffold(
    body: Container(
      color: Color(0xFF2D2F41),
      alignment: Alignment.center,
      child: ClockView(),
    ),

  ),
),);