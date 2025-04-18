/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/cupertino.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;

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
        CupertinoButton(
          onPressed: _generateBingoBoardImage,
          child: const Text('Regenerate'),
        ),
      ],
    );
  }
}
