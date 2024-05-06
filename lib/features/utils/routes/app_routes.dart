
import 'package:flutter/material.dart';

import '../../presentation/login/login_screen.dart';

class AppRoutes{

 static void moveToLogin(context){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const LoginPage()) );
  }
}