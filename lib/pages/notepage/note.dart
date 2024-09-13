import 'package:flutter/material.dart';
import 'package:notepad_forwangtao_android/widget/notepage/note.dart';

class HandwritingModePage extends StatelessWidget {
  const HandwritingModePage({super.key});

  @override
  Widget build(BuildContext context) {
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
