// lib/features/profile/profile_screen.dart

import 'package:flutter/material.dart';
import '../../core/theme/theme_notifier.dart';
import '../../shared/widgets/top_app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopAppBarWidget(title: 'My Profile'),
      body: _ProfileBody(),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeProvider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section dengan Background melengkung
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 150,
                margin: const EdgeInsets.only(bottom: 60),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: colorScheme.surface,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: colorScheme.primaryContainer,
                    backgroundImage: const AssetImage('assets/images/profile.png'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.edit, size: 20, color: colorScheme.onSecondary),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Informasi Nama & NIM
          Text(
            'Anny Klaudya Hutabarat',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '11S23019',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.secondary,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 32),

          // Menu Settings / Kontrol Tema
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _ProfileMenuTile(
                  icon: Icons.person_outline_rounded,
                  title: 'Tentang Saya',
                  subtitle: 'Informatics Student | UI/UX & Frontend Enthusiast',
                  onTap: () {},
                ),
                _ProfileMenuTile(
                  icon: themeNotifier.isDark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  title: 'Mode Aplikasi',
                  subtitle: themeNotifier.isDark ? 'Dark Mode Aktif' : 'Light Mode Aktif',
                  trailing: Switch(
                    value: themeNotifier.isDark,
                    onChanged: (value) => themeNotifier.toggle(),
                    activeColor: colorScheme.secondary,
                  ),
                  onTap: () => themeNotifier.toggle(),
                ),
                _ProfileMenuTile(
                  icon: Icons.info_outline_rounded,
                  title: 'Versi Aplikasi',
                  subtitle: 'v1.0.0 - Dessert Edition',
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const _ProfileMenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: colorScheme.primary),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: colorScheme.onSurfaceVariant),
        ),
        trailing: trailing ?? Icon(Icons.chevron_right_rounded, color: colorScheme.outline),
        onTap: onTap,
      ),
    );
  }
}