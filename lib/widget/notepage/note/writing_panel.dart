part of '../note.dart';

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
class WritingPanelOld extends StatefulWidget {
  const WritingPanelOld({super.key});

  @override
  State<WritingPanelOld> createState() => _WritingPanelOldState();
}

class _WritingPanelOldState extends State<WritingPanelOld> {
  WritingScript writingScripts = WritingScript([], Colors.amber);
  WritingScript writingScriptsLast = WritingScript([], Colors.amber);
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          // 渲染底纹
          Shading(
            shadingLineOrDot: true,
            horizontalLineWithit: 50,
            verticalLineWithit: 0,
            horizontalLineWithedge: 0.9,
          ),

          // 书写即时渲染
          WritingPanel()
        ],
      ),
    );
  }
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
