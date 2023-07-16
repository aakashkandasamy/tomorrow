// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class CalendarScreen extends StatelessWidget {
  const CalendarScreen();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
        ),
        body: Center(
          child: Text('calendar stuff here'),
        ),
      ),
    );
  }
}
