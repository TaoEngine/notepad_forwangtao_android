part of '../notepads.dart';

notepadPreviewSetDialog(context) async {
  var notebookPreviewSetDialogWidget = await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: const Icon(Icons.insert_drive_file),
            children: [
              ListTile(
                  leading: const Icon(Icons.drive_file_rename_outline),
                  title: const Text('重命名'),
                  subtitle: const Text('这将对记事本开头的笔迹进行修改'),
                  onTap: () => {}),
              ListTile(
                  leading: const Icon(Icons.tag),
                  title: const Text('打上标签'),
                  subtitle: const Text('标签可以对记事本进行归类，某些标签还能影响记事本的配置'),
                  onTap: () => {}),
              ListTile(
                  leading: const Icon(Icons.not_interested),
                  title: const Text('丢弃 "测试测试"'),
                  subtitle: const Text('"测试测试" 将在30天后永久删除'),
                  onTap: () => {})
            ],
          ));
  return notebookPreviewSetDialogWidget;
}
