import 'package:flutter/material.dart';
import 'package:stocks_app_flutter/models/stock.dart';
import 'package:stocks_app_flutter/widgets/stocks_list.dart';
import 'package:intl/intl.dart';

String today = DateFormat('MMMM d').format(DateTime.now());

List<Stock> allStocks = Stock.getAll();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  void addNewStock(String value) {
    setState(() {
      allStocks.add(Stock(company: value, symbol: value, price: 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 0, 0, 0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Stocks",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    today,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 91, 89, 89),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          hintText: "Search",
                          prefix: Icon(Icons.search),
                          fillColor: Colors.grey[800],
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                        onSubmitted: addNewStock,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  SizedBox(
                    height: 310,
                    child: StockList(stocks: allStocks),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
