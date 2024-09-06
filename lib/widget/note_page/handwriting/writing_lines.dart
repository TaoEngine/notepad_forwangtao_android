part of '../handwriting.dart';

class WritingLines extends StatelessWidget {
  // 渲染书写格子，可以画横线、网格甚至康奈尔斜线
  const WritingLines({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      painter: LinePainter(context),
    );
  }
}

class LinePainter extends CustomPainter {
  final BuildContext context;

  LinePainter(this.context);
  @override
  void paint(Canvas canvas, Size size) {
    // 获取设备宽度和高度
    double driverWidth = MediaQuery.of(context).size.width;
    double driverHeight = MediaQuery.of(context).size.height;

    Paint linePaint = Paint()
      ..color = Theme.of(context).colorScheme.onSurface
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (var i = 0; i < driverHeight; i += 60) {
      double leng = i.toDouble();
      canvas.drawLine(
          Offset(20, leng), Offset(driverWidth - 20, leng), linePaint);
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}
