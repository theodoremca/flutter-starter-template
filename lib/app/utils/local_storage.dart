import 'package:hive_flutter/hive_flutter.dart';

const String kUserBox = 'userBox';
const String isFirst = 'isFirsterterrtt';
const String filledProfileKey = 'use-pinhffhf';

class AppCache {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);

  static void haveFirstView() {
    _userBox.put(isFirst, false);
  }

  static bool getIsFirst() {
    final bool data = _userBox.get(isFirst, defaultValue: true);
    return data;
  }

  static void setFilledProfile(bool key) {
    _userBox.put(filledProfileKey, key);
  }

  static bool getFilledProfile() {
    final bool data = _userBox.get(filledProfileKey, defaultValue: false);
    return data;
  }

  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}
