// lib/features/desserts/desserts_detail_screen.dart

import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../data/models/dessert_model.dart'; // Pastikan import ke model dessert
import '../../shared/widgets/loading_widget.dart';
import '../../shared/widgets/top_app_bar_widget.dart';

class DessertsDetailScreen extends StatefulWidget {
  const DessertsDetailScreen({super.key, required this.dessertName});

  final String dessertName;

  @override
  State<DessertsDetailScreen> createState() => _DessertsDetailScreenState();
}

class _DessertsDetailScreenState extends State<DessertsDetailScreen> {
  DessertModel? _dessert;

  @override
  void initState() {
    super.initState();
    // Simulasi async data loading
    Future.microtask(() {
      final result = DummyData.getDessertsData()
          .where((p) => p.nama == widget.dessertName)
          .firstOrNull;

      if (mounted) {
        setState(() => _dessert = result);
        // Kembali jika data tidak ditemukan
        if (result == null) {
          Navigator.of(context).pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_dessert == null) {
      return Scaffold(
        appBar: TopAppBarWidget(
          title: widget.dessertName,
          showBackButton: true,
        ),
        body: const LoadingWidget(),
      );
    }

    return Scaffold(
      appBar: TopAppBarWidget(
        title: _dessert!.nama,
        showBackButton: true,
      ),
      body: _DessertsDetailBody(dessert: _dessert!),
    );
  }
}

class _DessertsDetailBody extends StatelessWidget {
  const _DessertsDetailBody({required this.dessert});

  final DessertModel dessert;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section: Gambar dengan Background melengkung
          Stack(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withOpacity(0.3),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(32),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Hero(
                    tag: dessert.nama,
                    child: Image.asset(
                      dessert.gambar,
                      height: 250,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.cake_rounded,
                        size: 120,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Dessert
                Center(
                  child: Text(
                    dessert.nama,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),

                // Section Deskripsi
                _InfoCard(
                  title: 'Tentang Menu Ini',
                  content: dessert.deskripsi,
                  icon: Icons.description_outlined,
                ),
                const SizedBox(height: 16),

                // Section Komposisi (Ganti dari Manfaat)
                _InfoCard(
                  title: 'Bahan Utama',
                  content: dessert.komposisi,
                  icon: Icons.receipt_long_outlined,
                ),
                const SizedBox(height: 16),

                // Section Kalori (Ganti dari Efek Samping)
                _InfoCard(
                  title: 'Informasi Nutrisi',
                  content: dessert.kalori,
                  icon: Icons.local_fire_department_outlined,
                  isWarning: true,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.title,
    required this.content,
    required this.icon,
    this.isWarning = false,
  });

  final String title;
  final String content;
  final IconData icon;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: isWarning ? Colors.orange : colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(height: 1),
            ),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.5,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}