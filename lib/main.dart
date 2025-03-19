import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanremo_travel/pages/location_page.dart';
import 'package:sanremo_travel/pages/navigation.dart';
import 'package:sanremo_travel/pages/splash_screen.dart';
import 'package:sanremo_travel/pages/utils/provider_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProviderApp(),

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
