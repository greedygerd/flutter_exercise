import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bilddaten auslesen'),
        ),
        body: Center(
          child: FutureBuilder(
            future: readImageData('assets/images/jancontainer.png'), // Pfad zu deinem Bild
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  // Fehlerbehandlung
                  return Text('Fehler beim Lesen der Bilddaten: ${snapshot.error}');
                }

                Uint8List? imageData = snapshot.data as Uint8List?;
                
                if (imageData != null) {
                  // Bild anzeigen, wenn Daten vorhanden sind
                  return Image.memory(imageData);
                } else {
                  // Fehlermeldung anzeigen, wenn die Daten null sind
                  return Text('Ungültiges Bildformat');
                }
              } else {
                // Ladeindikator anzeigen
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Uint8List> readImageData(String imagePath) async {
    try {
      // Lese die binären Daten des Bildes
      ByteData data = await rootBundle.load(imagePath);
      
      // Extrahiere die Bytes und erstelle eine Uint8List
      Uint8List imageData = data.buffer.asUint8List();
      
      return imageData;
    } catch (e) {
      // Fehler beim Lesen der Daten
      print('Fehler beim Lesen der Bilddaten: $e');
      throw e;
    }
  }
}
