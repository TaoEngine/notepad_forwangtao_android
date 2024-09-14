part of '../note.dart';

Card _toolbarCard(bool onHorizontalVertical) {
  List<List> cardTools = [
    ['笔', const FaIcon(FontAwesomeIcons.pencil)],
    ['荧光笔', const FaIcon(FontAwesomeIcons.highlighter)],
    ['橡皮擦', const FaIcon(FontAwesomeIcons.eraser)],
    ['选择', const FaIcon(FontAwesomeIcons.objectGroup)],
    ['尺子', const FaIcon(FontAwesomeIcons.ruler)]
  ];

  List<Widget> cardWidgets = [];

  for (var element in cardTools) {
    if (cardTools.indexOf(element) == 0) {
      if (onHorizontalVertical) {
        cardWidgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: IconButton(
                tooltip: element[0], onPressed: () => {}, icon: element[1]),
          ),
        );
      } else {
        cardWidgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: IconButton(
                tooltip: element[0], onPressed: () => {}, icon: element[1]),
          ),
        );
      }
    } else if (cardTools.indexOf(element) == cardTools.length - 1) {
      if (onHorizontalVertical) {
        cardWidgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: IconButton(
                tooltip: element[0], onPressed: () => {}, icon: element[1]),
          ),
        );
      } else {
        cardWidgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 20),
            child: IconButton(
                tooltip: element[0], onPressed: () => {}, icon: element[1]),
          ),
        );
      }
    } else {
      if (onHorizontalVertical) {
        cardWidgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: IconButton(
                tooltip: element[0], onPressed: () => {}, icon: element[1]),
          ),
        );
      } else {
        cardWidgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: IconButton(
                tooltip: element[0], onPressed: () => {}, icon: element[1]),
          ),
        );
      }
    }
  }

  if (onHorizontalVertical) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: cardWidgets,
      ),
    );
  } else {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: cardWidgets,
      ),
    );
  }
}

class HandwritingToolBar extends StatelessWidget {
  /// 组件朝向
  final Alignment toolbarAlignment;

  /// 记事本的书写组件
  ///
  ///
  const HandwritingToolBar({super.key, required this.toolbarAlignment});

  @override
  Widget build(BuildContext context) {
    switch (toolbarAlignment) {
      case Alignment.centerLeft:
        return Align(
          alignment: toolbarAlignment,
          child: _onLeftAlign(context),
        );
      case Alignment.centerRight:
        return Align(
          alignment: toolbarAlignment,
          child: _onRightAlign(context),
        );
      case Alignment.topCenter:
        return Align(
          alignment: toolbarAlignment,
          child: _onTopAlign(context),
        );
      case Alignment.bottomCenter:
        return Align(
          alignment: toolbarAlignment,
          child: _onBottomAlign(context),
        );
    }
    return Align(
      alignment: toolbarAlignment,
      child: _onBottomAlign(context),
    );
  }
}

Row _onLeftAlign(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 330, width: 70, child: _toolbarCard(true)),
      const SizedBox(width: 2),
      Container(
        height: 100,
        width: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.outline,
        ),
      )
    ],
  );
}

Row _onRightAlign(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 100,
        width: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      const SizedBox(width: 2),
      SizedBox(height: 330, width: 70, child: _toolbarCard(true)),
    ],
  );
}

Column _onTopAlign(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 70, width: 330, child: _toolbarCard(false)),
      const SizedBox(width: 2),
      Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
    ],
  );
}

Column _onBottomAlign(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      const SizedBox(width: 2),
      SizedBox(height: 70, width: 330, child: _toolbarCard(false))
    ],
  );
}
