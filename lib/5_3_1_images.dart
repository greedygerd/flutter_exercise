import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const TaskSheet(),
    );
  }
}

class TaskSheet extends StatelessWidget {
  const TaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Sheet 5.3.1 Images"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyZ2VyfGVufDB8fDB8fHww",
                      fadeInCurve: Curves.easeInQuint,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const Gap(16),
                Image.network(
                  "https://img.fotocommunity.com/stinkefinger-8d749344-af17-4c35-bd97-303febf9c395.jpg?width=1000",
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Aufgabe3Screen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 246, 246),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 222, 33, 33),
                    highlightColor: const Color.fromARGB(31, 163, 229, 20),
                    child: const Text(
                      "Aufgabe 3",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const Gap(16),
                Image.asset(
                  "assets/images/jancontainer.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Aufgabe3Screen extends StatelessWidget {
  const Aufgabe3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aufgabe 3"),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Erkläre in eigenen Worten, in welchen Situationen es sich anbietet ein Network bzw. ein Asset Image zu verwenden.",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Gap(50),
              Text(
                "Für statische Elemente wie Logos und Hintergrundbilder sind Asset Images besser geeignet. Wenn es ein Element ist, dass sich häufig ändert oder z.B. von einem Server geladen wird, benutzt man Network Images.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
