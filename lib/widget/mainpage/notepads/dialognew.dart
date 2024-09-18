// emmm以后会把你给删掉的！！！
part of '../notepads.dart';

notepadNewDialog(context) async {
  var notebookPreviewSetDialogWidget = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const NewDialogUnit());
  return notebookPreviewSetDialogWidget;
}

class NewDialogUnit extends StatefulWidget {
  const NewDialogUnit({super.key});

  @override
  State<NewDialogUnit> createState() => _NewDialogUnitState();
}

class _NewDialogUnitState extends State<NewDialogUnit> {
  String inputName = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(Icons.description),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            const Text('这只是临时的新建方案，以后会删掉'),
            const Text('以后会在记事本内部实现新建记事本的'),
            const Text('像苹果备忘录一样'),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '为记事本起个名字',
              ),
              onChanged: (value) {
                setState(() {
                  inputName = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("算了"),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          onPressed: inputName != ''
              ? () async {
                  int notepadID = await addNewNotepad(1, inputName, false);
                  Get.back();
                  Get.toNamed('/notepads/note', arguments: {
                    'notepadID': notepadID,
                  });
                }
              : null,
          child: const Text("开始记事情"),
        )
      ],
    );
  }
}
