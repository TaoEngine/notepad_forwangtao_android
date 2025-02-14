part of '../note.dart';

class Writingtool extends StatefulWidget {
  /// 这是一个将手写字可视化的辅助打字小工具
  ///
  /// 上面有多少字，这里就有字数进度条
  ///
  /// 直接点按工具就能完成手写字的光标移位，多选和全选
  const Writingtool({super.key});

  @override
  State<Writingtool> createState() => _WritingtoolState();
}

class _WritingtoolState extends State<Writingtool> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 4,
            surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
            child: SizedBox(
              height: 72,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  Theme.of(context)
                                      .colorScheme
                                      .primaryContainer)),
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_return),
                        ),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
