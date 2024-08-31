/// 记事本的数据库模板文件
///
/// 由于记事本文件到时候会比较大，我采用了Isar数据库来保证在每次读取记事本的时候速度会达到我的
/// 预期
///
///
///
/// 根据Isar数据库文档所述，在每次修改数据库模板文件时，需要执行
/// ```shell
/// flutter pub run build_runner build
/// ```
/// 才能生成新一版的数据库模板文件供下一次使用
library notepad_data;

import 'package:isar/isar.dart';
part 'notepad_data.g.dart';

@collection

/// 记事本数据库
/// 
/// 一本能被这个APP正常使用的记事本 [Notepad] 到底需要具备哪些要素呢？
/// - [notepadType] 
class Notepad {
  Id id = Isar.autoIncrement;

  /// `notepadType`: 记事本类型
  int? notepadType;

  /// `notepadName`: 记事本名字
  String? notepadName;

  /// `notepadData`: 记事本里的笔记
  NotepadData? notepadData;

  /// `LastViewTime`: 上次查看信息
  DateTime? lastViewTime;

  /// `LastEditTime`: 上次修改信息
  DateTime? lastEditTime;
}

@embedded
class NotepadData {}
