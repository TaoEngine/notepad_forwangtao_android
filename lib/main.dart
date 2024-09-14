import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/routes.dart';
import 'package:notepad_forwangtao_android/funcs/database.dart';

/// 万物起记！汪涛的记事本，启动！
///
/// 这里是APP的启动入口
void main() async {
  /// 我在这里设置了如何将小白条隐藏的方法
  ///
  /// 小白条虽说默认是透明的，但是小白条的图层是在APP之上，要想实现沉浸式小白条，需要在APP
  /// 绘制前就声明APP的图层是在顶部的
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await NotepadsDB().initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      //GetX
      return GetMaterialApp(
        title: '默认记事本',

        theme: ThemeData(
          colorScheme: lightDynamic,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkDynamic,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,

        //路由表以及首页
        initialRoute: '/notepads',
        getPages: PageRoutes.pageRoutes,

        //多语言设置
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('zh', 'CN')],
      );
    });
  }
}
