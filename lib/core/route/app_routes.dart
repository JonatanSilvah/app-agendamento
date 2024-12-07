import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Container(
        color: Colors.yellow,
      ),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => Container(
        color: Colors.green,
      ),
    ),
  ],
);
