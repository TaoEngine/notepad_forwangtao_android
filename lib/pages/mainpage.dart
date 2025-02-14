import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:notepad_forwangtao_android/pages/routes.dart';
import 'package:notepad_forwangtao_android/pages/notepads/home.dart';
import 'package:notepad_forwangtao_android/pages/notepads/notepads.dart';

part './padview.dart';

class MainApp extends StatelessWidget {
  ///
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

        // //路由表以及首页
        // initialRoute: '/notepads',
        getPages: PageRoutes.pageRoutes,

        // 判断运行的是手机还是平板，横屏还是竖屏
        home: MediaQuery.of(context).size.width >
                    MediaQuery.of(context).size.height &&
                MediaQuery.of(context).size.width > 800
            // 平板双窗格布局
            ? const Padview()
            // 手机单页布局
            : const NotepadsPage(),

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
