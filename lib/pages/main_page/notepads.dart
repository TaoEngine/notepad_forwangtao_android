import 'package:flutter/material.dart';
import 'package:notepad_forwangtao_android/widget/main_page/notepads.dart';

class NotepadsPage extends StatelessWidget {
  /// 显示记事本首页
  ///
  /// 主页主要存放单个记事本的所有笔记
  const NotepadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotepadAppbar(),
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
        const SizedBox(
          height: 60,
          child: CategoryChip(importCategoryInfo: {
            '刚看': Icon(Icons.history),
            '手写': Icon(Icons.draw),
            '考点': Icon(Icons.tag),
            '物流的作用': Icon(Icons.tag),
            '测试测试': Icon(Icons.tag),
            '大家好': Icon(Icons.tag),
          }),
        ),

        // "文件夹"
        const Padding(
            padding: EdgeInsets.only(left: 28),
            child: Row(
              children: [
                Icon(Icons.folder),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('文件夹'),
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
                  'folderName': '只是一个文件夹',
                  'notepadsCount': 5
                },
              ),
              FolderPreviewWidget(
                importFolderInfo: const {
                  'folderName': '只是一个文件夹',
                  'notepadsCount': 5
                },
              ),
              FolderPreviewWidget(
                importFolderInfo: const {
                  'folderName': '只是一个文件夹',
                  'notepadsCount': 5
                },
              ),
              FolderPreviewWidget(
                importFolderInfo: const {
                  'folderName': '只是一个文件夹',
                  'notepadsCount': 5
                },
              ),
              FolderPreviewWidget(
                importFolderInfo: const {
                  'folderName': '只是一个文件夹',
                  'notepadsCount': 5
                },
              ),
            ],
          ),
        ),

        // "记事本"
        const Padding(
            padding: EdgeInsets.only(left: 28),
            child: Row(
              children: [
                Icon(Icons.edit_note),
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
                'notepadName': '笔记功能还没做好啊！',
                'notepadType': 0,
                'lastViewTime': DateTime.now(),
                'lastEditTime': DateTime.now(),
              }),
              NotepadPreviewCard(importNotepadInfo: {
                'notepadName': '笔记功能还没做好啊！',
                'notepadType': 0,
                'lastViewTime': DateTime.now(),
                'lastEditTime': DateTime.now(),
              }),
              NotepadPreviewCard(importNotepadInfo: {
                'notepadName': '笔记功能还没做好啊！',
                'notepadType': 0,
                'lastViewTime': DateTime.now(),
                'lastEditTime': DateTime.now(),
              }),
              NotepadPreviewCard(importNotepadInfo: {
                'notepadName': '笔记功能还没做好啊！',
                'notepadType': 0,
                'lastViewTime': DateTime.now(),
                'lastEditTime': DateTime.now(),
              })
            ],
          ),
        ),
      ],
    );
  }
}
