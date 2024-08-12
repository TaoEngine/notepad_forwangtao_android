import 'package:flutter/material.dart';
import '../../widgets/dialog/main_dialog/notebook.dart';
import '../../widgets/widget/main_page/notebook.dart';

class NotebookPage extends StatelessWidget {
  /// 显示记事本首页
  ///
  /// 主页主要存放单个记事本的所有笔记
  const NotebookPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime b = DateTime(2024, 8, 6);
    DateTime a = DateTime(2024, 3, 7);
    return Scaffold(
      appBar: const ViewAppBar(),
      body: NotebookPreviewCard(importNotebookInfo: {
        'NotebookName': '测试测试！',
        'NotebookType': 0,
        'LastViewTime': b,
        'LastEditTime': a,
      }),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit_note_outlined),
        label: const Text('记点啥'),
        onPressed: () => {}, //TODO 待实现按下“创建记事本”按钮的逻辑
      ),
    );
  }
}

class ViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 记事本集合的AppBar及其导航逻辑
  ///
  /// 部件依次是：
  /// - “阅览所有记事本”按钮
  /// - “记事本位置”标签
  /// - “显示通知"按钮
  /// - “界面设置"按钮
  const ViewAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.collections_bookmark),
        onPressed: () =>
            {Navigator.pushNamed(context, '/notehome')}, // 按下“阅览所有记事本”按钮的逻辑
      ),
      centerTitle: false,
      title: const ListTile(
        title: Text(
          '大三上物流导论',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '/第三章/物流装备',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actions: [
        IconButton.filledTonal(
          icon: const Icon(Icons.search),
          onPressed: () =>
              {Navigator.pushNamed(context, '/search')}, //TODO 待实现按下“搜索”按钮的逻辑
        ),
        const SizedBox(width: 4),
        IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => {
                  Navigator.pushNamed(context, '/notify')
                } //按下“显示通知"按钮可以接收app需要你做的事情
            ),
        const SizedBox(width: 4),
        IconButton(
          icon: const Icon(Icons.style),
          onPressed: () => styleDialog(context), //按下“界面设置"按钮就会弹出设置style的弹出框
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
