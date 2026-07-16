import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../aesthetics/app_colors.dart';

import '../main_menu_pages/stats_page.dart';
import '../main_menu_pages/bluetooth_device_page.dart';
import '../main_menu_pages/presets_page.dart';
import '../main_menu_pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FST App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orhraceousSalmon,), useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _drawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.brickRed,AppColors.brickRed.withValues(alpha: 0.2)]
          )
        ),
      ),
      controller: _drawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1.0
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.only(
                  top: 20, 
                  bottom: 60,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle
                ),
                child: const FlutterLogo(),
              ),
              
              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StatsPage(),
                    ),
                  );
                },
                leading: Icon(Icons.trending_up),
                title: Text('Stats')
              ),
              
              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PresetsPage(),
                    ),
                  );
                },
                leading: const Icon(Icons.mode),
                title: const Text('Presets')
              ),
              
              ListTile(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BluetoothDevicesPage(),
                    ),
                  );
                },
                leading: const Icon(Icons.bluetooth_searching),
                title: const Text('Connected Bluetooth Devices')
              ),
              
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  );
                },
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
              ),

              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrivacyPolicyPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white54,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Side Drawer", style: TextStyle(color: AppColors.slateColor)),
          backgroundColor: AppColors.orhraceousSalmon,
          
          leading: IconButton(
            onPressed: _handleMenuButton,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _drawerController,
              builder: (_, value, __){
                return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ), // Icon
                ); // AnimatedSwitcher
              },
            ), // ValueListenableBuilder
          ),
        ),


        // Alles onder de appbar

        body: Container(
          color: AppColors.cinnamonBuff.withValues(alpha:0.2),
          child: Column(
            children: [
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.slateColor,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'hier komt de grafiek van de meting (trek-rek-diagram)'
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brickRed.withValues(alpha:0.9),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  child: Text('Start Measurement'),
                ),
              ),  
            ],
          ),
          //Expanded(
            //child: YourGraphWidget(),
          //),
        ),
      ),
    ); // AdvancedDrawer
  }
  
  void _handleMenuButton() {
    _drawerController.showDrawer();
  }
}

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String _markdown = '';

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/privacy_policy.md').then((text) {
      setState(() {
        _markdown = text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: Markdown(data: _markdown),
    );
  }
}