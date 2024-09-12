part of '../notepads.dart';

class NotepadAppbar extends StatelessWidget implements PreferredSizeWidget {
  /// “记事本合集”页面的AppBar组件
  ///
  /// 记事本合集，就是对所有记事本文件做一个集合，这样就能将相似的记事本放在一块，防止遗漏了
  ///
  /// 该AppBar其实在本APP中非常通用，无论是首页、记事本合集页还是记事本编辑页都能见到它，
  /// 但是因为每个页面都有特定的功能和定位，我对每个Appbar都做了一遍定制化
  const NotepadAppbar({
    this.notepadsDirName = '',
    super.key,
    required this.notepadsName,
  });

  /// 记事本合集的路径名称
  ///
  /// 留空为根目录
  final String notepadsDirName;

  /// 记事本合集的名称
  ///
  ///
  final String notepadsName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // 界面模板

    // 如果是在根目录下，左上角按键就更换成这个
    IconButton rootLeading = IconButton(
      onPressed: () => {},
      icon: const Icon(Icons.collections_bookmark),
      tooltip: '记事本一览',
    );

    // 如果在根目录下，标题将只是Text
    // 相反的，标题将更换为“当前路径”+“根目录”的组合
    Widget rootTitle = Text(
      notepadsName,
      style: Theme.of(context).textTheme.titleLarge,
      overflow: TextOverflow.ellipsis,
    );
    Widget innerTitle = ListTile(
        title: Text(
          notepadsDirName,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          notepadsName,
          style: Theme.of(context).textTheme.labelMedium,
          overflow: TextOverflow.ellipsis,
        ));

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
        // TODO 合集搜索功能没做出来
        onPressed: null,
        tooltip: '在合集中搜索(正在做，敬请期待)',
      ),
      const IconButton(
        icon: Icon(Icons.style),
        // TODO 设置合集主题功能没做出来
        onPressed: null,
        tooltip: '合集的主题(正在做，敬请期待)',
      )
    ];

    // 检测传入的是根目录还是某路径
    if (notepadsDirName == '') {
      return AppBar(
          leading: rootLeading,
          centerTitle: false,
          title: rootTitle,
          actions: actionsButton);
    } else {
      return AppBar(
          leading: rootLeading,
          centerTitle: false,
          title: innerTitle,
          actions: actionsButton);
    }
  }
}
