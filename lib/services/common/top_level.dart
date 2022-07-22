
import 'package:flutter_riverpod/flutter_riverpod.dart';

  abstract class BusyA extends StateNotifier<bool> {
  BusyA(bool state) : super(state);
  set setBusy(bool feed) {
    if(feed != state) state = feed;
  }
   @override
  void dispose() {
    state = false;
    super.dispose();
  }
}