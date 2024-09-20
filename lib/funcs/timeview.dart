/// 将时间戳转换为易于理解的时间标注
///
/// 输入`encodeTime` [DateTime]
/// - 若输入时间离现在不足1分钟，就显示 '刚刚'
/// - 若输入时间离现在不足1小时，就显示 ' `X` 分钟'
/// - 若输入时间离现在不足1天，就显示 ' `X` 小时'
/// - 若输入时间离现在不足1个月，就显示 ' `X` 天'
/// - 若输入时间离现在过了个把月，就显示 'MM/DD'
/// - 若输入时间离现在过了有些年，就显示 'YY/MM/DD'
/// TODO 时间计算有问题，会将12：59和13：01的间隔看作为一小时
String formatEasyreadTime(DateTime encodeTime) {
  DateTime nowTime = DateTime.now();
  if (encodeTime.year != nowTime.year) {
    return '${encodeTime.year}/${encodeTime.month}/${encodeTime.day}';
  } else if (encodeTime.month != nowTime.month) {
    return '${encodeTime.month}/${encodeTime.day}';
  } else if (encodeTime.day != nowTime.day) {
    return '${nowTime.day - encodeTime.day}天前';
  } else if (encodeTime.hour != nowTime.hour) {
    return '${nowTime.hour - encodeTime.hour}小时前';
  } else if (encodeTime.minute != nowTime.minute) {
    return '${nowTime.minute - encodeTime.minute}分钟前';
  } else {
    return '刚刚';
  }
}
