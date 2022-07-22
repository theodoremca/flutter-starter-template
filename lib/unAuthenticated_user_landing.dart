import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsk/app/splash_screen.dart';

final screen = StateProvider<Widget>((ref) => const SplashScreen());

class UnAuthenticatedUserLanding extends ConsumerWidget {
  const UnAuthenticatedUserLanding({required this.page, Key? key})
      : super(key: key);
  final Widget page;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        ref.read(screen.notifier).state = page;
      });
    });
    return ref.watch(screen);
  }
}
