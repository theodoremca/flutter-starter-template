// 1. Declare a ScopedProvider
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentProductIndex = Provider<int>((_) => throw UnimplementedError());

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      // 2. Add a parent ProviderScope
      return ProviderScope(
        overrides: [
          // 3. Add a dependency override on the index
          currentProductIndex.overrideWithValue(index),
        ],
        // 4. return a **const** ProductItem with no constructor arguments
        child: const ProductItem(),
      );
    });
  }
}

class ProductItem extends ConsumerWidget {
  const ProductItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 5. Access the index via WidgetRef
    final index = ref.watch(currentProductIndex);
    // do something with the index
    return Text('$index');
  }
}
