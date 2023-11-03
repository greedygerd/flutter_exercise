import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Homescreen(),
        "/detailsScreen": (context) => const DetailsScreen(),
      },
    );
  }
}

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
 final List<String> products = ["Produkt 1", "Produkt 2", "Produkt 3", "Produkt 4", "Produkt 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Homescreen"),
        ),
      ),
      body: ListView(
        children: products.map((product) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.install_mobile),
              title: Text(product),
              onTap: () {
                Navigator.pushNamed(context, "/detailsScreen", arguments: product);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String productName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("DetailsScreen"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Produktname: $productName"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Zurück zum Homescreen"),
            ),
          ],
        ),
      ),
    );
  }
}
