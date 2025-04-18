/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/cupertino.dart';

class CreateBoardPage extends StatefulWidget {
  const CreateBoardPage({super.key});

  @override
  State<CreateBoardPage> createState() => _CreateBoardPageState();
}

class _CreateBoardPageState extends State<CreateBoardPage> {
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

    //return CupertinoPageScaffold(
    //  child: Center(child: Text('Create board here')),
    //);

    //return Center(child: Text('Create board here'));

    //return CupertinoPageScaffold(
    //  navigationBar: CupertinoNavigationBar(
    //    automaticBackgroundVisibility: false,
    //    leading: CupertinoButton(
    //      // "Select" button
    //      padding: EdgeInsets.zero,
    //      onPressed: () {
    //        Navigator.pop(context);
    //      },
    //      child: const Text('Cancel'),
    //    ),
    //    middle: Text('New Board'),
    //  ),
    //  child: Center(child: Text('Create board')),
    //);
  }
}
