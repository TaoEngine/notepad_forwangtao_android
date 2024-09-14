part of '../note.dart';

class HandwritingBottomBar extends StatelessWidget {
  final VoidCallback? pressTypingButton;
  final VoidCallback? pressHandWritingButton;
  final VoidCallback? pressInsertPhotoButton;
  final VoidCallback? pressUndoButton;
  final VoidCallback? pressRedoButton;
  const HandwritingBottomBar(
      {super.key,
      required this.pressTypingButton,
      required this.pressHandWritingButton,
      required this.pressInsertPhotoButton,
      required this.pressUndoButton,
      required this.pressRedoButton});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
              onPressed: pressTypingButton,
              icon: const Icon(Icons.keyboard),
              tooltip: '打字'),
          IconButton(
              onPressed: pressHandWritingButton,
              icon: const Icon(Icons.draw),
              tooltip: '手写'),
          IconButton(
              onPressed: pressInsertPhotoButton,
              icon: const Icon(Icons.add_photo_alternate),
              tooltip: '插图'),
          IconButton(
              onPressed: pressUndoButton,
              icon: const Icon(Icons.undo),
              tooltip: '撤销'),
          IconButton(
              onPressed: pressRedoButton,
              icon: const Icon(Icons.redo),
              tooltip: '重做'),
        ],
      ),
    );
  }
}
