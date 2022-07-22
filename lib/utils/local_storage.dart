import 'package:hive_flutter/hive_flutter.dart';

const String kUserBox = 'userBox';
const String isFirst = 'isFirstTime';

class AppCache {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);

  static void setFirstTime() {
    _userBox.put(isFirst, false);
  }

  static bool getIsFirstTime() {
    final bool data = _userBox.get(isFirst, defaultValue: true);
    return data;
  }

  static void setToken() {
    _userBox.put(isFirst, false);
  }

  static bool getToken() {
    final bool data = _userBox.get(isFirst, defaultValue: true);
    return data;
  }


  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}
