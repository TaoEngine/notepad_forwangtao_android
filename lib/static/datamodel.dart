import 'package:isar/isar.dart';
part 'datamodel.g.dart';

@collection

/// 记事本合集的根目录
class Notepads {
  /// 记事本合集的唯一标识符
  Id? notepadsID;

  /// 记事本合集的名称
  String? notepadsName;

  /// 记事本合集的创建时间
  DateTime? notepadsCreateTime;

  /// 记事本合集的上次查看时间
  DateTime? notepadsViewTime;
}

@collection

/// 记事本合集的子目录
class NotepadsChild {
  /// 记事本合集子目录的唯一标识符
  Id? notepadsChildID;

  /// 记事本合集子目录的上一级的ID,为空就是在根目录之下
  int? notepadsParentID;

  /// 记事本合集子目录所在根目录
  int? notepadsID;

  /// 记事本合集子目录的名称
  String? notepadsChildName;

  /// 记事本合集子目录的创建时间
  DateTime? notepadsCreateTime;

  /// 记事本合集子目录的上次查看时间
  DateTime? notepadsViewTime;
}

@collection

/// 记事本文件
class NotepadFile {
  /// 记事本合集的唯一标识符
  Id? notepadID;

  /// 记事本合集子目录的上一级的ID,为空就是在根目录之下
  int? notepadsParentID;

  /// 记事本合集子目录所在根目录
  int? notepadsID;

  /// 记事本的类型
  /// false是不含附件(如pdf,word,网页)的纯记事本
  bool? notepadType;

  /// 记事本的名称
  String? notepadName;

  /// 记事本的修改时间
  DateTime? notepadEditTime;

  /// 记事本的上次查看时间
  DateTime? notepadViewTime;

  /// 记事本的内容
  String? notepadData;
}
