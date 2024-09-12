/// "汪涛的记事本"应用的所有路由跳转工具
///
/// 跳转逻辑已经写在这里了，需要在main中引入这个路由逻辑以生效所有页面
///
/// 路由表如下：
/// - 主页面
///   - 之前打开过的笔记本的首页（应用打开就跳转到这里）
///     - 如果在上一次打开了在应用启动的时候，
///   - 记事本主页
///     - 从主页面点击右上角的“记事本主页按钮”，就能到达“记事本主页”。在这里可以查看所有记事 \
///       本的归类
///   - 通知界面
///   - 搜索界面
/// - 记事本页面
///   - 编辑手写笔记
///   - 编辑markdown笔记
///   - 编辑pdf笔记
/// - 设置界面
///   - 设置外观
///   - 应用解耦
library routes;

import 'package:get/get.dart';

// 功能页面的跳转逻辑
import './main_page/home.dart';
import 'main_page/notepads.dart';
import './main_page/notify.dart';
import './main_page/search.dart';

// 记事本界面的跳转逻辑
import 'note_page/handwriting.dart';
import 'note_page/pdf.dart';

class PageRoutes {
  static final pageRoutes = [
    // 功能页面
    GetPage(
      name: '/notehome',
      page: () => const HomePage(),
    ),
    GetPage(name: '/notepads', page: () => const NotepadsPage()),
    GetPage(name: '/search', page: () => const SearchPage()),
    GetPage(name: '/notify', page: () => const NotifyPage()),

    // 记事本页面
    GetPage(
        name: '/notepads/handwriting', page: () => const HandwritingModePage()),
    GetPage(name: '/notepads/pdf', page: () => const PDFModePage()),

    //设置页面
  ];
}
