import 'package:flutter/material.dart';
import 'package:notepad_forwangtao_android/widget/note_page/handwriting.dart';

class HandwritingModePage extends StatelessWidget {
  const HandwritingModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HandwritingAppBar(),
      body: const Stack(
        children: [
          HandwritingToolBar(toolbarAlignment: Alignment.bottomCenter),
        ],
      ), // TODO 书写界面优化中
      bottomNavigationBar: const HandwritingBottomBar(),
      floatingActionButton: FloatingActionButton(
          tooltip: '回到记事本合集',
          onPressed: () => {},
          child: const Icon(Icons.book)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
