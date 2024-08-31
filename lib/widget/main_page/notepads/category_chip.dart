part of '../notepads.dart';

class CategoryChip extends StatelessWidget {
  /// Body的"类别"标签
  ///
  /// 在首页通过点击"类别"标签可以快速筛选出想要的记事本，
  /// 需要传入的内容有：
  /// - `CategoryIcon`(`Icon`): 表示"类别"的图标
  /// - `CategoryText`(`String`): 描述"类别"的文字
  const CategoryChip({super.key, required this.importCategoryInfo});

  /// 从此导入`CategoryChip`的信息 [Map]
  ///
  /// 模板:
  /// ```dart
  /// CategoryChip(
  ///   importCategoryInfo = {
  ///     '刚看': Icon(Icons.history),
  ///     '手写': Icon(Icons.draw),
  ///     '考点': Icon(Icons.tag),
  ///     '物流的作用': Icon(Icons.tag),
  ///     '测试测试': Icon(Icons.tag),
  ///   }
  /// )
  /// ```
  final Map importCategoryInfo;

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.tag);
  }
}
