import 'package:flutter/material.dart';
import '../aesthetics/app_colors.dart';

// Page for settings
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orhraceousSalmon,
        leadingWidth: 96, // Ruimte voor beide knoppen
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ],
        ),
        title: const Text('Settings'),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.brickRed,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Settings', style: TextStyle(color: Colors.white,),),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              iconColor: Colors.white,
              title: const Text('Homepage'),
              textColor: Colors.white,
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.bluetooth),
              iconColor: Colors.white,
              title: const Text('Bluetooth Devices'),
              textColor: Colors.white,
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.brush),
              iconColor: Colors.white,
              title: const Text('Personal Settings'),
              textColor: Colors.white,
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.person),
              iconColor: Colors.white,
              title: const Text('Accounts'),
              textColor: Colors.white,
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.language),
              iconColor: Colors.white,
              title: const Text('Language'),
              textColor: Colors.white,
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.privacy_tip),
              iconColor: Colors.white,
              title: const Text('Privacy'),
              textColor: Colors.white,
              onTap: () {},
            ),

          ],
        ),
      ),
      body: const Center(
        child: Text('Welkom op de nieuwe pagina!'),
      ),
    );
  }
}

// maak settings een statefulwidget zodat je kan kiezen welke al geselecteerd is