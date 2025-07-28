/*
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:bingo/bloc/BingoBoard.dart';
import 'package:bingo/bloc/BingoBoardCubit.dart';
import 'package:bingo/bloc/CreateBoardCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBoardPage extends StatelessWidget {
  const CreateBoardPage({super.key});

  void _showDialog(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder:
          (BuildContext context) => Container(
            height: 240,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            // child: SafeArea(top: false, child: child),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Expanded(child: Center(child: child)),
              ],
            ),
          ),
    );
  }

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
                context.read<BingoBoardsCubit>().addBoard(context.read<CreateBoardCubit>().state);
                CupertinoSheetRoute.popSheet(context);
              },
              child: const Text('Create'),
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<CreateBoardCubit, BingoBoard>(
              builder: (context, state) {
                return CupertinoFormSection(
                  children: [
                    CupertinoTextFormFieldRow(
                      prefix: const Text('Name'),
                      onChanged: (value) {
                        context.read<CreateBoardCubit>().updateName(value);
                      },
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      // @todo Doesn't have the right padding
                      child: CupertinoFormRow(
                        prefix: Text('Type'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context
                                  .read<CreateBoardCubit>()
                                  .getBoardTypes()[context
                                      .read<CreateBoardCubit>()
                                      .getTypeIndex()]
                                  .value,
                            ),
                            CupertinoListTileChevron(),
                          ],
                        ),
                      ),
                      onTap: () {
                        _showDialog(
                          context,
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 32,
                            // This sets the initial item.
                            scrollController: FixedExtentScrollController(
                              initialItem:
                                  context
                                      .read<CreateBoardCubit>()
                                      .getTypeIndex(),
                            ),
                            // This is called when selected item is changed.
                            onSelectedItemChanged: (int selectedItem) {
                              context
                                  .read<CreateBoardCubit>()
                                  .updateTypeFromIndex(selectedItem);
                            },
                            children: List<Widget>.generate(
                              context
                                  .read<CreateBoardCubit>()
                                  .getBoardTypes()
                                  .length,
                              (int index) {
                                return Center(
                                  child: Text(
                                    context
                                        .read<CreateBoardCubit>()
                                        .getBoardTypes()[index]
                                        .value,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      // @todo Doesn't have the right padding
                      child: CupertinoFormRow(
                        prefix: Text('Size'),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context
                                  .read<CreateBoardCubit>()
                                  .getBoardSizes()[context
                                      .read<CreateBoardCubit>()
                                      .getSizeIndex()]
                                  .value,
                            ),
                            CupertinoListTileChevron(),
                          ],
                        ),
                      ),
                      onTap: () {
                        _showDialog(
                          context,
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 32,
                            // This sets the initial item.
                            scrollController: FixedExtentScrollController(
                              initialItem:
                                  context
                                      .read<CreateBoardCubit>()
                                      .getSizeIndex(),
                            ),
                            // This is called when selected item is changed.
                            onSelectedItemChanged: (int selectedItem) {
                              context
                                  .read<CreateBoardCubit>()
                                  .updateSizeFromIndex(selectedItem);
                            },
                            children: List<Widget>.generate(
                              context
                                  .read<CreateBoardCubit>()
                                  .getBoardSizes()
                                  .length,
                              (int index) {
                                return Center(
                                  child: Text(
                                    context
                                        .read<CreateBoardCubit>()
                                        .getBoardSizes()[index]
                                        .value,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
