

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/app/private_view.dart';
import 'package:template/app/private_view_1.dart';
import 'package:template/app/public_view.dart';
import 'package:template/app/splash_screen.dart';


import 'app/onboarding.dart';
import 'authenticated_user_landing.dart';
import 'services/common/firebase_auth_service.dart';
import 'unAuthenticated_user_landing.dart';
import 'utils/local_storage.dart';

String initRoute = '/';

GoRouter router(WidgetRef ref) {
  final refreshListenable = GoRouterRefreshStream(
    FirebaseAuthService().authStateChanges(),
  );
  return GoRouter(
    redirect: (GoRouterState state) {
      final bool isAuthenticating = state.location.contains("auth");
      final bool isAuthenticated = FirebaseAuthService().currentUser != null;
      if (!isAuthenticated && !isAuthenticating) return "/auth/number";
      if (isAuthenticated && isAuthenticating) return "/";
      if (state.location != initRoute) initRoute = state.location;
      return null;
    },
    refreshListenable: refreshListenable,
    initialLocation: initRoute,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        redirect: (_) => '/home',
      ),
      GoRoute(
          path: '/home',
          name: 'Home',
          builder: (context, state) => const MiddlewareWrapper(PrivateView())),
      GoRoute(
          path: '/profile',
          name: 'Profile',
          builder: (context, state) => const MiddlewareWrapper(PrivateView2())),
      GoRoute(
          path: '/authr',
          name: 'Auth',
          builder: (context, state) => UnAuthenticatedUserLanding(
              page: AppCache.getIsFirstTime()
                  ? const OnBoarding()
                  : PublicView())),
      GoRoute(
          path: '/intro',
          name: 'intro',
          builder: (context, state) => const SplashScreen()),
    ],
  );
}
