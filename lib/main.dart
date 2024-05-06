import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchase_approval/features/app_providers/detail_provider.dart';
import 'package:purchase_approval/features/app_providers/drawer_provider.dart';
import 'package:purchase_approval/features/app_providers/home_provider.dart';
import 'package:purchase_approval/features/app_providers/login_provider.dart';
import 'package:purchase_approval/features/utils/my_strings.dart';
import 'features/presentation/login/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => DrawerProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => HomeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoginProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DetailProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'SF-Regular',
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(174, 39, 95, 1))),
      home: const SplashScreen(),
    );
  }
}
