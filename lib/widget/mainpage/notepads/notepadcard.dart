part of '../notepads.dart';

class NotepadPreviewCard extends StatefulWidget {
  /// 记事本名字 [String]
  ///
  ///
  final String notepadName;

  /// 记事本类型
  final bool notepadType;

  /// 上次打开信息
  final DateTime lastViewTime;

  /// 上次修改信息
  final DateTime lastEditTime;

  const NotepadPreviewCard(
      {super.key,
      required this.notepadName,
      required this.notepadType,
      required this.lastViewTime,
      required this.lastEditTime});

  @override
  State<NotepadPreviewCard> createState() => _NotepadPreviewCardState();
}

class _NotepadPreviewCardState extends State<NotepadPreviewCard> {
  @override
  Widget build(BuildContext context) {
    // 定义记事本的路由位置
    String notepadRouter(int notepadType) {
      switch (notepadType) {
        case 0:
          return '/note/handwriting';
        case 1:
          return '/note/markdown';
        case 2:
          return '/note/pdf';
      }
      return '/note/markdown';
    }

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
    String lastViewTimeEasyRead = formatEasyreadTime(widget.lastViewTime);
    String lastEditTimeEasyRead = formatEasyreadTime(widget.lastEditTime);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => {},
        onLongPress: () => notepadPreviewSetDialog(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(cardBackground(widget.notepadType),
                  size: 80,
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Text(
                  widget.notepadName,
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
