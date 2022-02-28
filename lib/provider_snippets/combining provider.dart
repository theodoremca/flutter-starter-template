

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
}); 

class OnboardingViewModel extends StateNotifier<bool> {
  OnboardingViewModel(this.sharedPreferences)
      : super(sharedPreferences.getBool('onboardingComplete') ?? false);
  final SharedPreferences sharedPreferences;

  // OnboardingViewModel methods here
}

final onboardingViewModelProvider =
    StateNotifierProvider<OnboardingViewModel,bool>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return OnboardingViewModel(sharedPreferences);
});
