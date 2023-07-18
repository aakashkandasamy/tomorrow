// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app_flutter/pages/home_page.dart';
import 'package:stocks_app_flutter/pages/news.dart';
import 'package:stocks_app_flutter/pages/calendar.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stocks",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Watchlist',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          Widget tabScreen;
          switch (index) {
            case 0:
              tabScreen = NewsFeedScreen();
              break;
            case 1:
              tabScreen = HomePage();
              break;
            case 2:
              tabScreen = CalendarScreen();
              break;
            default:
              tabScreen = CalendarScreen();
          }
          return CupertinoTabView(
            builder: (BuildContext context) => tabScreen,
          );
        },
      ),
    );
  }
}
