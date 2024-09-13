part of '../note.dart';

class HandwritingBottomBar extends StatelessWidget {
  const HandwritingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.keyboard),
            tooltip: '打字',
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.draw),
            tooltip: '手写',
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add_photo_alternate),
            tooltip: '插图',
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.undo),
            tooltip: '撤销',
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.redo),
            tooltip: '重做',
          ),
        ],
      ),
    );
  }
}
