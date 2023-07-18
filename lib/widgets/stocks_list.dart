import 'package:flutter/material.dart';
import 'package:stocks_app_flutter/models/stock.dart';

class StockList extends StatelessWidget {
  final List<Stock> stocks;

  StockList({super.key, required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: stocks.length,
      separatorBuilder: (context, index) {
        return Divider(color: Colors.grey);
      },
      itemBuilder: (context, index) {
        return Text(
            "${stocks[index].symbol} - ${stocks[index].price.toStringAsFixed(2)}",
            style: TextStyle(color: Colors.white));
      },
    );
  }
}
