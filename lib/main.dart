import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StockHomePage(),
    );
  }
}

class Item {
  String name;
  int quantity;

  Item({required this.name, this.quantity = 0});
}

class StockHomePage extends StatefulWidget {
  @override
  _StockHomePageState createState() => _StockHomePageState();
}

class _StockHomePageState extends State<StockHomePage> {
  final List<Item> items = [
    Item(name: 'Item A', quantity: 10),
    Item(name: 'Item B', quantity: 5),
    Item(name: 'Item C', quantity: 8),
  ];

  void _incrementStock(int index) {
    setState(() {
      items[index].quantity++;
    });
  }

  void _decrementStock(int index) {
    setState(() {
      if (items[index].quantity > 0) {
        items[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stock Tracker')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _decrementStock(index),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _incrementStock(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
