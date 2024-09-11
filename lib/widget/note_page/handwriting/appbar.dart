part of '../handwriting.dart';

class HandwritingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HandwritingAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 80),
        child: Text('新记事本'),
      ),
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
