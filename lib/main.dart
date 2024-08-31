import 'pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// 万物起记！汪涛的记事本，启动！
///
/// 这里是APP的启动入口
///
/// Notes: 我在这里设置了如何将小白条隐藏的方法\
/// 小白条虽说默认是透明的，但是小白条的图层是在APP之上，要想实现沉浸式小白条，需要在APP绘制前就声明APP的图层是在顶部的(1)
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); //(1)
  runApp(const MainApp());
}

/// 整个记事本APP的框架及启动页面就在这里了
///
/// Notes:
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        title: '大三上物流导论',

        //深色和浅色模式 TODO 颜色没实现手动切换
        theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true),
        darkTheme: ThemeData(colorScheme: darkColorScheme, useMaterial3: true),

        //路由表以及首页
        initialRoute: '/notebook',
        onGenerateRoute: pageRouter,

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
