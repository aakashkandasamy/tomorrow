// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/stocks_list.dart';
import 'package:stocks_app_flutter/models/stock.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 0, 0, 0),
          child: SafeArea(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Stocks", 
                style :TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold)),
              Text("July 9",
                style: TextStyle(
                  color: Color.fromARGB(255, 91, 89, 89),
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),

              Padding(
                padding: EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Color.fromARGB(255, 82, 79, 79)),
                      hintText: "Search",
                      prefix: Icon(Icons.search),
                      fillColor: Colors.grey,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      )
                    ),
                  )
                ),
              ),
              SizedBox(
                height: 310,
                child: StockList(stocks: Stock.getAll())
                )
            ]),
          ))

      ]));

  }
}