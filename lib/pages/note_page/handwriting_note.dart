import 'package:flutter/material.dart';
import '../../icon.dart';

class HandwritingModePage extends StatelessWidget {
  const HandwritingModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
              left: 8,
              top: 8,
              child: Column(
                children: [
                  IconButton.filledTonal(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, //TODO 短按保存记事本并返回记事本预览，按钮向下滑快速切换到其他的记事本
                      icon: const Icon(Icons.book)),
                  const SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      onPressed: () {}, //TODO 短按切换笔的颜色，按钮向下滑可以切换更多颜色
                      icon: const Icon(Icons.create),
                      color: Colors.red),
                  const SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      onPressed: () {}, //TODO 短按切换成橡皮，按钮向下滑清除笔迹
                      icon: const Icon(NoteIconFont.eraserIcon)),
                  const SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      onPressed: () {}, //TODO 短按可框选笔迹，无长按功能
                      icon: const Icon(Icons.select_all)),
                  const SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      onPressed: () {}, //TODO 短按撤销，长按多步撤销
                      icon: const Icon(Icons.undo)),
                  const SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      onPressed: () {}, //TODO 短按重做，长按多步重做
                      icon: const Icon(Icons.redo)),
                ],
              )),
          Positioned(
              left: 8,
              bottom: 8,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {}, //TODO 按下启用搜索，搜索当前记事本的内容
                      icon: const Icon(Icons.search)),
                  const SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      onPressed: () {}, //TODO 按下切换记事本样式
                      icon: const Icon(Icons.style)),
                ],
              ))
        ],
      ),
    ));
  }
}

class TakeHandwritingWidget extends StatefulWidget {
  const TakeHandwritingWidget({super.key});

  @override
  State<TakeHandwritingWidget> createState() => _TakeHandwritingWidgetState();
}

class _TakeHandwritingWidgetState extends State<TakeHandwritingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
