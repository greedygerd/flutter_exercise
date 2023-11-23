import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    // Startet die Animation nach einer Verzögerung von 2 Sekunden
    Timer(Duration(seconds: 2), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hintergrund des Splashscreens
          Container(
            color: Colors.white,
            child: Center(
              child: FlutterLogo(size: 200),
            ),
          ),
          // Animierter roter Container mit InkWell
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: _isVisible ? MediaQuery.of(context).size.width / 4 : 0,
            top: _isVisible ? MediaQuery.of(context).size.height / 4 : 0,
            child: InkWell(
              onTap: () {
                // Navigiert zur nächsten Seite
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Tap me!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page!'),
      ),
    );
  }
}
