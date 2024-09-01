part of '../notepads.dart';

class FolderPreviewWidgetOld extends StatelessWidget {
  /// 文件夹预览卡片
  const FolderPreviewWidgetOld({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => {},
        onLongPress: () => {},
        child: ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: 100, minHeight: 25, maxWidth: 200, maxHeight: 50),
          child: const Align(
            alignment: Alignment.center,
            child: ListTile(
              leading: Icon(
                Icons.folder,
                size: 25,
              ),
              title: Text(
                '物流装备代表',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FolderPreviewWidget extends StatelessWidget {
  final String folderName;
  final int notepadsCount;

  FolderPreviewWidget({super.key, required this.importFolderInfo})
      : folderName = importFolderInfo['folderName'],
        notepadsCount = importFolderInfo['notepadsCount'];

  final Map importFolderInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => {},
        onLongPress: () => {},
        child: Align(
          alignment: Alignment.center,
          child: ListTile(
            leading: Badge(
              label: Text('x$notepadsCount'),
              child: const Icon(Icons.folder),
            ),
            title: Text(
              folderName,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
