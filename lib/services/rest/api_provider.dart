import 'package:flutter_riverpod/flutter_riverpod.dart';
final StateProvider<bool> ApiStateProvider = StateProvider<bool>((ref) => false);
class ApiStateNotifier extends StateNotifier<bool>{
  ApiStateNotifier() : super(false);
  update ({bool? requesting}) => state = requesting != null ? requesting: !state;
}
final apiStateProvider = StateNotifierProvider<ApiStateNotifier,bool> ((ref) => ApiStateNotifier());
