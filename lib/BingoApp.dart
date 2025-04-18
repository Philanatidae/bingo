/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:bingo/BoardListPage.dart';
import 'package:flutter/cupertino.dart';

class BingoApp extends StatelessWidget {
  const BingoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      //theme: CupertinoThemeData(brightness: Brightness.dark),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
          default:
            return CupertinoPageRoute(
              builder: (_) => const BoardListPage(),
              settings: settings,
            );
        }
      },
    );
  }
}
