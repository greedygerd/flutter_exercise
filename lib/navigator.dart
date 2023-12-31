import "package:flutter/material.dart";

void main(){

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes:{
        "/":(context) => Homescreen(),
        "/detailsScreen":(context) => const DetailsScreen(),
      },
    );
  }
}

class Homescreen extends StatelessWidget {
  List<String> products = ["Produkt 1", "Produkt 2", "Produkt 3", "Produkt 4", "Produkt 5"];
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homescreen"),
      ),
        body: Center(
          child: ListView.builder(
            itemCount: products.length, itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index]),
                onTap: () {
                  Navigator.pushNamed(context, "/detailsScreen",
                  arguments: products[index]
                  );
                },
              );
            },
          ),
        ),
    );
  }
}



class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DetailsScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Produkt:"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Zrück zum Homescreen"),
            )
          ],
        ),
      ),
    );
  }
}

