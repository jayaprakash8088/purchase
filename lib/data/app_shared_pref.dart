import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref{
  late SharedPreferences _prefs;
   AppSharedPref(){
     _init();
   }
  Future _init() async{
    _prefs =  await SharedPreferences.getInstance();
  }
  void setIp(String value)async{
  _prefs=await SharedPreferences.getInstance();
  _prefs.setString('ip', value);
  }

  Future<String>getIp()async{
     _prefs=await SharedPreferences.getInstance();
     return _prefs.getString('ip')??'';
  }
}