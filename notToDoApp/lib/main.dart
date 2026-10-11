import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:not_to_do_app/pages/homepage.dart';
import 'package:not_to_do_app/pages/notificationscreen.dart';
import 'package:not_to_do_app/pages/profilepage.dart';
import 'package:not_to_do_app/pages/settingspage.dart';
import 'package:not_to_do_app/theme/theme1.dart';

void main() async {
  // Required when executing async calls before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  
  //init the hive
  await Hive.initFlutter();

  // open box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // dark and light theme
  // ThemeMode _themeMode = ThemeMode.light;

  // void _toggleTheme(bool isDark) {
  //   setState(() {
  //     _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  //   });
  // }

  // dark, light and system theme(by default)
  final _box = Hive.box('mybox');

  // loads the saved choice, or 'system' the first time
  late ThemeMode _themeMode = ThemeMode.values.byName(
    _box.get('themeMode', defaultValue: 'system'),
  );

  void _setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
    _box.put('themeMode', mode.name);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'notToDoApp',
      debugShowCheckedModeBanner: false,
      
      //theme part
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: _themeMode, // Applied dynamically

      home: HomePage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/notifications': (context) => const NotificationScreen(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => SettingsPage(
              themeMode: _themeMode,
              onThemeChanged: _setThemeMode, 
        ),
      },
    );
  }
}