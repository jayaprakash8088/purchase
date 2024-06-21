
import 'package:flutter/material.dart';
import 'package:purchase_approval/features/presentation/login/register_screen.dart';

import '../../presentation/login/login_screen.dart';

class AppRoutes{

 static void moveToLogin(context){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const LoginPage()) );
  }
 static void moveToRegister(context){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const RegisterScreen()) );
  }
}