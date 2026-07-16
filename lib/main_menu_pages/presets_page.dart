import 'package:flutter/material.dart';
import '../aesthetics/app_colors.dart';

// Page for Presets
class PresetsPage extends StatelessWidget {
  const PresetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orhraceousSalmon,
        title: const Text('Presets'),
      ),
      body: const Center(
        child: Text('Welkom op de nieuwe pagina!'),
      ),
    );
  }
}