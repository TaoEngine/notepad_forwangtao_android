import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton.filledTonal(
              onPressed: () =>
                  Navigator.of(context).pop(), //返回至上一页，但是图标会随着上一页而更改
              icon: const Icon(Icons.book)), //TODO 可随上一页更改的图标
          centerTitle: false,
          title: const ListTile(
            title: Text('搜些什么'),
            subtitle: Text('在 大三上物流导论 中搜索...'),
          )),
      body: Container(),
    );
  }
}
