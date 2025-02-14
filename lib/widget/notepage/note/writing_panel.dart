part of '../note.dart';

class LittleWriter extends StatefulWidget {
  /// 画板
  ///
  /// 它主要实现的流程是这样的：
  /// - 首先，我在画板上画出的第一划的时候，笔或者手指落在屏幕的时候，开始建立一个新画布
  /// - 然后，笔或手指开始运动，此时测量一下手指到达的最远的地方，画布的大小也就这么大
  /// - 最后，手指放开，结束记录，将这个笔迹封存并且停止更新笔迹内容，将资源留给别的笔画
  const LittleWriter({super.key});

  @override
  State<LittleWriter> createState() => _LittleWriterState();
}

class _LittleWriterState extends State<LittleWriter> {
  /// 笔迹的组件放在这里
  List<Widget> writeWidgets = [];

  /// 笔迹起点
  Offset firstTouch = Offset.zero;

  /// 进行一次书写所留下的笔迹
  Path onceTouch = Path();

  @override
  Widget build(BuildContext context) {
    return Listener(
      // 设置全局监听笔迹
      behavior: HitTestBehavior.opaque,
      // 落笔书写
      onPointerDown: (event) => beginTouch(event),
      // 移动笔迹
      onPointerMove: (event) => moveTouch(event),
      // 笔离开屏
      onPointerUp: (event) => endTouch(event),
      // 用于存放笔迹的组件
      child: Stack(
        children: writeWidgets,
      ),
    );
  }

  /// 当笔（手指）落下来的操作
  /// - 创建新画布
  /// - 记录起点
  void beginTouch(PointerDownEvent touchevent) {
    firstTouch = touchevent.position;
    setState(() {
      writeWidgets.add(WriteWidget(
          topPosition: touchevent.position,
          bottomPosition: touchevent.position,
          writepath: onceTouch));
    });
  }

  /// 当笔（手指）在屏幕上移动的时候
  /// - 记录
  /// - 处理
  void moveTouch(PointerMoveEvent touchevent) {
    // 计算正确路径
    double touchdx = touchevent.position.dx - firstTouch.dx;
    double touchdy = touchevent.position.dy - firstTouch.dy;
    // 刷新笔迹
    writeWidgets.removeLast();
    onceTouch.lineTo(touchdx, touchdy);
    setState(() {
      writeWidgets.add(WriteWidget(
          topPosition: firstTouch,
          bottomPosition: touchevent.position,
          writepath: onceTouch));
    });
  }

  /// 当笔（手指）从屏幕上离开的时候
  /// - 封装这个笔迹
  /// - 停止让CustomPaint下一次画图再去刷新它
  void endTouch(PointerUpEvent touchevent) {
    firstTouch = Offset.zero;
    onceTouch = Path();
  }
}

class WriteWidget extends StatelessWidget {
  /// 书写组件的左上角
  final Offset topPosition;

  /// 书写组件的右下角
  final Offset bottomPosition;

  /// 显示的书写轨迹
  final Path writepath;

  const WriteWidget(
      {super.key,
      required this.topPosition,
      required this.bottomPosition,
      required this.writepath});

  @override
  Widget build(BuildContext context) {
    // 组件长宽
    double width = bottomPosition.dx - topPosition.dx;
    double height = bottomPosition.dy - topPosition.dy;

    // 是一个可大可小的组件
    return Positioned(
      left: topPosition.dx,
      top: topPosition.dy,
      width: width,
      height: height,
      child: CustomPaint(
        size: Size(width, height),
        painter: TestingPainter(writepath: writepath),
        // 让书写组件可以支持更复杂的笔画
        isComplex: true,
        willChange: true,
      ),
    );
  }
}

class TestingPainter extends CustomPainter {
  /// 在单一的一个笔迹框架内显示的笔迹
  Path writepath;

  /// 测试用画板，主要用于测试书写的笔迹进行还原的算法
  ///
  /// 首先，由于Flutter的画板在使用时会过于卡顿，我得想个办法解决此类卡顿
  ///
  /// 其次，简单的画笔处理出来的笔迹实在太丑啦，得让笔迹拟合一下并形成一定的风格，
  /// 这样写出来的字才好看
  ///
  /// 此次分析我主要是使用这些文章讲的进行操作
  ///
  /// 涉及笔迹分析：https://blog.csdn.net/luansxx/article/details/120960073
  ///
  /// 涉及笔迹拟合：https://www.cnblogs.com/zl03jsj/p/8047259.html
  ///
  /// 涉及笔迹风格化：https://cloud.tencent.com/developer/article/2364677
  ///
  /// 这是我为了研究此类问题对画板进行一些算法上的操作，它主要做这些事情：
  /// - 预处理，有些连在一起的点可以不要的，要对从画板上获取的一些点进行预处理，
  ///   找到那些有价值的点
  ///
  /// - 分析转折点，有一些字在书写的时候会有一些拐弯的地方，比如折，横折，竖钩等，
  ///   这些转折的地方通常会不同于其他地方，比如点会密集一些。
  ///   通过聚类的算法可以找到这些密集的点的位置大致在哪，然后就能找到这个转折点了
  ///
  /// - 拟合成曲线，大家用来拟合曲线的办法都是贝塞尔曲线哈，那我也不客气了！
  ///
  /// - 风格化，我花了半个月想到的方法是，在每个采集点上做一个圆，通过压感和速度来调整圆的半径，
  ///   通过离转折点的远近来调整圆的偏心度，最后填充一下轮廓即可。
  ///   结果我在网上找资料的时候发现早有人这么做了，还有更好大佬研制出的优化版呢！
  ///   那我得好好的学一下哈
  TestingPainter({required this.writepath});

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.color = Colors.black;
    p.style = PaintingStyle.stroke;
    p.strokeCap = StrokeCap.round;
    p.strokeJoin = StrokeJoin.round;
    p.strokeWidth = 5;
    canvas.drawPath(writepath, p);
  }

  @override
  bool shouldRepaint(TestingPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(TestingPainter oldDelegate) => false;
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
