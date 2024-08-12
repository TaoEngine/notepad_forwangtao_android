/// "汪涛的记事本"应用的所有路由跳转工具
///
/// 跳转逻辑已经写在这里了，需要在main中引入这个路由逻辑以生效所有页面
///
/// 路由表如下：
/// - 主页面
///   - 真·主页
///   - 笔记本主页
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
import './main_page/notebook.dart';
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
  '/notebook': (context) => const NotebookPage(), //记事本预览
  '/search': (context) => const SearchPage(), //搜索
  '/notify': (context) => const NotifyPage(), //通知

  '/note/handwriting': (context) => const HandwritingModePage(), //手写记事本
  '/note/markdown': (context) => const MarkdownModePage(), //markdown记事本
  '/note/pdf': (context) => const PDFModePage(), //pdf备注记事本
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
