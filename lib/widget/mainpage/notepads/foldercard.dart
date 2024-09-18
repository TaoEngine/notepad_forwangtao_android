part of '../notepads.dart';

class FolderPreviewWidget extends StatelessWidget {
  /// 子目录名字
  final String folderName;

  /// 子目录内有多少记事本
  final int notepadsCount;

  const FolderPreviewWidget({
    super.key,
    required this.folderName,
    required this.notepadsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => {},
        onLongPress: () => {},
        child: Align(
          alignment: Alignment.center,
          child: ListTile(
            leading: Badge(
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: Text(
                notepadsCount != 0 ? notepadsCount.toString() : '空的',
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
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
