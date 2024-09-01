part of '../notepads.dart';

class NotebookPreviewCard extends StatefulWidget {
  //初始化导入的记事本信息
  final String notebookName;
  final int notebookType;
  final DateTime lastViewTime;
  final DateTime lastEditTime;

  /// 记事本预览卡片
  ///
  /// 通过引入**记事本信息**从而显示记事本的预览，需要传入的信息有：
  /// - `NotebookName`: 记事本名字
  /// - `NotebookType`: 记事本类型
  /// - `LastViewTime`: 上次查看信息
  /// - `LastEditTime`: 上次修改信息
  ///
  /// 给个模板哈:
  /// ```dart
  /// NotebookPreviewWidget(importNotebookInfo: {
  ///   'NotebookName': '物流装备',
  ///   'NotebookType': 1,
  ///   'LastViewTime': 时间戳,
  ///   'LastEditTime': 时间戳,
  /// }),
  /// ```
  NotebookPreviewCard({super.key, required this.importNotebookInfo})
      : notebookName = importNotebookInfo['NotebookName'],
        notebookType = importNotebookInfo['NotebookType'],
        lastViewTime = importNotebookInfo['LastViewTime'],
        lastEditTime = importNotebookInfo['LastEditTime'];

  /// 预览信息 [Map] :
  ///
  /// - `NotebookName`: 记事本名字 [String]
  /// - `NotebookType`: 记事本类型 [int]
  ///   - "0"表示 **手写** 记事本
  ///   - "1"表示 **Markdown** 记事本
  ///   - "2"表示 **PDF注记** 记事本
  /// - `LastViewTime`: 上次查看信息的**时间戳** [DateTime]
  /// - `LastEditTime`: 上次修改信息的**时间戳** [DateTime]
  final Map importNotebookInfo;

  /// 在面对不同笔记类型的情况下指定记事本的路由位置，然后就能更好的进入不同功能的记事本了
  /// - `NotebookType`: 记事本类型 [int]
  ///   - "0"表示 **手写** 记事本
  ///   - "1"表示 **Markdown** 记事本
  ///   - "2"表示 **PDF注记** 记事本
  String noteRouter(int notebookType) {
    String noteRouter = '/note/markdown';
    switch (notebookType) {
      case 0:
        noteRouter = '/note/handwriting';
        break;
      case 1:
        noteRouter = '/note/markdown';
        break;
      case 2:
        noteRouter = '/note/pdf';
        break;
    }
    return noteRouter;
  }

  /// 记事本预览卡片的触摸事件
  ///
  /// 需要引入child作为记事本本体的子元素
  /// - 点按进入相应记事本
  /// - 长按设置相应记事本
  InkWell cardTouch(context, Widget? child, String noteEditRoute) => InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.pushNamed(context, noteEditRoute),
        onLongPress: () => notebookPreviewSetDialog(context),
        child: child,
      );

  @override
  State<NotebookPreviewCard> createState() => _NotebookPreviewCardState();
}

class _NotebookPreviewCardState extends State<NotebookPreviewCard> {
  @override
  Widget build(BuildContext context) {
    /// 记事本预览卡片本体
    InkWell cardtouch = widget.cardTouch(
        context,
        NotebookPreviewCardBoxView(
            notebookName: widget.notebookName,
            notebookType: widget.notebookType,
            lastViewTime: widget.lastViewTime,
            lastEditTime: widget.lastEditTime),
        widget.noteRouter(widget.notebookType));
    Card noteCard = Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(10),
        child: cardtouch);
    return noteCard;
  }
}

class NotebookPreviewCardBoxView extends StatelessWidget {
  //初始化导入的记事本信息
  final String notebookName;
  final int notebookType;
  final DateTime lastViewTime;
  final DateTime lastEditTime;

  /// 记事本预览卡片的布局组件
  /// - 卡片底牌: 记事本类型图标
  /// - 卡片正文: 记事本的正文缩略图
  /// - 卡片左下角大字: 记事本名称
  /// - 卡片左下角小字: 记事本的编辑时间和查看时间
  ///
  /// 通过引入**记事本信息**从而显示记事本的预览，需要传入的信息有：
  /// - `NotebookName`: 记事本名字
  /// - `NotebookType`: 记事本类型
  /// - `LastViewTime`: 上次查看信息
  /// - `LastEditTime`: 上次修改信息
  const NotebookPreviewCardBoxView(
      {super.key,
      required this.notebookName,
      required this.notebookType,
      required this.lastViewTime,
      required this.lastEditTime});

  /// 在面对不同笔记类型的情况下可以切换底纹来表示打开的文件
  IconData? cardBackground(int notebookType) {
    IconData? cardBackground;
    switch (notebookType) {
      case 0:
        cardBackground = NoteTypeFont.writeIcon;
        break;
      case 1:
        cardBackground = NoteTypeFont.markdownIcon;
        break;
      case 2:
        cardBackground = NoteTypeFont.pdfIcon;
        break;
    }
    return cardBackground;
  }

  @override
  Widget build(BuildContext context) {
    // 将时间转换为更便于查看的时间格式
    String lastViewTimeEasyRead = formatEasyreadTime(lastViewTime);
    String lastEditTimeEasyRead = formatEasyreadTime(lastEditTime);

    // 返回布局文件
    return ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 200, minHeight: 125, maxWidth: 320, maxHeight: 200),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                cardBackground(notebookType),
                size: 80,
                color: Theme.of(context)
                    .colorScheme
                    .inversePrimary
                    .withOpacity(0.4),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Text(
                  notebookName,
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
        ));
  }
}
