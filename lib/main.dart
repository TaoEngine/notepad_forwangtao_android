import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:notepad_forwangtao_android/pages/mainpage.dart';
import 'package:notepad_forwangtao_android/funcs/database.dart';

/// 这里是APP的启动入口
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 我在这里设置了如何将小白条隐藏的方法
  // 小白条虽说默认是透明的，但是小白条的图层是在APP之上，要想实现沉浸式小白条，需要在APP
  // 绘制前就声明APP的图层是在顶部的
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // 等待数据库加载完成
  // 不过isar数据库快的惊人，所以这一步会很快
  await NotepadsDB().initialize();

  // 万物起记！汪涛的记事本，启动！
  runApp(const MainApp());
}
