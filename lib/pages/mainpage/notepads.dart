import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:notepad_forwangtao_android/funcs/database.dart';
import 'package:notepad_forwangtao_android/static/datamodel.dart';
import 'package:notepad_forwangtao_android/widget/shared/appbar.dart';
import 'package:notepad_forwangtao_android/widget/mainpage/notepads.dart';

class NotepadsPage extends StatelessWidget {
  /// 显示记事本首页
  ///
  /// 主页主要存放单个记事本的所有笔记
  const NotepadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取转入这个界面的传参值
    // final arguments = Get.arguments;

    // // 根据ID查询Notepads信息并上载到界面中去
    // var notepadsDB = !arguments['isNotepadsChild']
    //     // 因为不知道该页面是Notepads还是NotepadsChild，所以在引入时加?
    //     ? NotepadsDB().getdb.notepads.getSync(arguments['NotepadsID?'])
    //     : NotepadsDB().getdb.notepadsChilds.getSync(arguments['NotepadsID?']);

    // 获取这个页面中所有的记事本
    var thisNotepadDB = NotepadsDB().getdb.notepadFiles.where().findAll();

    // 开始生成界面布局
    return Scaffold(
      appBar: const AppBarModel(
        appbarTitle: '默认记事本合集',
        appbarMode: '记事本合集',
        appbarLeftButton: true,
        iconLeftButton: Icons.collections_bookmark,
        describeLeftButton: '记事本首页(正在做，敬请期待)',
      ),

      /// 终于发现Flutter它带了一个FutureBuilder可以等待结果被加载完成后显示出来
      body: FutureBuilder(
          future: thisNotepadDB,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return NotepadsBody(notepadDB: snapshot.data);
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit_note),
        label: const Text('记点啥'),
        onPressed: () => notepadNewDialog(context),
      ),
    );
  }
}

class NotepadsBody extends StatelessWidget {
  final List notepadDB;

  const NotepadsBody({super.key, required this.notepadDB});

  @override
  Widget build(BuildContext context) {
    List<List> importCategoryInfo = [
      ['手写', FontAwesomeIcons.feather, false],
      ['PDF', FontAwesomeIcons.filePdf, false],
      ['刚看', FontAwesomeIcons.hourglass, false],
    ];

    // 整理出来的记事本ID
    Iterable notepadIDs = notepadDB.map((notepad) => notepad.notepadID);

    // 笔记本卡片生成
    List<Widget> itemNotepadPreviewCard() {
      List<Widget> item = [];
      for (var element in notepadDB) {
        var notepadName = element.notepadName;
        var notepadType = element.notepadType;
        var lastEditTime = element.notepadEditTime;
        var lastViewTime = element.notepadViewTime;
        item.add(NotepadPreviewCard(
            notepadName: notepadName,
            notepadType: notepadType,
            lastViewTime: lastViewTime,
            lastEditTime: lastEditTime));
      }
      return item;
    }

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

        // 文件夹选单
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: GridView.count(
            // 一次性显示全部
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            childAspectRatio: 18 / 6,
            children: const <Widget>[
              FolderPreviewWidget(
                folderName: '示例',
                notepadsCount: 0,
              )
            ],
          ),
        ),

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

        // 记事本预览
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: itemNotepadPreviewCard().isEmpty
              ? const Center(
                  child: Text('没有记事本，但还好有我~'),
                )
              : GridView.count(
                  // 一次性显示全部
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 1,
                  childAspectRatio: 16 / 10,
                  children: itemNotepadPreviewCard()),
        ),
      ],
    );
  }
}
