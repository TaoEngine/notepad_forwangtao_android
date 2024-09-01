part of '../notepads.dart';

class CategoryChip extends StatelessWidget {
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
  /// 模板:
  /// ```dart
  /// CategoryChip(
  ///   importCategoryInfo: {
  ///     '刚看': Icon(Icons.history),
  ///     '手写': Icon(Icons.draw),
  ///     '考点': Icon(Icons.tag),
  ///     '物流的作用': Icon(Icons.tag),
  ///     '测试测试': Icon(Icons.tag),
  ///   }
  /// )
  /// ```
  final Map<String, Icon> importCategoryInfo;

  @override
  Widget build(BuildContext context) {
    List<String> categoryName = [];
    List<Icon> categoryIcon = [];
    // 加载类别的标签和图标
    importCategoryInfo.forEach((key, value) {
      categoryName.add(key);
      categoryIcon.add(value);
    });
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
            return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: CategoryChipUnit(
                    categoryName: categoryName[index - 1],
                    categoryIcon: categoryIcon[index - 1]));
          }
        });
  }
}

class CategoryChipUnit extends StatefulWidget {
  /// 标签筛选器的单个标签配置
  ///
  /// 使用的是能够多选的 `FilterChip` ，打上勾就是有辨识度
  ///
  /// 不单用，仅为 `CategoryChip` 设计，需要标签名 `categoryName` 和图标 `categoryIcon`
  const CategoryChipUnit(
      {super.key, required this.categoryName, required this.categoryIcon});

  /// 标签名
  final String categoryName;

  /// 标签图标
  final Icon categoryIcon;

  @override
  State<CategoryChipUnit> createState() => _CategoryChipUnitState();
}

class _CategoryChipUnitState extends State<CategoryChipUnit> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: widget.categoryIcon,
      label: Text(widget.categoryName),
      onSelected: (bool value) {},
    );
  }
}
