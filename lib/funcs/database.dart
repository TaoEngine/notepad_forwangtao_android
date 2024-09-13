import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:notepad_forwangtao_android/static/notepad_data.dart';

// class Database {
//   static final Database _instance = Database._internal();
//   late Isar _isar;

//   factory Database() {
//     return _instance;
//   }

//   Database._internal() {
//     _initializeIsar();
//   }

//   Future<void> _initializeIsar(schema) async {
//     final dir = await getApplicationDocumentsDirectory();
//     _isar = await Isar.open(
//       [schema],
//       directory: dir.path,
//       inspector: true,
//     );
//   }

//   Isar get isar => _isar;
// }

/// 创建记事本合集
Future<int> addNewNotepads(String notepadsName) async {
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final notepadsModel = Notepads()
    ..notepadsID = timestamp
    ..notepadsName = notepadsName
    ..notepadsCreateTime = DateTime.now()
    ..notepadsViewTime = DateTime.now();

  _add(notepadsModel, NotepadsSchema);
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

  _add(notepadsChildModel, NotepadsChildSchema);
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

  _add(notepadFileModel, NotepadFileSchema);
  return timestamp;
}

/// 查询状态
checkNotepad(int notepadID) {
  var notepad = _check(notepadID, NotepadFileSchema);
  return notepad;
}

_add(dynamic model, CollectionSchema schema) async {
  final dir = await getApplicationDocumentsDirectory();
  final database = await Isar.open(
    [schema],
    directory: dir.path,
    inspector: true,
  );

  await database.writeTxn(() async {
    if (schema == NotepadsSchema) {
      await database.notepads.put(model);
    } else if (schema == NotepadsChildSchema) {
      await database.notepadsChilds.put(model);
    } else if (schema == NotepadFileSchema) {
      await database.notepadFiles.put(model);
    }
  });

  await database.close();
}

_check(int id, CollectionSchema schema) async {
  final dir = await getApplicationDocumentsDirectory();
  final database = await Isar.open(
    [schema],
    directory: dir.path,
    inspector: true,
  );
  final Object? databaseRequest;

  if (schema == NotepadsSchema) {
    databaseRequest = await database.notepads.get(id);
  } else if (schema == NotepadsChildSchema) {
    databaseRequest = await database.notepadsChilds.get(id);
  } else if (schema == NotepadFileSchema) {
    databaseRequest = await database.notepadFiles.get(id);
  } else {
    databaseRequest = null;
  }

  await database.close();
  return databaseRequest;
}
