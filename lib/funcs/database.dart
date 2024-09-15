import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:notepad_forwangtao_android/static/datamodel.dart';

/// 将记事本数据库作为单例看待
class NotepadsDB {
  static final NotepadsDB _instance = NotepadsDB._internal();
  late Isar _db;

  factory NotepadsDB() {
    return _instance;
  }

  NotepadsDB._internal() {
    initialize();
  }

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _db = await Isar.open(
      [NotepadsSchema, NotepadsChildSchema, NotepadFileSchema],
      directory: dir.path,
      inspector: true,
    );
  }

  Isar get getdb => _db;
}

/// 创建记事本合集
Future<int> addNewNotepads(String notepadsName) async {
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final notepadsModel = Notepads()
    ..notepadsID = timestamp
    ..notepadsName = notepadsName
    ..notepadsCreateTime = DateTime.now()
    ..notepadsViewTime = DateTime.now();

  await NotepadsDB().getdb.writeTxn(() async {
    NotepadsDB().getdb.notepads.put(notepadsModel);
  });
  return timestamp;
}

/// 创建记事本合集的子目录
Future<int> addNewNotepadsChild(
    int notepadsID, int notepadsParentID, String notepadsChildName) async {
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final notepadsChildModel = NotepadsChild()
    ..notepadsChildID = timestamp
    ..notepadsParentID = notepadsParentID
    ..notepadsID = notepadsID
    ..notepadsChildName = notepadsChildName
    ..notepadsCreateTime = DateTime.now()
    ..notepadsViewTime = DateTime.now();

  await NotepadsDB().getdb.writeTxn(() async {
    NotepadsDB().getdb.notepadsChilds.put(notepadsChildModel);
  });
  return timestamp;
}

/// 创建记事本
Future<int> addNewNotepad(
    int notepadsID, String notepadName, bool notepadType) async {
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final notepadFileModel = NotepadFile()
    ..notepadID = timestamp
    ..notepadsID = notepadsID
    ..notepadName = notepadName
    ..notepadType = notepadType
    ..notepadEditTime = DateTime.now()
    ..notepadViewTime = DateTime.now();

  await NotepadsDB().getdb.writeTxn(() async {
    NotepadsDB().getdb.notepadFiles.put(notepadFileModel);
  });
  return timestamp;
}
