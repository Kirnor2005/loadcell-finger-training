import 'package:flutter/material.dart';
import '../aesthetics/app_colors.dart';

// Page for Stats
class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orhraceousSalmon,
        title: const Text('Stats'),
      ),
      body: const Center(
        child: Text('Welkom op de nieuwe pagina!'),
      ),
    );
  }
}