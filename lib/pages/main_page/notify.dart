import 'package:flutter/material.dart';

class NotifyPage extends StatelessWidget {
  const NotifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('收到了吗'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('收到！'),
        icon: const Icon(Icons.done_all),
        onPressed: () => {},
      ),
    );
  }
}
