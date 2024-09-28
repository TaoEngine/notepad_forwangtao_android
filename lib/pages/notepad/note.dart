import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:notepad_forwangtao_android/funcs/database.dart';
import 'package:notepad_forwangtao_android/static/datamodel.dart';
import 'package:notepad_forwangtao_android/widget/notepage/note.dart';
import 'package:notepad_forwangtao_android/widget/shared/appbar.dart';

class NotePage extends StatefulWidget {

  /// 编辑笔记界面，
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  /// 是否为手写模式
  bool handwritingMode = false;

  /// 是否为打字模式

  @override
  Widget build(BuildContext context) {
    // 从前面获取到记事本ID，就能访问记事本了
    final arguments = Get.arguments;
    var noteDB =
        NotepadsDB().getdb.notepadFiles.getSync(arguments['notepadID']);
    var noteName = noteDB?.notepadName;

    // 记事本布局
    return Scaffold(
      appBar: AppBarModel(
          appbarTitle: noteName ?? '新建记事本',
          appbarMode: noteName ?? '新建记事本',
          appbarLeftButton: false),
      body: Stack(children: [
        // 打字工具组件
        const TypingPanel(),

        // 手写工具组件
        handwritingMode
            ? const HandwritingToolBar(toolbarAlignment: Alignment.bottomCenter)
            : const Writingtool(),
      ]),
      bottomNavigationBar: HandwritingBottomBar(
        // 按下“弹出键盘”按钮
        pressTypingButton: () => setState(() {
          handwritingMode = false;
          SystemChannels.textInput.invokeMethod<void>('TextInput.show');
        }),

        // 按下“手写”按钮
        pressHandWritingButton: () => setState(() {
          handwritingMode = !handwritingMode;
        }),

        // 按下“插入”按钮
        pressInsertPhotoButton: null,

        // 按下“撤销”按钮
        pressUndoButton: null,

        // 按下“重做”按钮
        pressRedoButton: null,
      ),
    );
  }
}
