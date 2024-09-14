part of '../note.dart';

class NoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// “记事本编辑”页面的AppBar组件
  ///
  /// 记事本编辑页，可在这个页面中编辑所有记事本，包括手写记事本和PDF记事本
  ///
  /// 该AppBar其实在本APP中非常通用，无论是首页、记事本合集页还是记事本编辑页都能见到它，
  /// 但是因为每个页面都有特定的功能和定位，我对每个Appbar都做了一遍定制化
  const NoteAppBar({super.key, required this.notepadName});

  /// 记事本的名称
  final String notepadName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // 固定的通知、搜索、界面设置键
    List<Widget> actionsButton = [
      const IconButton(
        icon: Icon(Icons.task),
        // TODO Todo页面还没做出来
        onPressed: null,
        tooltip: '今日任务(正在做，敬请期待)',
      ),
      const IconButton(
        icon: Icon(Icons.search),
        // TODO 记事本搜索功能没做出来
        onPressed: null,
        tooltip: '在记事本内搜索(正在做，敬请期待)',
      ),
      const IconButton(
        icon: Icon(Icons.style),
        // TODO 设置记事本主题功能没做出来
        onPressed: null,
        tooltip: '记事本的主题(正在做，敬请期待)',
      )
    ];

    return AppBar(
        centerTitle: false, title: Text(notepadName), actions: actionsButton);
  }
}
