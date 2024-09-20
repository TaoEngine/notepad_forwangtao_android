part of '../notepads.dart';

class NotepadPreviewCard extends StatelessWidget {
  /// 记事本名字
  final String notepadName;

  /// 记事本类型
  final bool notepadType;

  /// 上次打开信息
  final DateTime lastViewTime;

  /// 上次修改信息
  final DateTime lastEditTime;

  /// 短按动作
  final VoidCallback? onOnePress;

  /// 长按动作
  final VoidCallback? onLongPress;

  const NotepadPreviewCard({
    super.key,
    required this.notepadName,
    required this.notepadType,
    required this.lastViewTime,
    required this.lastEditTime,
    this.onOnePress,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    /// 在面对不同笔记类型的情况下可以切换底纹来表示打开的文件
    IconData cardBackground(bool notebookType) {
      switch (notebookType) {
        case false:
          return FontAwesomeIcons.feather;
        case true:
          return FontAwesomeIcons.filePdf;
      }
    }

    // 将时间转换为更便于查看的时间格式
    String lastViewTimeEasyRead = formatEasyreadTime(lastViewTime);
    String lastEditTimeEasyRead = formatEasyreadTime(lastEditTime);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onOnePress,
        onLongPress: onLongPress,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(cardBackground(notepadType),
                  size: 80, color: Theme.of(context).colorScheme.primary),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Text(
                  notepadName,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 150, 150, 150), fontSize: 25),
                ),
                subtitle: Text(
                  '上次查看 $lastViewTimeEasyRead\n最近修改 $lastEditTimeEasyRead',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 200, 200, 200), fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
