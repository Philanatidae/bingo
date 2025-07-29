/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:bingo/CreateBoardPage.dart';
import 'package:bingo/bloc/BingoBoards.dart';
import 'package:bingo/bloc/BingoBoardCubit.dart';
import 'package:bingo/bloc/CreateBoardCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BoardListPage extends StatelessWidget {
  const BoardListPage({super.key});

  Widget _buildBoardsList(BuildContext context, BingoBoards state) {
    return SafeArea(
      child: CupertinoListSection(
        children:
            state.boards.map((board) {
              final boardIndex = state.boards.indexOf(board);

              return Slidable(
                key: ValueKey<String>(board.name),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  // Not really liking the full swipe, I prefer
                  // it needing a swipe + tap for confirmation.
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
                        final cubit = context.read<BingoBoardsCubit>();
                        cubit.removeBoard(boardIndex);
                      },
                      backgroundColor: CupertinoColors.systemRed,
                      foregroundColor: CupertinoColors.white,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: CupertinoListTile(
                  title: Text(board.name),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    print('Tapped on ${board.name}');
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
            context.read<CreateBoardCubit>().resetBoard();
            showCupertinoSheet(
             context: context,
             pageBuilder: (BuildContext context) => const CreateBoardPage(),
             useNestedNavigation: true,
            );
          },
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      child: BlocBuilder<BingoBoardsCubit, BingoBoards>(
        builder: (context, state) {
          return state.boards.isEmpty
              ? Center(child: Text('Add a board to get started.'))
              : _buildBoardsList(context, state);
        },
      ),
    );
  }
}

