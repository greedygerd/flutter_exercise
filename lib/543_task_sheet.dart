import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    // If we're in debug mode, use the normal error widget which shows the error
    // message:
    if (kDebugMode) {
      return ErrorWidget(details.exception);
    }
    // In release builds, show a yellow-on-blue message instead:
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error!\n${details.exception}',
        style: const TextStyle(color: Colors.yellow),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  };

  runApp(const SuperApp());
}

class SuperApp extends StatefulWidget {
  const SuperApp({super.key});

  @override
  State<SuperApp> createState() => _SuperAppState();
}

class _SuperAppState extends State<SuperApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Aufgabe(),
    );
  }
}

class Aufgabe extends StatefulWidget {
  Aufgabe({super.key});

  @override
  State<Aufgabe> createState() => _AufgabeState();
}

class _AufgabeState extends State<Aufgabe> {
  bool throwError = false;
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
        if (throwError) {
      // Since the error widget is only used during a build, in this contrived example,
      // we purposely throw an exception in a build function.
      return Builder(
        builder: (BuildContext context) {
          throw Exception('oh no, an error');
        },
      );
    } else {
    return Scaffold(
      appBar: AppBar(
        title: const Text("5.4.3 Task Sheet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              height: 300,
              width: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      MeinLogger.log(LogLevel.debug, "Hallo ich debugge!");
                      MeinLogger.log(LogLevel.info, "Das ist eine Inormation!");
                      MeinLogger.log(
                          LogLevel.warning, "Warnung irgendwas läuft schief!");
                      MeinLogger.log(LogLevel.error,
                          "ErrorErrorErrorErrorErrorErrorErrorErrorError!");
                    },
                    child: const Text("Aufgabe 2")),
                const Gap(16),
                ElevatedButton(
                    onPressed: () {
                      Logger.level = Level.error;
                      logger.w(
                          "Hallo, das ist eine Warung ich glaube irgendwas geht gleich kaputt");
                      logger.e("Toll, jetzt ist was kaputt");
                      
                    },
                    child: const Text("Aufgabe 3")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Logger.level = Level.debug;
                      logger.d("Ich debugge!");
                    },
                    child: const Text("Aufgabe 4")),
                const Gap(16),
                ElevatedButton(
                    onPressed: () {
                      logger.e(
                          "ErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorError");
                    },
                    child: const Text("Aufgabe 4")),
                const Gap(16),
                ElevatedButton(
                    onPressed: () {
                      logger.i("Das ist eine wichtige Information!");
                    },
                    child: const Text("Aufgabe 4")),
              ],
            ),
            ElevatedButton(onPressed: (){
                  setState(() {
                    throwError = true;
                  });
            },
             child: const Text("Zusatzaufgabe")),
          ],
        ),
      ),
    );
    }
  }
}

enum LogLevel {
  debug,
  info,
  warning,
  error,
}

class MeinLogger {
  static void log(LogLevel level, String message) {
    switch (level) {
      case LogLevel.debug:
        if (kDebugMode) {
          print("DEBUG: $message");
        }
        break;
      case LogLevel.info:
        if (kDebugMode) {
          print("INFO: $message");
        }
        break;
      case LogLevel.warning:
        if (kDebugMode) {
          print("WARNING: $message");
        }
        break;
      case LogLevel.error:
        if (kDebugMode) {
          print("ERROR: $message");
        }
        break;
    }
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          "Ein Fehler ist aufgetreten!",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
