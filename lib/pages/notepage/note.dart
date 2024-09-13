import 'package:flutter/material.dart';
import 'package:notepad_forwangtao_android/funcs/database.dart';
import 'package:notepad_forwangtao_android/widget/notepage/note.dart';
import 'package:get/get.dart';

class HandwritingModePage extends StatelessWidget {
  const HandwritingModePage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    var a = checkNotepad(arguments['notepadID']);
    print('这里是$a');
    return const Scaffold(
      appBar: HandwritingAppBar(
        notepadName: '随便了',
      ),
      body: Stack(
        children: [
          HandwritingToolBar(toolbarAlignment: Alignment.bottomCenter),
        ],
      ), // TODO 书写界面优化中
      bottomNavigationBar: HandwritingBottomBar(),
    );
  }
}

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    // 从前面获取到记事本ID，就能访问记事本了
    final arguments = Get.arguments;
    var noteData = checkNotepad(arguments['notepadID']);
    // 如果记事本信息没传过来，就显示一个加载标志
    if (noteData != Future) {
      return const Center();
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
