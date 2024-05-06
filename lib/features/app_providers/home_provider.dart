import 'package:flutter/material.dart';
import 'package:purchase_approval/features/utils/app_config.dart';

import '../../core/api/home_api.dart';
import '../../data/model/home_response_model.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoaded = false;
  HomeResponseModel response = HomeResponseModel(table: []);
  HomeResponseModel tempResponse = HomeResponseModel(table: []);
  List<MyTable>table1=[];
  List<MyTable>table2=[];
  List<String>docId=[];
  Future callRequest(String id) async {
    tempResponse.table.clear();
    docId=[];
    response = await homeApiReq(id, level);
    if (response != null) {
      table1=response.table;
      for(int i=0;i<table1.length;i++){
       if(docId.isEmpty||!docId.contains(table1[i].A)){
         docId.add(table1[i].A);
         tempResponse.table.add(table1[i]);
       }
      }
    }
    isLoaded = true;
    notifyListeners();
  }

  removeList(index) {
    tempResponse.table.removeAt(index);
    notifyListeners();
  }

  List<MyTable> fetchList(String docId){
    table2=[];
    for(int i=0;i<table1.length;i++){
      if(docId==table1[i].A){
        table2.add(table1[i]);
      }
    }
    return table2;
  }
}
