import 'package:flutter/material.dart';
import 'package:purchase_approval/features/utils/app_widgets/splash_screen_text.dart';
import 'package:purchase_approval/features/utils/images.dart';
import 'package:purchase_approval/features/utils/my_strings.dart';
import 'package:purchase_approval/features/utils/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => AppRoutes.moveToLogin(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(splash), fit: BoxFit.fill)),
        child: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SplashScreenText(text1: title, text2: version),
              SplashScreenText(text1: mailId, text2: webAdd)
            ],
          ),
        ),
      ),
    );
  }
}
