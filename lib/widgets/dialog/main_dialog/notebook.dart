import 'package:flutter/material.dart';

/// 一个引导用户调整style的对话框
///
/// 可以设置：
/// - 临时切换亮暗，方便在环境变化的时候也能适应记事本的亮度
/// - 视图模式调整，有列表和预览两种模式
/// - 对笔记进行归类，分类算法可在设置中调整
/// - 可以调整笔记的大小，方便到时候我在不同设备上使用的时候也能看清楚笔记内容
/// - 进入设置的快捷通道
styleDialog(context) async {
  var styleDialogWidget = await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: const Center(
              child: Icon(Icons.style),
            ),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.pageview),
                title: const Text('视图大小'),
                subtitle: const Text('10pt\n短按放大长按缩小'),
                trailing: IconButton.filledTonal(
                  icon: const Icon(Icons.search),
                  onPressed: () => {}, //TODO 调整视图的按钮，按下可临时放大或缩小视图
                ),
              ),
              ListTile(
                leading: const Icon(Icons.brightness_4),
                title: const Text('临时切换亮暗'),
                subtitle: const Text('未修改\n不是暗色模式'),
                trailing: IconButton.filledTonal(
                  icon: const Icon(Icons.brightness_auto),
                  onPressed: () => {}, //TODO 临时切换亮暗的按钮，快速切换深色浅色模式以适应环境
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('视图模式'),
                subtitle: const Text('预览图'),
                trailing: IconButton.filledTonal(
                  icon: const Icon(Icons.dashboard),
                  onPressed: () => {}, //TODO 视图模式的按钮，能以列表与预览图的方式展示记事本内容
                ),
              ),
              ListTile(
                leading: const Icon(Icons.sort),
                title: const Text('排序方式'),
                subtitle: const Text('创建日期'),
                trailing: IconButton.filledTonal(
                  icon: const Icon(Icons.timelapse),
                  onPressed: () =>
                      {}, //TODO 排序方式的按钮，通过最近/早创建，最近/早查看，最近/早修改的方式进行笔记的排序
                ),
              ),
              ListTile(
                leading: const Icon(Icons.filter_list),
                title: const Text('记事本归类'),
                subtitle: const Text('不归类'),
                trailing: IconButton.filledTonal(
                  icon: const Icon(Icons.highlight_off),
                  onPressed: () => {}, //TODO 笔记归类的按钮，根据笔记的特有特征或者标签等进行笔记的归类
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings_applications),
                title: const Text('个性化设置'),
                subtitle: const Text('配置更多个性化选项'),
                onTap: () => {}, //TODO 按下后进入个性化设置
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ));
  return styleDialogWidget;
}

/// 一个长按就能设置笔记预览卡片各功能的对话框
///
/// 可以设置:
/// -
/// -
notebookPreviewSetDialog(context) async {
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
