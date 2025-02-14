import 'package:flutter/material.dart';

class AppBarModel extends StatelessWidget implements PreferredSizeWidget {
  /// AppBar的大标题
  final String appbarTitle;

  /// AppBar的小标题（可选）
  final String? appbarSubtitle;

  /// AppBar给谁用(首页、记事本合集、记事本)
  final String appbarMode;

  /// AppBar是否含有左侧按钮
  final bool appbarLeftButton;

  /// 左侧按钮的图标
  final IconData? iconLeftButton;

  /// 左侧按钮的描述
  final String? describeLeftButton;

  /// 按下左侧按钮
  final VoidCallback? pressLeftButton;

  /// 按下Task按钮
  final VoidCallback? pressTaskButton;

  /// 按下Search按钮
  final VoidCallback? pressSearchButton;

  /// 按下Style按钮
  final VoidCallback? pressStyleButton;

  /// AppBar模板
  ///
  /// 该AppBar其实在本APP中非常通用，无论是首页、记事本合集页还是记事本编辑页都能见到它
  ///
  /// 但是因为每个页面都有特定的功能和定位，我对每个Appbar都做了一遍定制化
  const AppBarModel(
      {super.key,
      required this.appbarTitle,
      required this.appbarMode,
      required this.appbarLeftButton,
      this.appbarSubtitle,
      this.iconLeftButton,
      this.describeLeftButton,
      this.pressLeftButton,
      this.pressTaskButton,
      this.pressSearchButton,
      this.pressStyleButton});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // 固定的通知、搜索、界面设置键
    List<Widget> actionsButton = [
      IconButton(
        icon: const Icon(Icons.task),
        onPressed: pressTaskButton,
        tooltip: '今日任务(正在做，敬请期待)',
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: pressSearchButton,
        tooltip: '在$appbarMode内搜索(正在做，敬请期待)',
      ),
      IconButton(
        icon: const Icon(Icons.style),
        onPressed: pressStyleButton,
        tooltip: '$appbarMode的主题(正在做，敬请期待)',
      )
    ];

    var leadingButton = appbarLeftButton
        ? IconButton(
            onPressed: pressLeftButton,
            icon: Icon(iconLeftButton),
            tooltip: describeLeftButton,
          )
        : null;

    var title = appbarSubtitle == null
        ? Text(
            appbarTitle,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          )
        : ListTile(
            title: Text(
              appbarTitle,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              appbarSubtitle!,
              style: Theme.of(context).textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
            ));

    return AppBar(
        leading: leadingButton,
        centerTitle: false,
        title: title,
        actions: actionsButton);
  }
}
