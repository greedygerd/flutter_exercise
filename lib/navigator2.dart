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
        "/":(context) => Homescreen(),
        "/detailsScreen":(context) => DetailsScreen(),
      },
    );
  }
}

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  List<String> products = ["Produkt 1", "Produkt 2", "Produkt 3", "Produkt 4", "Produkt 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(alignment: Alignment.centerLeft,child: Text("Homescreen")),
      ),
      body:ListView(
        children: const[
          Card(
            child: ListTile(
              leading: Icon(Icons.install_mobile),
              title: Text("Produkt 1"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.install_mobile),
              title: Text("Produkt 2"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.install_mobile),
              title: Text("Produkt 3"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.install_mobile),
              title: Text("Produkt 4"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.install_mobile),
              title: Text("Produkt 5"),
            ),
          )
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Align(alignment: Alignment.centerLeft,child: Text("DestailsScreen")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Details für Produkt"),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Zurück zum Homescreen"),
            ),
          ],
        ),
      ),
    );
  }
}