

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkMode extends StateNotifier<bool> {
  DarkMode() : super(DateTime.now().hour>17);
}


final darkModeProvider = StateNotifierProvider<DarkMode, bool>((ref) {
  return DarkMode();
});
