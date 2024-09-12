import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notepad_forwangtao_android/widget/main_page/notepads.dart';

class NotepadsPage extends StatelessWidget {
  /// 显示记事本首页
  ///
  /// 主页主要存放单个记事本的所有笔记
  const NotepadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotepadAppbar(
        notepadsName: '默认记事本合集',
      ),
      body: const NotepadsBody(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit_note),
        label: const Text('记点啥'),
        onPressed: () => {}, //TODO 待实现按下“创建记事本”按钮的逻辑
      ),
    );
  }
}

class NotepadsBody extends StatelessWidget {
  const NotepadsBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<List> importCategoryInfo = [
      [1, '手写', FontAwesomeIcons.feather, false],
      [2, 'PDF', FontAwesomeIcons.filePdf, false],
      [3, '刚看', FontAwesomeIcons.hourglass, false],
    ];
    return ListView(
      // 绘制是竖向的
      scrollDirection: Axis.vertical,
      children: [
        // "快速筛选"
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

        // "文件夹"
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
            children: <Widget>[
              FolderPreviewWidget(
                importFolderInfo: const {
                  'folderName': '采购管理',
                  'notepadsCount': 1
                },
              )
            ],
          ),
        ),

        // "记事本"
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
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: GridView.count(
            // 一次性显示全部
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 1,
            childAspectRatio: 16 / 10,
            children: <Widget>[
              NotepadPreviewCard(importNotepadInfo: {
                'notepadName': '采购',
                'notepadType': 0,
                'lastViewTime': DateTime.now(),
                'lastEditTime': DateTime.now(),
              }),
            ],
          ),
        ),
      ],
    );
  }
}
