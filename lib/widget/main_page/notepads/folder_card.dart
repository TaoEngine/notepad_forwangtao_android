part of '../notepads.dart';

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
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
