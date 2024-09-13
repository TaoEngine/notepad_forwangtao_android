part of '../note.dart';

class HandwritingAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// “记事本编辑”页面的AppBar组件
  ///
  /// 记事本编辑页，可在这个页面中编辑所有记事本，包括手写记事本和PDF记事本
  ///
  /// 该AppBar其实在本APP中非常通用，无论是首页、记事本合集页还是记事本编辑页都能见到它，
  /// 但是因为每个页面都有特定的功能和定位，我对每个Appbar都做了一遍定制化
  const HandwritingAppBar({super.key, required this.notepadName});

  /// 记事本的名称
  final String notepadName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(notepadName),
      actions: [
        IconButton(
          icon: const Icon(Icons.task),
          onPressed: () => {},
          tooltip: '今日任务',
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => {},
          tooltip: '在记事本内搜索',
        ),
        IconButton(
          icon: const Icon(Icons.style),
          onPressed: () => {},
          tooltip: '记事本主题',
        )
      ],
    );
  }
}
