part of '../note.dart';

class WritingPanel extends StatefulWidget {
  const WritingPanel({super.key});

  @override
  State<WritingPanel> createState() => _WritingPanelState();
}

class _WritingPanelState extends State<WritingPanel> {
  // 打开记事本即刻书写的笔迹
  Map<int, List<Offset>> wScriptNow = {};
  List<Offset> wScriptNowTemp = [];
  int wScriptCount = 0;
  bool startWriting = false;

// TODO 这个绘画方式很不好，写到后面就会导致过度刷新然后就卡了
  @override
  Widget build(BuildContext context) {
    // 书写记录器，可以记录一切向屏幕输入的东西
    return Listener(
      // 书写画板
      child: CustomPaint(
        // 书写后再统一渲染
        painter: WriteScript(wScriptNow, startWriting),
        // 即时渲染
        foregroundPainter: LastWriteScript(wScriptNowTemp),

        // 缓存机制
        isComplex: true,
        willChange: true,

        size: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
      ),

      // 起笔
      onPointerDown: (event) {
        setState(() {
          startWriting = true;
        });
      },

      // 执笔
      onPointerMove: (event) {
        setState(() {
          wScriptNowTemp.add(event.localPosition);
        });
      },

      // 收笔
      onPointerUp: (event) {
        setState(() {
          wScriptNow.addAll({wScriptCount: List.from(wScriptNowTemp)});
          wScriptNowTemp.clear();
          startWriting = false;
          wScriptCount++;
        });
      },
    );
  }
}

class WriteScript extends CustomPainter {
  final Map<int, List<Offset>> wScriptNow;
  final bool startWriting;

  /// 即时书写组件
  WriteScript(this.wScriptNow, this.startWriting);

  @override
  void paint(Canvas canvas, Size size) {
    /// 笔迹
    Paint writer = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // 当有笔迹传入
    Path path = Path();
    for (var element in wScriptNow.values) {
      for (var i = 0; i < element.length; i++) {
        if (i == 0) {
          path.moveTo(element[i].dx, element[i].dy);
        } else {
          path.lineTo(element[i].dx, element[i].dy);
        }
      }
      canvas.drawPath(path, writer);
    }
  }

  @override
  bool shouldRepaint(WriteScript oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(WriteScript oldDelegate) => false;
}

class LastWriteScript extends CustomPainter {
  List<Offset> wScriptNowTemp;

  LastWriteScript(this.wScriptNowTemp);
  @override
  void paint(Canvas canvas, Size size) {
    Paint writer = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // 当有笔迹传入
    Path path = Path();
    for (var i = 0; i < wScriptNowTemp.length; i++) {
      if (i == 0) {
        path.moveTo(wScriptNowTemp[i].dx, wScriptNowTemp[i].dy);
      } else {
        path.lineTo(wScriptNowTemp[i].dx, wScriptNowTemp[i].dy);
      }
    }
    canvas.drawPath(path, writer);
  }

  @override
  bool shouldRepaint(LastWriteScript oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(LastWriteScript oldDelegate) => false;
}
