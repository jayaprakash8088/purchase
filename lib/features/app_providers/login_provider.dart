// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purchase_approval/core/api/login_api.dart';
import 'package:purchase_approval/features/utils/app_config.dart';

import '../../data/app_shared_pref.dart';
import '../utils/app_widgets/please_wait.dart';

class LoginProvider extends ChangeNotifier{
  bool showClicked=true;
  // HomeResponseModel response=HomeResponseModel(table: []);
  TextEditingController userName=TextEditingController();
  TextEditingController pwd=TextEditingController();

  TextEditingController registerUserName=TextEditingController();
  TextEditingController companyCode=TextEditingController();
  Future<bool> callRequest(BuildContext context)async{
    showLoaderDialog(context);
    // if(!isLoaded){
    var pref=AppSharedPref();
    String ip=await pref.getIp();
      dynamic response=await loginApiRequest(userName.text.trim(),pwd.text.trim(),ip);
      if(response!=null&&response){
        Navigator.pop(context);
        userId=userName.text.trim();
        return true;
      }else {
        Navigator.pop(context);
        return false;
      }
    }


    //change obscure

 void changeShow(){
    showClicked=!showClicked;
    notifyListeners();
 }
  }
