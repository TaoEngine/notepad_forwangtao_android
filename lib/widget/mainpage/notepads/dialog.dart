part of '../notepads.dart';

class WarnDialogUnit extends StatelessWidget {
  /// 警示描述
  final String labelText;

  /// 确认文本
  final String doesText;

  /// 按下确认
  final VoidCallback pressDoes;

  const WarnDialogUnit({
    super.key,
    required this.labelText,
    required this.doesText,
    required this.pressDoes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Theme.of(context).colorScheme.error,
      title: Icon(Icons.warning, color: Theme.of(context).colorScheme.error),
      content: SizedBox(
          height: 80,
          child: Center(
            child: Text(
              labelText,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.error, fontSize: 18),
            ),
          )),
      actions: [
        TextButton(
          child: Text("我不敢",
              style: TextStyle(color: Theme.of(context).colorScheme.error)),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          onPressed: pressDoes,
          child: Text(doesText,
              style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ),
      ],
    );
  }
}

class InputDialogUnit extends StatefulWidget {
  /// 窗口描述
  final String labelText;

  /// 执行按钮名称
  final String doesText;

  /// 按下执行按钮，回传输入的文本
  final ValueChanged<String> pressDoes;

  /// 具备有输入功能的Dialog组件
  ///
  /// 注意需要为它配一个启动器才能显示
  const InputDialogUnit({
    super.key,
    required this.labelText,
    required this.doesText,
    required this.pressDoes,
  });

  @override
  State<InputDialogUnit> createState() => _InputDialogUnitState();
}

class _InputDialogUnitState extends State<InputDialogUnit> {
  String input = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      title: Icon(Icons.drive_file_rename_outline,
          color: Theme.of(context).colorScheme.primary),
      content: SizedBox(
        height: 60,
        child: TextField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: widget.labelText),
          onChanged: (value) {
            setState(() {
              input = value;
            });
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text("算了"),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: input.isNotEmpty
                  ? Theme.of(context).colorScheme.primary
                  : null,
              foregroundColor: input.isNotEmpty
                  ? Theme.of(context).colorScheme.primaryContainer
                  : null),
          onPressed:
              // 将输入内容回传给上一级，用call
              input.isNotEmpty ? () => widget.pressDoes.call(input) : null,
          child: Text(widget.doesText),
        ),
      ],
    );
  }
}
