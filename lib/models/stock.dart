class Stock {
  String symbol;
  String company;
  double price;

  Stock({required this.symbol, required this.company, required this.price});

  static List<Stock> getAll() {
    List<Stock> stocks = [];

    stocks.add(Stock(company: "Apple", symbol: "AAPL", price: 190));
    stocks.add(Stock(company: "Banana", symbol: "BANA", price: 150));

    return stocks;
  }
}
