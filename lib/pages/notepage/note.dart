import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:notepad_forwangtao_android/funcs/database.dart';
import 'package:notepad_forwangtao_android/static/datamodel.dart';
import 'package:notepad_forwangtao_android/widget/notepage/note.dart';
import 'package:notepad_forwangtao_android/widget/shared/appbar.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  /// 是否展示手写工具栏
  bool handwritingToolBar = false;

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
          appbarTitle: noteName ?? '默认记事本',
          appbarMode: noteName ?? '默认记事本',
          appbarLeftButton: false),
      body: Stack(children: [
        // 手写工具组件
        handwritingToolBar
            ? const HandwritingToolBar(toolbarAlignment: Alignment.bottomCenter)
            : Container(),
      ]),
      bottomNavigationBar: HandwritingBottomBar(
        // 按下“弹出键盘”按钮
        pressTypingButton: () => setState(() {
          handwritingToolBar = false;
          SystemChannels.textInput.invokeMethod<void>('TextInput.show');
        }),

        // 按下“手写”按钮
        pressHandWritingButton: () => setState(() {
          handwritingToolBar = !handwritingToolBar;
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
