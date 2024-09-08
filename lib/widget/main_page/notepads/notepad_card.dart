part of '../notepads.dart';

class NotepadPreviewCard extends StatefulWidget {
  /// 记事本名字 [String]
  ///
  ///
  final String notepadName;

  /// 记事本类型
  final int notepadType;

  /// 上次打开信息
  final DateTime lastViewTime;

  /// 上次修改信息
  final DateTime lastEditTime;

  /// 记事本预览卡片的布局组件
  /// - 卡片底牌: 记事本类型图标
  /// - 卡片正文: 记事本的正文缩略图
  /// - 卡片左下角大字: 记事本名称
  /// - 卡片左下角小字: 记事本的编辑时间和查看时间
  NotepadPreviewCard({super.key, required this.importNotepadInfo})
      : notepadName = importNotepadInfo['notepadName'],
        notepadType = importNotepadInfo['notepadType'],
        lastViewTime = importNotepadInfo['lastViewTime'],
        lastEditTime = importNotepadInfo['lastEditTime'];

  /// 记事本的预览信息
  ///
  /// 该卡片可以展示记事本的名称、类型、各时间及记事本预览（最重要），因此需要包含这些关键因素：
  ///
  /// - `notepadName`: 记事本名字 [String]
  /// - `notepadType`: 记事本类型 [int]
  ///   - "0"表示 **手写** 记事本
  ///   - "1"表示 **Markdown** 记事本
  ///   - "2"表示 **PDF注记** 记事本
  /// - `lastViewTime`: 上次查看信息的**时间戳** [DateTime]
  /// - `lastEditTime`: 上次修改信息的**时间戳** [DateTime]
  ///
  /// 模板：
  /// ```dart
  /// NotepadPreviewCard(importNotepadInfo: {
  ///   'notepadName': '记事本标题',
  ///   'notepadType': 0,
  ///   'lastViewTime': DateTime.now(),
  ///   'lastEditTime': DateTime.now(),
  /// }),
  /// ```
  final Map<String, dynamic> importNotepadInfo;

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
    IconData? cardBackground(int notebookType) {
      IconData? cardBackground;
      switch (notebookType) {
        case 0:
          cardBackground = const FaIcon(FontAwesomeIcons.feather) as IconData?;
          break;
        case 1:
          cardBackground = const FaIcon(FontAwesomeIcons.markdown) as IconData?;
          break;
        case 2:
          cardBackground = const FaIcon(FontAwesomeIcons.filePdf) as IconData?;
          break;
      }
      return cardBackground;
    }

    // 将时间转换为更便于查看的时间格式
    String lastViewTimeEasyRead = formatEasyreadTime(widget.lastViewTime);
    String lastEditTimeEasyRead = formatEasyreadTime(widget.lastEditTime);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => {},
        onLongPress: () => notebookPreviewSetDialog(context),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(cardBackground(widget.notepadType),
                  size: 80,
                  color: Theme.of(context).colorScheme.primaryContainer),
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
