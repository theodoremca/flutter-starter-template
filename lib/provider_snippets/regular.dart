import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<int>((ref) {
  return 36;
});
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // 1. Add a Consumer
        child: Consumer(
          // 2. specify the builder and obtain a WidgetRef
          builder: (_, WidgetRef ref, __) {
            // 3. use ref.watch() to get the value of the provider
            final value = ref.watch(valueProvider);
            return Text(
              'Value: $value',
              style: Theme.of(context).textTheme.headline4,
            );
          },
        ),
      ),
    );
  }
}

// 1. Widget class now extends [ConsumerWidget]
class MyHomePage1 extends ConsumerWidget {
  @override
  // 2. build() method has an extra [WidgetRef] argument
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. use ref.watch() to get the value of the provider
    final value = ref.watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value: $value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}


class MyHomePage2 extends ConsumerStatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// 2. Extend [ConsumerState]
class _MyHomePageState extends ConsumerState<MyHomePage2> {
  @override
  void initState() {
    super.initState();
    // 3. use ref.read() in the widget life-cycle methods
    final value = ref.read(valueProvider);
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    // 3. use ref.watch() to get the value of the provider
    final value = ref.watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value: $value',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
