import 'package:flutter/material.dart';
import 'package:purchase_approval/data/model/drawer_model.dart';
import 'package:purchase_approval/features/utils/app_config.dart';
import '../../core/api/drawer_api.dart';

class DrawerProvider extends ChangeNotifier{
  bool isLoaded=false;
  DrawerResponseModel response=DrawerResponseModel(table: []);
  DrawerResponseModel responseModel=DrawerResponseModel(table: []);
  Future callRequest()async{
    response=await drawerApiRequest(userId);
   for(int i=0;i<response.table.length;i++){
     if(response.table[i].d==level){
       responseModel.table.add(response.table[i]);
     }
   }
   isLoaded=true;
   notifyListeners();
   }

}