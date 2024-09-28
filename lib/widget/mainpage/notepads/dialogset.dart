part of '../notepads.dart';

class NotepadSetDialogUnit extends StatelessWidget {
  /// 记事本名称，会在dialog突出显示
  final String notepadName;

  /// 按下“重命名”按钮
  final VoidCallback? pressRename;

  /// 按下“修改标签”按钮
  final VoidCallback? pressSetTag;

  /// 按下“删除按钮”
  final VoidCallback? pressDelete;

  /// 记事本设置dialog，可以对记事本本体进行设置
  ///
  /// 设置记事本名称，标签，或者删除记事本
  const NotepadSetDialogUnit(
      {super.key,
      required this.notepadName,
      this.pressRename,
      this.pressSetTag,
      this.pressDelete});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      title:
          Icon(Icons.description, color: Theme.of(context).colorScheme.primary),
      children: [
        ListTile(
            leading: Icon(Icons.drive_file_rename_outline,
                color: Theme.of(context).colorScheme.primary),
            title: const Text('重命名'),
            subtitle: const Text('这将对记事本开头的字迹进行修改'),
            onTap: pressRename),
        ListTile(
            leading:
                Icon(Icons.tag, color: Theme.of(context).colorScheme.primary),
            title: const Text('增删标签（暂不可用，开发中）'),
            subtitle: const Text('标签可以对记事本进行归类，某些标签还能影响记事本的配置'),
            onTap: pressSetTag),
        ListTile(
            leading: Icon(Icons.delete,
                color: Theme.of(context).colorScheme.primary),
            title: Text('丢弃 "$notepadName"'),
            subtitle: Text('"$notepadName" 将被永久删除（以后会开发垃圾桶保留功能）'),
            onTap: pressDelete),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}

class NotepadsChildSetDialogUnit extends StatelessWidget {
  /// 记事本合集子目录名称，会在dialog突出显示
  final String notepadsChildName;

  /// 按下“重命名”按钮
  final VoidCallback? pressRename;

  /// 按下“移动目录”按钮
  final VoidCallback? pressMove;

  /// 按下“删除按钮”
  final VoidCallback? pressDelete;

  /// 记事本设置dialog，可以对记事本本体进行设置
  ///
  /// 设置记事本名称，标签，或者删除记事本
  const NotepadsChildSetDialogUnit(
      {super.key,
      required this.notepadsChildName,
      this.pressRename,
      this.pressMove,
      this.pressDelete});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      title: const Icon(Icons.folder),
      children: [
        ListTile(
            leading: Icon(Icons.drive_file_rename_outline,
                color: Theme.of(context).colorScheme.primary),
            title: const Text('重命名'),
            onTap: pressRename),
        ListTile(
            leading: Icon(Icons.drive_file_move,
                color: Theme.of(context).colorScheme.primary),
            title: Text('移动 "$notepadsChildName" 子目录（暂不可用，开发中）'),
            onTap: pressMove),
        ListTile(
            leading: Icon(Icons.delete,
                color: Theme.of(context).colorScheme.primary),
            title: Text('删除 "$notepadsChildName" 子目录'),
            subtitle: Text('"$notepadsChildName" 包括里面的记事本将被永久删除！真的你以后就见不到它们了！'),
            onTap: pressDelete),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
