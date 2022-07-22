import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) => throw UnimplementedError());

class SharedPreferencesService {
  SharedPreferencesService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const tokenKey = 'token';
  static const id = 'id';

  Future<void> setToken(String token) async {
    await sharedPreferences.setString(tokenKey, token);
    log(token);
    log(getToken());
  }

  String getToken() => sharedPreferences.getString(tokenKey) ?? "";

  Future<void> setId(String tokon) async {
    await sharedPreferences.setString(id, tokon);
  }

  String getId() => sharedPreferences.getString(id) ?? "";
    static const onboardingCompleteKey = 'onboardingComplete';

  Future<void> setOnboardingComplete() async {
    await sharedPreferences.setBool(onboardingCompleteKey, true);
  }

  bool isOnboardingComplete() =>
      sharedPreferences.getBool(onboardingCompleteKey) ?? false;
}
