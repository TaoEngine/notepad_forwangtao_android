part of '../handwriting.dart';

/// 书写笔迹，在笔或者触摸书写时定义写下的笔迹
/// - 笔迹位置
/// - 笔迹颜色
/// - 笔迹压感（在开发）
class WritingScript {
  final List<Offset?> wScript;
  final Color wColor;
  // final int wPressure;
  WritingScript(this.wScript, this.wColor);
}

/// 书写面板
class WritingPanel extends StatefulWidget {
  const WritingPanel({super.key});

  @override
  State<WritingPanel> createState() => _WritingPanelState();
}

class _WritingPanelState extends State<WritingPanel> {
  final List<Offset> writepoint = <Offset>[];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // 落笔
        onPanUpdate: (details) {
          setState(() {
            writepoint.add(details.localPosition);
          });
        },
        onPanEnd: (details) => setState(() {}),
        child: Align(
          alignment: Alignment.center,
          child: CustomPaint(
            painter: Writer(wScripts: writepoint),
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
          ),
        ));
  }
}

/// 书写面板配套组件
class Writer extends CustomPainter {
  final List<Offset> wScripts;
  Writer({required this.wScripts});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3;
    for (int i = 0; i < wScripts.length; i++) {
      canvas.drawCircle(wScripts[i], 5, paint);
    }
  }

  @override
  bool shouldRepaint(Writer oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(Writer oldDelegate) => false;
}
