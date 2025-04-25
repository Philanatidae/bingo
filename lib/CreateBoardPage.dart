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
    return GestureDetector(
      onVerticalDragDown: (_) {},
      child: MediaQuery.removePadding(
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
      ),
    );
  }
}
