import 'dart:developer';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsk/app/private_view_1.dart';
import 'package:fsk/app/splash_screen.dart';
import 'package:fsk/locator.dart';
import 'package:fsk/services/common/firebase_auth_service.dart';
import 'package:fsk/services/common/firestore_database.dart';
import 'package:fsk/services/common/firestore_path.dart';
import 'package:fsk/utils/async_value_widget.dart';

import 'app/models/user.dart';

final appUserStreamProvider = StreamProvider<User?>((ref) {
  final uid = locator.get<FirebaseAuthService>().currentUser!.uid;
  return locator.get<FirestoreDatabase<User>>().docStream(
      modelFromData: (data, documentId) => User.fromMap(data, documentId),
      pathToDocument: FirestorePath.user(uid));
});

class MiddlewareWrapper extends ConsumerWidget {
  const MiddlewareWrapper(this.page, {Key? key}) : super(key: key);
  final Widget page;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.watch(appUserStreamProvider);
    return CustomAsyncValue<User?>(
      streamAsyncValue: appUser,
      onError: (res) {
        return const SplashScreen();
      },
      data: (data) {
        FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
        dynamicLinks.onLink.listen((dynamicLinkData) {
          log(" dynamic");
          log(dynamicLinkData.link.path);
          log(dynamicLinkData.link.query);
        }).onError((error) {
          log(" dynamic error");
        });

        if (data?.name == null || data!.name!.isEmpty) {
          return const PrivateView2();
        }
        return page;
      },
      loading: const SplashScreen(),
    );
  }
}
