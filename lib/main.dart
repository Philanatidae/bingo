/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

void main() {
  runApp(const BingoApp());
}

class BingoApp extends StatelessWidget {
  const BingoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: const BingoTestPage(title: 'BINGO'),
      debugShowCheckedModeBanner: true,
    );
  }
}

class BingoTestPage extends StatefulWidget {
  const BingoTestPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BingoTestPage> createState() => _BingoTestPageState();
}

class _BingoTestPageState extends State<BingoTestPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
        automaticBackgroundVisibility: false,
      ),
      child: Center(child: BingoBoardImage()),
      //child: Center(child: const Image(
      //              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
      //          ),
      //  //child: Column(
      //  //  mainAxisAlignment: MainAxisAlignment.center,
      //  //  children: <Widget>[
      //  //    const Text('You have pushed the button this many times:'),
      //  //    Text('$_counter'),
      //  //    CupertinoButton(
      //  //      onPressed: _incrementCounter,
      //  //      child: Text('The Button in Question'),
      //  //    ),
      //  //  ],
      //  //),
      //),
    );
  }
}

class BingoBoardImage extends StatefulWidget {
  const BingoBoardImage({super.key});

  @override
  State<BingoBoardImage> createState() => _BingoBoardImageState();
}

class _BingoBoardImageState extends State<BingoBoardImage> {
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _generateBingoBoardImage();
  }

  Future<void> _generateBingoBoardImage() async {
    const int size = 500;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
    );

    // Begin Bingo Board
    const int gridSize = 5;
    final paint =
        Paint()
          ..color = Color.fromARGB(255, 0, 255, 0)
          ..strokeWidth = 2;

    final cellSize = size / gridSize;

    for (int i = 0; i <= gridSize; i++) {
      double offset = i * cellSize;
        // Horizontal
      canvas.drawLine(
        Offset(0, offset),
        Offset(size.toDouble(), offset),
        paint,
      );
        // Vertical
      canvas.drawLine(
        Offset(offset, 0),
        Offset(offset, size.toDouble()),
        paint,
      );
    }

    // etc. etc.

    // End Bingo Board

    final picture = recorder.endRecording();
    final img = await picture.toImage(size, size);
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final bytes = byteData!.buffer.asUint8List();

    //print('Got to the end...');

    setState(() {
      _imageBytes = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imageBytes != null
            ? Image.memory(_imageBytes!)
            : Text('Generating...'),
        CupertinoButton(onPressed: _generateBingoBoardImage, child: const Text('Regenerate')),
      ],
    );
  }
}
