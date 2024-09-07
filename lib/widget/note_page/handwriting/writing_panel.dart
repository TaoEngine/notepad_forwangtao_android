part of '../handwriting.dart';

/// 书写笔迹，在笔或者触摸书写时定义写下的笔迹
/// - 笔迹位置
/// - 笔迹颜色
/// - 笔迹压感（在开发）
class WritingScript {
  final List<Offset> wScript;
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
  WritingScript writingScripts = WritingScript([], Colors.amber);
  WritingScript writingScriptsLast = WritingScript([], Colors.amber);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // 落笔
        onPanUpdate: (details) {
          setState(() {
            writingScripts.wScript.add(details.localPosition);
            writingScriptsLast.wScript.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            writingScripts.wScript.clear();
          });
        },
        child: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                // 渲染格子
                const WritingShading(
                  horizontalLineWithit: 50,
                  verticalLineWithit: 0,
                  horizontalLineWithedge: 8 / 9,
                ),

                // 打开就渲染
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                ),

                // 书写即时渲染
                CustomPaint(
                  // 书写后再统一渲染
                  painter: LastWriter(writingScriptsLast),
                  // 即时渲染
                  foregroundPainter: Writer(writingScripts),
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                ),
              ],
            )));
  }
}

class Writer extends CustomPainter {
  final WritingScript wScripts;

  Writer(this.wScripts);

  @override
  void paint(Canvas canvas, Size size) {
    Paint nowWrite = Paint()
      ..color = wScripts.wColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    if (wScripts.wScript.isNotEmpty) {
      for (var i = 0; i < wScripts.wScript.length; i++) {
        if (i > 1) {
          canvas.drawLine(
              wScripts.wScript[i - 1], wScripts.wScript[i], nowWrite);
        }
      }
    }
  }

  @override
  bool shouldRepaint(Writer oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(Writer oldDelegate) => false;
}

class LastWriter extends CustomPainter {
  final WritingScript wScripts;

  LastWriter(this.wScripts);

  @override
  void paint(Canvas canvas, Size size) {
    Paint nowWrite = Paint()
      ..color = wScripts.wColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    if (wScripts.wScript.isNotEmpty) {
      for (var i = 0; i < wScripts.wScript.length; i++) {
        canvas.drawCircle(wScripts.wScript[i], 1, nowWrite);
      }
    }
  }

  @override
  bool shouldRepaint(LastWriter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(LastWriter oldDelegate) => false;
}

// ///
// class ScriptFit {
//   final List<WritingScript> wScriptOriginal;
//   ScriptFit(this.wScriptOriginal);

//   /// 注意K的取值在[0.5,1)之间
//   wScriptFitted(double K, Paint paint, Canvas canvas) {
//     Path wScript = Path();

//     for (int i = 0; i < wScriptOriginal.length; i += 4) {
//       // 在面板上的第一个点A，Path从此出发
//       double startX = wScriptOriginal[i].wScript.dx;
//       double startY = wScriptOriginal[i].wScript.dy;
//       wScript.moveTo(startX, startY);

//       // 依据K推出第一个点A到下一个点B之间的点A'
//       double nextX = wScriptOriginal[i + 1].wScript.dx;
//       double nextY = wScriptOriginal[i + 1].wScript.dy;
//       double calcX = nextX - (nextX - startX).abs() * K;
//       double calcY = nextY - (nextY - startY).abs() * K;
//       wScript.lineTo(calcX, calcY);

//       // 检索第三个点C，然后点B作为控制点，点A'和点C为起点和终点，生成二次贝塞尔曲线
//       double thenX = wScriptOriginal[i + 2].wScript.dx;
//       double thenY = wScriptOriginal[i + 2].wScript.dy;
//       wScript.quadraticBezierTo(nextX, nextY, thenX, thenY);

//       //闭合
//       canvas.drawPath(wScript, paint);
//     }
//   }
// }
