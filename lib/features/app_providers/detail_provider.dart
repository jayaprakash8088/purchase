import 'package:flutter/material.dart';

import '../../core/api/detail_api.dart';
import '../../data/model/detail_response_model.dart';

class DetailProvider extends ChangeNotifier{
  bool isLoaded=false;
  DetailResponseModel response=DetailResponseModel(table: []);
  Future callRequest()async{
       response=await detailApiRequest();
      if(response!=null){
        isLoaded=true;
        notifyListeners();
    }
  }
}