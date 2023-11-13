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
        backgroundColor: const Color.fromARGB(249, 203, 203, 203),
        appBar: AppBar(
          title: const Text("Listview Exercise"),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: const [
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

  const ProductItem(this.productName, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed:() {},
          child: const Icon(Icons.shopping_cart),
        ),
        const SizedBox(width: 10), 
        Expanded(
          child: Text(productName, style: const TextStyle(fontSize: 18)),
        ),
        Text(price, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
