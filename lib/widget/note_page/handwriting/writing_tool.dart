part of '../handwriting.dart';

class WritingToolBar extends StatelessWidget {
  const WritingToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            SizedBox(
                height: 390,
                width: 90,
                child: Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 10),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const FaIcon(FontAwesomeIcons.pencil)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const FaIcon(FontAwesomeIcons.highlighter)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const FaIcon(FontAwesomeIcons.eraser)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const FaIcon(FontAwesomeIcons.objectGroup)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: IconButton(
                            onPressed: () => {},
                            icon: const FaIcon(FontAwesomeIcons.ruler)),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              width: 4,
            ),
            Container(
              height: 250,
              width: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.outline,
              ),
            )
          ],
        ));
  }
}
