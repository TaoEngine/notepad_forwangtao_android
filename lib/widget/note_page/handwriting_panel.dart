import 'package:flutter/material.dart';

class HandwritingPanel extends StatefulWidget {
  const HandwritingPanel({super.key});

  @override
  State<HandwritingPanel> createState() => _HandwritingPanelState();
}

class _HandwritingPanelState extends State<HandwritingPanel> {
  @override
  Widget build(BuildContext context) {
    return const CustomPaint();
  }
}

/// 在打开笔记之前

/// 画板
class HandwritingPainter extends CustomPainter {
  /// 做出绘制动作
  @override
  void paint(Canvas canvas, Size size) {}

  ///
  @override
  bool shouldRepaint(HandwritingPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(HandwritingPainter oldDelegate) => false;
}
