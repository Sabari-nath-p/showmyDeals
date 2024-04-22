import 'dart:ui';

abstract class AppConfig {
  static String apiVersion = "v2";
  static String endpoint = (false)
      ? "http://showmydealsdev.ap-1.evennode.com/api/$apiVersion/"
      : "http://www.showmydeals.cloud/api/$apiVersion/";
  //static String contactNumber = "7594092293";

  static Color PrimaryColor = Color(0xffD30E49);
}
