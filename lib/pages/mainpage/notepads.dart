import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:notepad_forwangtao_android/funcs/database.dart';
import 'package:notepad_forwangtao_android/static/datamodel.dart';
import 'package:notepad_forwangtao_android/widget/shared/appbar.dart';
import 'package:notepad_forwangtao_android/widget/mainpage/notepads.dart';

class NotepadsPage extends StatelessWidget {
  const NotepadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶部通用AppBar
      appBar: const AppBarModel(
        appbarTitle: '默认记事本合集',
        appbarMode: '记事本合集',
        appbarLeftButton: true,
        iconLeftButton: Icons.collections_bookmark,
        describeLeftButton: '记事本首页(正在做，敬请期待)',
      ),

      // 记事本合集预览界面
      body: const NotepadsBody(),

      // 底部“记点啥”按键
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit_note),
        label: const Text('记点啥'),
        onPressed: () => showDialog(
            context: context,
            builder: (context) => InputDialogUnit(
                labelText: '新建记事本（临时，以后会改）',
                doesText: '重命名',
                pressDoes: (String input) async {
                  int notepadID = await addNewNotepad(1, input, false);
                  Get.back();
                  Get.toNamed('/notepads/note', arguments: {
                    'notepadID': notepadID,
                  });
                })),
      ),
    );
  }
}

class NotepadsBody extends StatelessWidget {
  const NotepadsBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<List> importCategoryInfo = [
      ['手写', FontAwesomeIcons.feather, false],
      ['PDF', FontAwesomeIcons.filePdf, false],
      ['刚看', FontAwesomeIcons.hourglass, false],
    ];

    return ListView(
      // 绘制是竖向的
      scrollDirection: Axis.vertical,
      children: [
        // "快速筛选"标签
        const Padding(
            padding: EdgeInsets.only(left: 28, top: 10),
            child: Row(
              children: [
                Icon(Icons.filter_list),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('快速筛选'),
                )
              ],
            )),

        // 标签筛选器
        SizedBox(
          height: 60,
          child: CategoryChip(importCategoryInfo: importCategoryInfo),
        ),

        // "文件夹"标签
        const Padding(
            padding: EdgeInsets.only(left: 28),
            child: Row(
              children: [
                Icon(Icons.attach_file),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('合集'),
                )
              ],
            )),

        // 文件夹
        const NotepadsChildViewer(),

        // "记事本"标签
        const Padding(
            padding: EdgeInsets.only(left: 28),
            child: Row(
              children: [
                Icon(Icons.description),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('记事本'),
                )
              ],
            )),

        // 记事本
        const NotepadViewer()
      ],
    );
  }
}

class NotepadsChildViewer extends StatefulWidget {
  /// 记事本合集子目录的生成器和布局器
  ///
  /// 该模块会先访问Isar数据库来获取所有记事本合集子目录的信息，然后就能通过GridView显示所有
  /// 记事本合集子目录的信息
  const NotepadsChildViewer({super.key});

  @override
  State<NotepadsChildViewer> createState() => _NotepadsChildViewerState();
}

