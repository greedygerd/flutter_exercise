import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(249, 203, 203, 203),
        appBar: AppBar(
          title: Text("Listview Exercise"),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              ProductItem("Product 1", "\$10.99"),
              ProductItem("Product 2", "\$15.99"),
              ProductItem("Product 3", "\$8.99"),
              ProductItem("Product 4", "\$12.49"),
              ProductItem("Product 5", "\$7.99"),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String productName;
  final String price;

  const ProductItem(this.productName, this.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed:() {},
          child: Icon(Icons.shopping_cart),
        ),
        SizedBox(width: 10), 
        Expanded(
          child: Text(productName, style: TextStyle(fontSize: 18)),
        ),
        Text(price, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
