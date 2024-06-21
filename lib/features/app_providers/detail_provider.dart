import 'package:flutter/material.dart';

import '../../core/api/detail_api.dart';
import '../../data/app_shared_pref.dart';
import '../../data/model/detail_response_model.dart';

class DetailProvider extends ChangeNotifier{
  bool isLoaded=false;
  DetailResponseModel response=DetailResponseModel(table: []);
  Future callRequest()async{
    var pref=AppSharedPref();
    String ip=await pref.getIp();
       response=await detailApiRequest(ip);
      if(response!=null){
        isLoaded=true;
        notifyListeners();
    }
  }
}