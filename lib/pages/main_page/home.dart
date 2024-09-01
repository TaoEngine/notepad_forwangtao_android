import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  /// 记事本的集合页面
  ///
  /// 所有记事本都放在这里了
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 主页的AppBar及其导航逻辑
  ///
  /// 部件依次是：
  /// - “设置”按钮
  /// - “显示通知"按钮
  /// - “界面设置"按钮
  const HomeAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.settings_applications),
        onPressed: () => {}, //TODO 按下进入设置首页
      ),
      title: const Text('汪涛的记事本'),
      actions: [
        IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => {
                  Navigator.pushNamed(context, '/notify')
                } //TODO 按下“显示通知"按钮可以接收app需要你做的事情
            ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => {}, //TODO 待实现按下“搜索”按钮的逻辑
        ),
        IconButton(icon: const Icon(Icons.style), onPressed: () => {}),
      ],
    );
  }
}
