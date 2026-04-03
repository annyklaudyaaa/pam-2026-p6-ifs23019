// lib/core/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_screen.dart';
import '../../features/desserts/desserts_detail_screen.dart'; // Sesuaikan import
import '../../features/desserts/desserts_screen.dart';        // Sesuaikan import
import '../../features/plants/desserts_detail_screen.dart';
import '../../features/plants/desserts_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../constants/route_constants.dart';
import '../../shared/widgets/bottom_nav_widget.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.home,
  routes: [
    // Shell Route digunakan agar bottom navigation bar
    // tidak di-rebuild setiap berpindah halaman
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(
          path: RouteConstants.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: RouteConstants.desserts, // Menggunakan konstanta desserts
          builder: (context, state) => const DessertsScreen(),
        ),
        GoRoute(
          path: RouteConstants.dessertDetail, // Menggunakan konstanta dessertDetail
          builder: (context, state) {
            // Mengambil parameter 'name' dari URL
            final dessertName = state.pathParameters['name'] ?? '';
            return DessertsDetailScreen(dessertName: dessertName);
          },
        ),
        GoRoute(
          path: RouteConstants.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);

/// Shell widget yang membungkus semua halaman
/// dan menampilkan bottom navigation bar
class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavWidget(child: child),
    );
  }
}