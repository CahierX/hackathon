/// @author: gongchen
/// @date: 2021/10/20 10:28
/// @description：正则验证工具
class RegExpUtil {
  // static RegExpUtil instance = RegExpUtil._internal();
  // factory RegExpUtil() => instance;
  // RegExpUtil._internal();
  static bool isIp(String ip) {
    RegExp exp = RegExp(
        r"((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}");
    return exp.hasMatch(ip);
  }
}
