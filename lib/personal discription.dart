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
  final List<String> animals = ["Hund", "Katze", "Löwe", "Elefant", "Giraffe"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Homescreen",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        flexibleSpace: const MyGradient(),
      ),
      body: ListView(
        children: animals.map((animal) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.pets),
              title: Text(animal,style: const TextStyle(fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pushNamed(context, "/detailsScreen", arguments: animal);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
//.map ändert Dinge in einer Liste, während .toList() Dinge in eine Liste umwandelt.
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String animalName = ModalRoute.of(context)!.settings.arguments as String;

    String imagePath = "";
    String weight = "";
    String size = "";
    String favoriteFood = "";

    if (animalName == "Hund") {
      imagePath = "assets/images/hund.jpg";
      weight = "15 kg";
      size = "50 cm";
      favoriteFood = "Hundefutter";
    } else if (animalName == "Katze") {
      imagePath = "assets/images/katze.jpg";
      weight = "5 kg";
      size = "30 cm";
      favoriteFood = "Katzenfutter";
    } else if (animalName == "Löwe") {
      imagePath = "assets/images/loewe.jpg";
      weight = "200 kg";
      size = "120 cm";
      favoriteFood = "Fleisch";
    } else if (animalName == "Elefant") {
      imagePath = "assets/images/elefant.jpg";
      weight = "5000 kg";
      size = "400 cm";
      favoriteFood = "Pflanzen";
    } else if (animalName == "Giraffe") {
      imagePath = "assets/images/giraffe.jpg";
      weight = "800 kg";
      size = "550 cm";
      favoriteFood = "Blätter";
    } 

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Steckbrief",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        flexibleSpace: const MyGradient(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 500, height: 500),
            Container(
              alignment: Alignment.center,margin: const EdgeInsets.all(10),
              child: Text(
                "Tiername: $animalName",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,margin: const EdgeInsets.all(10),
              child: Text(
                "Gewicht: $weight",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,margin: const EdgeInsets.all(10),
              child: Text(
                "Größe: $size",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.center,margin: const EdgeInsets.all(10),
              child: Text(
                "Lieblingsessen: $favoriteFood",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
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

class MyGradient extends StatelessWidget {
  const MyGradient({super.key});
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(131, 226, 255, 1),
              Color.fromRGBO(11, 198, 255, 1),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}
