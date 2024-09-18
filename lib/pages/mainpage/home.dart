import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad_forwangtao_android/widget/shared/appbar.dart';

class HomePage extends StatelessWidget {
  /// 记事本的集合页面
  ///
  /// 所有记事本都放在这里了
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarModel(
        appbarTitle: '汪涛的记事本',
        appbarMode: '首页',
        appbarLeftButton: true,
        iconLeftButton: Icons.settings,
        describeLeftButton: '设置(正在做，敬请期待)',
      ),
    );
  }
}
