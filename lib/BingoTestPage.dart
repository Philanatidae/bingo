/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/cupertino.dart';
import 'BingoBoardImage.dart';

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

