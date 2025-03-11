import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../domain/models/news_model.dart';
import '../presentation/screens/home_page/home_page.dart';
import '../presentation/screens/splash_screen/splash_screen.dart';
import '../presentation/screens/news_detail/news_detail_page.dart';

final mainRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation.drive(
              Tween(begin: 0.0, end: 1.0).chain(
                CurveTween(curve: Curves.easeInOut),
              ),
            ),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
              Tween(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: '/news_detail',
      name: 'news_detail',
      pageBuilder: (context, state, ) {
        final news = state.extra as NewsModel;
        return CustomTransitionPage(
          key: state.pageKey,
          child: NewsDetailPage(news: news),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      },
    ),
  ],
);
