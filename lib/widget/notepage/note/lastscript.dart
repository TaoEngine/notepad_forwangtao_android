part of '../note.dart';

class LoadLastscript extends StatelessWidget {
  const LoadLastscript({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取组件宽度和高度
    double driverWidth = MediaQuery.sizeOf(context).width;
    double driverHeight = MediaQuery.sizeOf(context).height;

    return CustomPaint(
      size: Size(
        driverWidth,
        driverHeight,
      ),
    );
  }
}
