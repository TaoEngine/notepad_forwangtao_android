part of '../notepads.dart';

class NotepadAppbar extends StatelessWidget implements PreferredSizeWidget {
  /// Notepads的AppBar组件
  const NotepadAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Get.toNamed("/notehome"),
          icon: const Icon(Icons.collections_bookmark)),
      centerTitle: false,
      title: const ListTile(
        title: Text(
          '采购与供应管理',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '/',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () => Get.toNamed('/notify'),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Get.toNamed('/search'), //TODO 待实现按下“搜索”按钮的逻辑
        ),
        IconButton(
          icon: const Icon(Icons.style),
          onPressed: () => styleDialog(context), //按下“界面设置"按钮就会弹出设置style的弹出框
        )
      ],
    );
  }
}
