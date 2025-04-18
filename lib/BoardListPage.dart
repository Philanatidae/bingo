/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:bingo/CreateBoardPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BoardListPage extends StatefulWidget {
  const BoardListPage({super.key});

  @override
  State<BoardListPage> createState() => _BoardListPageState();
}

class _BoardListPageState extends State<BoardListPage> {
  List<String> boardNames = ['Board 1', 'Board 2'];
  //int _counter = 0;
  //
  //void _incrementCounter() {
  //  setState(() {
  //    // This call to setState tells the Flutter framework that something has
  //    // changed in this State, which causes it to rerun the build method below
  //    // so that the display can reflect the updated values. If we changed
  //    // _counter without calling setState(), then the build method would not be
  //    // called again, and so nothing would appear to happen.
  //    _counter++;
  //  });
  //}

  Widget _getBoardListWidget() {
    return SafeArea(
      child: CupertinoListSection(
        children:
            boardNames.map((boardName) {
              return Slidable(
                key: ValueKey<String>(boardName),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  //dismissible: DismissiblePane(
                  //  onDismissed: () {
                  //    print('Remove $boardName');
                  //    setState(() {
                  //      boardNames.remove(boardName);
                  //    });
                  //  },
                  //),
                  children: [
                    SlidableAction(
                      onPressed: (_) {
                        print('Remove was tapped $boardName');
                        setState(() {
                          boardNames.remove(boardName);
                        });
                      },
                      backgroundColor: CupertinoColors.systemRed,
                      foregroundColor: CupertinoColors.white,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: CupertinoListTile(
                  title: Text(boardName),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    print('Tapped on $boardName');
                  },
                ),
              );
            }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticBackgroundVisibility: false,
        // Don't think I really need a select button
        //leading: CupertinoButton(
        //  // "Select" button
        //  padding: EdgeInsets.zero,
        //  onPressed: () {},
        //  child: const Text('Select'),
        //),
        middle: Text('Boards'),
        trailing: CupertinoButton(
          // "Add" button
          padding: EdgeInsets.zero,
          onPressed: () {
            showCupertinoSheet(
              context: context,
              pageBuilder: (BuildContext context) => const CreateBoardPage(),
              useNestedNavigation: true,
            );
          },
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child:
          boardNames.isEmpty
              ? Center(child: Text('Add a board to get started.'))
              : _getBoardListWidget(),
    );
  }
}
