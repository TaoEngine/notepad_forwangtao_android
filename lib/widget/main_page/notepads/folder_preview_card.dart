part of '../notepads.dart';

class FolderPreviewWidget extends StatelessWidget {
  /// 文件夹预览卡片
  const FolderPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => {},
        onLongPress: () => {},
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: 200, minHeight: 50, maxWidth: 320, maxHeight: 80),
          child: const Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(Icons.folder),
              title: Text('物流装备代表'),
              subtitle: Text('内含 3 篇记事本'),
            ),
          ),
        ),
      ),
    );
  }
}
