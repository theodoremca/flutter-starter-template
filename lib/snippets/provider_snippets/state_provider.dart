import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // 1. watch the counterStateProvider
    final counter = ref.watch(counterStateProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // access the provider via ref.read(), then increment its state.
        onPressed: () => ref.read(counterStateProvider.state).state++,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          // 2. use the counter value
          'Value: $counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}



class MyHomePage1 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // 1. watch the counterStateProvider
    ref.listen<StateController<int>>(counterStateProvider.notifier, (previous, current) {
      // note: this callback executes when the provider value changes,
      // not when the build method is called
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Value is ${current.state}')),
      );
    });
    final counter = ref.watch(counterStateProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // access the provider via ref.read(), then increment its state.
        onPressed: () => ref.read(counterStateProvider.state).state++,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          // 2. use the counter value
          'Value: $counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
