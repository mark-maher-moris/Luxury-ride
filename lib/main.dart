import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/resources/routes_manager.dart';
import 'package:myapp/resources/theme_manager.dart';
import 'package:myapp/view/home/home_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Luxury Ride',
      home: HomeView(),
      onGenerateRoute: (settings) {
        onGenerateRoute(settings);
      },
      routes: routes,
    );
  }
}
