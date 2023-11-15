import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() => runApp(const ProgressIndicatorApp());

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const ProgressIndicatorExample(),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool showImage = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showImage = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void openImage() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: 350,
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://external-preview.redd.it/vxPXEGgL4v8mCGw06IFGsmJNtqWQg-z60xQQ79dHKPY.jpg?auto=webp&s=db7685262e9b352a4888e547f52a244e2ea2cb9f"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  void restartProcess() {
    controller.reset();
    showImage = false;
    controller.forward();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        showImage = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              "Wir warten mal 5 Sekunden.",
              style: TextStyle(fontSize: 20),
            ),
            Visibility(
              visible: !showImage,
              child: LinearProgressIndicator(
                value: controller.value,
              ),
            ),
            if (showImage)
              GestureDetector(
                onTap: openImage,
                child: Image.network(
                  "https://cdn.prod.www.spiegel.de/images/74f23ecb-0001-0004-0000-000001279606_w1200_r1_fpx50_fpy41.34.jpg",
                  width: 400,
                  height: 400,
                ),
              ),
            ElevatedButton(
              onPressed: () {
                restartProcess();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 246, 246),
                shadowColor: Colors.green,
              ),
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(255, 222, 33, 33),
                highlightColor: const Color.fromARGB(31, 163, 229, 20),
                child: const Text(
                  "Bananaphone",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}