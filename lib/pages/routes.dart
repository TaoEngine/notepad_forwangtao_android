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

import 'package:flutter/material.dart';

// 主界面的跳转逻辑
import './main_page/home.dart';
import 'main_page/notepads.dart';
import './main_page/notify.dart';
import './main_page/search.dart';

// 记事本界面的跳转逻辑
import './note_page/handwriting_note.dart';
import './note_page/markdown_note.dart';
import './note_page/pdf_note.dart';

// 设置界面的跳转逻辑
//import './setting_page/themes.dart';

final Map<String, Function> pageRoutes = {
  '/notehome': (context) => const HomePage(), //主页
  '/notepads': (context) => const NotepadsPage(), //记事本预览
  '/search': (context) => const SearchPage(), //搜索
  '/notify': (context) => const NotifyPage(), //通知

  '/notepads/handwriting': (context) => const HandwritingModePage(), //手写记事本
  '/notepads/markdown': (context) => const MarkdownModePage(), //markdown记事本
  '/notepads/pdf': (context) => const PDFModePage(), //pdf备注记事本
};

/// 路由表逻辑，支持传参
///
/// 是这样的，直接引入到main就好了
var pageRouter = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = pageRoutes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      //含参数的路由方式
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      //不含参数的路由方式
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
