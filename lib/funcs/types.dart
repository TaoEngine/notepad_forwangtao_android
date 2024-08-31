import 'package:flutter/material.dart';
import '../static/notepad_icon.dart';

/// 定义各记事本的枚举类型，是
///
/// 包含了[String]记事本的页面地址和[IconData]记事本的显示图标
///
/// - **手写**记事本
/// - **Markdown**记事本
/// - **PDF注记**记事本
enum ImportNoteType {
  handwritingNote('/note/handwriting', NoteTypeFont.writeIcon),
  markdownNote('/note/markdown', NoteTypeFont.markdownIcon),
  pdfNote('/note/pdf', NoteTypeFont.pdfIcon);

  const ImportNoteType(this.notebookRoute, this.notebookIcon);
  final String notebookRoute;
  final IconData notebookIcon;
}
