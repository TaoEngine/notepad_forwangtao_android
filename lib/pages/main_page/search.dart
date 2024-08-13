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
          child: Stack(
            alignment: Alignment.center,
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
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [], //TODO这里放置搜索建议
              )
            ],
          ),
        ));
  }
}
