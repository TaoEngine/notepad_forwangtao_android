import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notepad_forwangtao_android/widget/note_page/handwriting.dart';

class HandwritingModePage extends StatelessWidget {
  const HandwritingModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WritingPanelOld(),
      floatingActionButton: FloatingActionButton(
          tooltip: '回到记事本合集',
          onPressed: () => {},
          child: const FaIcon(FontAwesomeIcons.book)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
