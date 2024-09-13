part of '../notepads.dart';

class CategoryChip extends StatefulWidget {
  /// Body的"类别" **标签筛选器**
  ///
  /// 在首页通过点击"类别"标签 ( **可多选** ) 可以快速筛选出想要的记事本
  ///
  /// 我是在使用安卓原版的文件管理器得到的灵感。在原版文件管理器的"最近"选项栏上可以快速选择像
  /// 图片啊、音频啊、视频啊、文档啊之类的单一类型文件，点一下就能筛选文件，还能多选，非常方便
  /// 我反正是爱了爱了。
  ///
  /// 作用哈，就是在记事本合集中添加一个快捷筛选的快捷标签，可以 **单选** 筛选适合的记事本，也可以
  /// **多选** 来筛选到更适合要求的记事本
  const CategoryChip({super.key, required this.importCategoryInfo});

  /// 从此导入`CategoryChip`的信息
  ///
  /// 需要按照以下格式排列成嵌套列表:
  /// ```dart
  /// [String(标签名称),
  ///   Icon(标签图片),
  ///   bool(标签是否激活)]
  /// ```
  ///
  /// 模板:
  /// ```dart
  /// CategoryChip(
  ///   importCategoryInfo: [
  ///     ['手写', FontAwesomeIcons.feather, false],
  ///     ['PDF', FontAwesomeIcons.filePdf, false],
  ///     ['刚看', FontAwesomeIcons.hourglass, false],
  ///     ...
  ///   ]
  /// )
  /// ```
  final List<List> importCategoryInfo;

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  List<List> importCategoryInfo = [];
  @override
  Widget build(BuildContext context) {
    // 看看importCategoryInfo是否空的
    if (importCategoryInfo.isEmpty) {
      importCategoryInfo = List.from(widget.importCategoryInfo);
    }
    // 生成一个ListView
    return ListView.builder(
        // 横向来布局这些标签
        scrollDirection: Axis.horizontal,
        // 新增个可以将各个chip顶起来的item，这样就能对称了
        itemCount: importCategoryInfo.length + 2,
        // 毕竟是放在首页的ListView里面，支持嵌套是必须的
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(padding: EdgeInsets.only(left: 10, right: 5));
          } else if (index == importCategoryInfo.length + 1) {
            return const Padding(padding: EdgeInsets.only(left: 5, right: 10));
          } else {
            // 标签名
            String categoryName = importCategoryInfo[index - 1][0];
            // 标签图标
            IconData categoryIcon = importCategoryInfo[index - 1][1];

            return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: FilterChip(
                  avatar: importCategoryInfo[index - 1][2]
                      ? null
                      : Icon(categoryIcon),
                  label: Text(categoryName),
                  tooltip: categoryName,
                  selected: importCategoryInfo[index - 1][2],
                  onSelected: (bool value) {
                    setState(() {
                      // 更改按下状态
                      importCategoryInfo[index - 1][2] = value;
                    });
                  },
                ));
          }
        });
  }
}
