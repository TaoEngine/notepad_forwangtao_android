import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const ListTile(
            title: Text('搜些什么'),
            subtitle: Text('在 大三上物流导论 中搜索...'),
          ),
          actions: [
            IconButton.filledTonal(
                onPressed: () => {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.local_offer))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Column(children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: '搜索记事本的一切'),
                  ),
                ),
                const Divider()
              ]),
              Expanded(
                  child: ListView(
                // scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.text_fields),
                    title: const Text('按文本搜索'),
                    subtitle: const Text('搜索含有相应文本的记事本'),
                    trailing: IconButton.filledTonal(
                        onPressed: () => {},
                        icon: const Icon(Icons.playlist_add)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.tag),
                    title: const Text('按标签搜索'),
                    subtitle: const Text('有哪些记事本被标记了同样的标签'),
                    trailing: IconButton.filledTonal(
                        onPressed: () => {},
                        icon: const Icon(Icons.playlist_add)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.timelapse),
                    title: const Text('按时间搜索'),
                    subtitle: const Text('如果你知道记事本是什么时候创建的话'),
                    trailing: IconButton.filledTonal(
                        onPressed: () => {},
                        icon: const Icon(Icons.playlist_add)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('按图片搜索'),
                    subtitle: const Text('看看哪张图片能让你回忆到某个记事本'),
                    trailing: IconButton.filledTonal(
                        onPressed: () => {},
                        icon: const Icon(Icons.playlist_add)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.book),
                    title: const Text('按类型搜索'),
                    subtitle: const Text('要找纯手写备忘录还是附加了Markdown、PDF的手写备忘录'),
                    trailing: IconButton.filledTonal(
                        onPressed: () => {},
                        icon: const Icon(Icons.playlist_add)),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
