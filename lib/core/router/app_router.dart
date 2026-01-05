import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:inviter/features/welcome/views/welcome_view.dart';
import 'package:inviter/features/home/views/home_view.dart';
import 'package:inviter/features/profile/views/profile_view.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'welcome',
      builder: (context, state) => const WelcomeView(),
    ),
    GoRoute(
        path: '/invitations',
        name: 'invitations',
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Invitations'),
            ),
            body: const Center(
              child: Text('Invitations Page - To be implemented'),
            ),
          );
        }),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/profile/:id',
      name: 'profile',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return ProfileView(userId: id);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: {state.error}'),
    ),
  ),
);