class _NotepadsChildViewerState extends State<NotepadsChildViewer> {
  @override
  Widget build(BuildContext context) {
    // 文件夹卡片生成
    Future<List<Widget>> itemNotepadsChild() async {
      var dbs = await NotepadsDB().getdb.notepadsChilds.where().findAll();
      List<Widget> item = [];
      for (var element in dbs) {
        var notepadsChildID = element.notepadsChildID;
        //var notepadsParentID = element.notepadsParentID;
        //var notepadsID = element.notepadsID;
        var notepadsChildName = element.notepadsChildName;
        //var notepadsCreateTime = element.notepadsCreateTime;
        //var notepadsViewTime = element.notepadsViewTime;
        // 非空检查
        if (notepadsChildID != null && notepadsChildName != null) {
          item.add(NotepadsChildPreviewWidget(
            folderName: notepadsChildName,
            notepadsCount: '0',
            onLongPress: () async {
              showDialog(
                context: context,
                builder: (context) => NotepadsChildSetDialogUnit(
                  notepadsChildName: notepadsChildName,
                  pressRename: () async {
                    Get.back();
                    showDialog(
                        context: context,
                        builder: (context) => InputDialogUnit(
                            labelText: '重命名记事本',
                            doesText: '重命名',
                            pressDoes: (String input) async {
                              await NotepadsDB().getdb.writeTxn(() async {
                                element.notepadsChildName = input;
                                await NotepadsDB()
                                    .getdb
                                    .notepadsChilds
                                    .put(element);
                                setState(() {
                                  Get.back();
                                });
                              });
                            }));
                  },
                  pressDelete: () async {
                    await NotepadsDB().getdb.writeTxn(() async {
                      await NotepadsDB()
                          .getdb
                          .notepadsChilds
                          .delete(notepadsChildID);
                    });
                    setState(() {
                      Get.back();
                    });
                  },
                ),
              );
            },
          ));
        }
      }
      // 最后加入一个新建按钮
      item.add(NotepadsChildPreviewWidget(
        folderName: '新建子目录',
        notepadsCount: '+',
        onOnePress: () async {
          showDialog(
              context: context,
              builder: (context) => InputDialogUnit(
                    labelText: '输入新子目录的名称',
                    doesText: '新建',
                    pressDoes: (String input) async {
                      await addNewNotepadsChild(0, 0, input);
                      setState(() {
                        Get.back();
                      });
                    },
                  ));
        },
      ));
      return item;
    }

    // 让界面能够异步加载
    // 如果异步加载中，就显示圆圈加载器
    return FutureBuilder(
      future: itemNotepadsChild(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 80,
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: GridView.count(
                // 一次性显示全部
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                childAspectRatio: 18 / 6,
                children: snapshot.data),
          );
        } else {
          throw Error();
        }
      },
    );
  }
}

class NotepadViewer extends StatefulWidget {
  /// 记事本的生成器和布局器
  ///
  /// 该模块会先访问Isar数据库来获取所有记事本的信息，然后就能通过GridView显示所有记事本的信息
  const NotepadViewer({super.key});

  @override
  State<NotepadViewer> createState() => _NotepadViewerState();
}

class _NotepadViewerState extends State<NotepadViewer> {
  @override
  Widget build(BuildContext context) {
    Future<List<Widget>> itemNotepad() async {
      var dbs = await NotepadsDB().getdb.notepadFiles.where().findAll();
      List<Widget> item = [];
      for (var element in dbs) {
        var notepadID = element.notepadID;
        var notepadName = element.notepadName;
        var notepadType = element.notepadType;
        var lastEditTime = element.notepadEditTime;
        var lastViewTime = element.notepadViewTime;
        // 非空检查
        if (notepadID != null &&
            notepadName != null &&
            notepadType != null &&
            lastViewTime != null &&
            lastEditTime != null) {
          item.add(NotepadPreviewCard(
              notepadName: notepadName,
              notepadType: notepadType,
              lastViewTime: lastViewTime,
              lastEditTime: lastEditTime,
              onOnePress: () => Get.toNamed('/notepads/note',
                  arguments: {'notepadID': notepadID}),
              onLongPress: () async {
                showDialog(
                  context: context,
                  builder: (context) => NotepadSetDialogUnit(
                    notepadName: notepadName,
                    pressRename: () async {
                      Get.back();
                      showDialog(
                          context: context,
                          builder: (context) => InputDialogUnit(
                              labelText: '重命名记事本',
                              doesText: '重命名',
                              pressDoes: (String input) async {
                                await NotepadsDB().getdb.writeTxn(() async {
                                  element.notepadName = input;
                                  await NotepadsDB()
                                      .getdb
                                      .notepadFiles
                                      .put(element);
                                  setState(() {
                                    Get.back();
                                  });
                                });
                              }));
                    },
                    pressDelete: () async {
                      await NotepadsDB().getdb.writeTxn(() async {
                        await NotepadsDB().getdb.notepadFiles.delete(notepadID);
                      });
                      setState(() {
                        Get.back();
                      });
                    },
                  ),
                );
              }));
        }
      }
      return item;
    }

    return FutureBuilder(
      future: itemNotepad(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 80,
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: snapshot.data.isEmpty
                ? const Center(
                    child: Text('没有记事本诶~'),
                  )
                : GridView.count(
                    // 一次性显示全部
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 1,
                    childAspectRatio: 16 / 10,
                    children: snapshot.data),
          );
        } else {
          throw Error();
        }
      },
    );
  }
}
