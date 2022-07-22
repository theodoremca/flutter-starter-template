
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) {
  return Future.value(36);
});

final streamProvider = StreamProvider<int>((ref) {
  return Stream.fromIterable([36, 72]);
});

final streamProviderDispose = StreamProvider.autoDispose<int>((ref) {
  return Stream.fromIterable([36, 72]);
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamAsyncValue = ref.watch(streamProvider);
    // final futureAsyncValue = ref.watch(futureProvider); // same syntax
    return Scaffold(
      body: Center(
        child: streamAsyncValue.when(
          data: (data) => Text('Value: $data'),
          loading: () => CircularProgressIndicator(),
          error: (e, st) => Text('Error: $e'),
        ),
      ),
    );
  }
}

final myProvider = FutureProvider.autoDispose((ref) async {
    final Dio dio = Dio();
  // An object from package:dio that allows cancelling http requests
  final cancelToken = CancelToken();
  // When the provider is destroyed, cancel the http request
  ref.onDispose(() => cancelToken.cancel());

  // Fetch our data and pass our `cancelToken` for cancellation to work
  final response = await dio.get('path', cancelToken: cancelToken);
  // If the request completed successfully, keep the state
  ref.maintainState = true;

  return response;
});

final streamProviderFamily =
    StreamProvider.autoDispose.family<int, int>((ref, offset) {
  return Stream.fromIterable([36 + offset, 72 + offset]);
});

// Then, we can just pass the value we want to the provider inside ref.watch():

// final streamAsyncValue = ref.watch(streamProviderFamily(10));