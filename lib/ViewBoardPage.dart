/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/cupertino.dart';

class ViewBoardPage extends StatefulWidget {
  const ViewBoardPage({super.key});

  @override
  State<ViewBoardPage> createState() => _ViewBoardPageState();
}

class _ViewBoardPageState extends State<ViewBoardPage> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticBackgroundVisibility: false,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              CupertinoSheetRoute.popSheet(context);
            },
            child: const Text('Cancel'),
          ),
          middle: const Text('New Board'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              //Navigator.of(context).pop();
              CupertinoSheetRoute.popSheet(context);
            },
            child: const Text('Create'),
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                // Your form or sheet content goes here
                Text('Create your board content here'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

