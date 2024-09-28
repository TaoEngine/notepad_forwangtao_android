part of './mainpage.dart';

class Padview extends StatefulWidget {
  /// 供**安卓平板、chromebook平板使用**的“汪涛的记事本”安卓平板版（HD版😅）界面
  ///
  /// 相对于手机版，平板端由于是大屏，且我们通常会在平板上记一些笔记啊、知识啊之类的
  /// 长记事本内容，且经常使用手写笔进行书写操作而不像手机使用打字比较多\
  /// （平板打字本来就是非常困难的一件事，尤其是使用虚拟键盘而非蓝牙键盘或者键盘保护套）
  ///
  /// 因此在设计平板的书写界面时就应该考虑大屏的布局。比如在翻阅记事本内容的时候，
  /// 可以采用类似苹果备忘录的双窗格布局。\
  /// 左边放所有所有包含在设备上的记事本合集，设计时只需方便上下滑动进行快速选择就行了，
  /// 此时可以将一些对记事本合集的操作功能收纳到二级菜单上。\
  /// 而对右边的单个记事本合集页面来说，在使用的时候就要考虑到对里面包含的记事本进行操作了。
  /// 因为相对于左边，右边分到的屏幕一般较大，且右手比左手灵活，
  /// 因此可以将一些常用的操作功能从二级菜单上展开
  ///
  /// 在后面，对手写的使用进行优化，然后对打字进行稍许的退化
  const Padview({super.key});

  @override
  State<Padview> createState() => _PadviewState();
}

class _PadviewState extends State<Padview> {
  // 左栏布局所占比例
  int leftFlex = 300;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: leftFlex, child: const HomePage()),
        DragController(
          onDragged: (value) {},
          onDragging: (value) {
            // 换算拖动布局
            var dragFlex = value!.globalPosition.dx /
                MediaQuery.of(context).size.width *
                1000;
            // 如果拖动布局为3:7或者7:3之间，就应用拖动布局
            setState(() {
              dragFlex > 300 && dragFlex < 700
                  ? leftFlex = dragFlex.toInt()
                  : null;
            });
          },
          onDoubleClick: (value) {
            // 如果布局在3:7时，或许切换为1:1会更符合大众的操作
            setState(() {
              if (leftFlex == 300) {
                leftFlex = 500;
              } else {
                leftFlex = 300;
              }
            });
          },
        ),
        Expanded(flex: 1000 - leftFlex, child: const NotepadsPage())
      ],
    );
  }
}

class DragController extends StatefulWidget {
  /// 拖动控制器放手时反馈的拖动数值
  final ValueChanged onDragged;

  /// 拖动控制器正在拖动时反馈的拖动数值
  final ValueChanged<DragUpdateDetails?> onDragging;

  // 按两下复原布局
  final ValueChanged onDoubleClick;

  /// 安卓双屏界面使用的“拖动控制器”
  ///
  /// 大家应该都在平板上用过分屏工具吧，因为平板布局大，可以容身多个操作UI进行简单的多窗口操作，
  /// 一般来说大多数的分屏工具在分开两个应用的时候中间会留一个黑色的杆子，
  /// 供我们调节两个应用的大小。这个杆子其实我不知道官方叫它什么，因此我姑且就叫它 “拖动控制器”
  /// 好了
  ///
  /// 由于Flutter目前对多窗口的支持还是仅限于试验阶段 (Multiple Flutter Views 23年才推出)，
  /// 所以我能想到的就是直接在Flutter里面实现这样的布局和工具
  const DragController(
      {super.key,
      required this.onDragged,
      required this.onDragging,
      required this.onDoubleClick});

  @override
  State<DragController> createState() => _DragControllerState();
}

class _DragControllerState extends State<DragController> {
  // 开始拖动参数
  DragDownDetails? dragStartDetails;
  // 正在拖动参数
  DragUpdateDetails? dragOnDetails;
  // 结束拖动
  DragEndDetails? dragEndDetails;

  // 拖动器在按住的时候是会进行缩放的
  double controllerWidth = 3;
  double controllerHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Align(
          alignment: Alignment.center,
          child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  // 拖动器的外观设计
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedPadding(
                      padding: EdgeInsets.fromLTRB(controllerWidth,
                          controllerHeight, controllerWidth, controllerHeight),
                      duration: const Duration(milliseconds: 70),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),

                  // 拖动器的执行动作
                  GestureDetector(
                    // 手放在拖动器上方，可能要拖动，可以赋予拖动器动效（比如放大）
                    // 来表示这个东西可以拖动
                    onPanDown: (DragDownDetails dragStart) {
                      // 拖动器来一个放大一点点的动效，让人认为它能够被拖动
                      setState(() {
                        controllerHeight = 70;
                        controllerWidth = 3.1;
                      });
                      dragStartDetails = dragStart;
                    },
                    // 手按住了拖动器发生了拖动效果，现在就能对两个界面的flex进行改变了
                    onPanUpdate: (DragUpdateDetails dragOn) {
                      dragOnDetails = dragOn;
                      widget.onDragging.call(dragOnDetails);
                    },
                    // 手放掉，此时应该执行布局了
                    onPanEnd: (DragEndDetails dragEnd) {
                      setState(() {
                        controllerHeight = 40;
                        controllerWidth = 3;
                      });
                      dragEndDetails = dragEnd;
                    },
                    // 修复下点一下无法还原拖动器布局的Bug
                    onTap: () {
                      setState(() {
                        controllerHeight = 40;
                        controllerWidth = 3;
                      });
                    },
                    // 如果点两下，就恢复布局，此时恢复函数见上
                    onDoubleTap: () {
                      setState(() {
                        controllerHeight = 40;
                        controllerWidth = 3;
                      });
                      widget.onDoubleClick.call(null);
                    },
                  ),
                ],
              ))),
    );
  }
}
