import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(235, 250, 250, 255),
        appBar: AppBar(
          title: const Text("SizedBox Exercise"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                child: const SizedBox(
                  width: 135,
                  height: 135,
                  child: Center(
                    child: Text("Box 1", style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
              ),
              Container(
                 margin: const EdgeInsets.all(20),
                color: Colors.green,
                child: const SizedBox(
                  width: 210,
                  height: 100,
                  child: Center(
                    child: Text("Box 2", style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: const SizedBox(
                  width: 90,
                  height: 190,
                  child: Center(
                    child: Text("Box 3", style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
