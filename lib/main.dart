import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/routes.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  //一波代码初始化
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    //设置导航小白条透明
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  //我的代码在你之上！
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //汪涛的记事本，启动！
  runApp(const MainApp());
}

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
      );
    });
  }
}
