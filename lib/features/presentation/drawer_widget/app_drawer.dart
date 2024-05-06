import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchase_approval/features/app_providers/drawer_provider.dart';
import 'package:purchase_approval/features/app_providers/home_provider.dart';

import '../../utils/my_strings.dart';
import '../../utils/text_style.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<DrawerProvider>(context);
    provider.isLoaded?null:provider.callRequest();
    return RefreshIndicator(
      onRefresh: ()async{
        provider.callRequest();
      },
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          color: const Color.fromRGBO(64 ,64,64, 1),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height:50),
                 Text(
                  branchDetails,
                  style: boldWhiteText,
                ),
                const SizedBox(height:10),
                const Divider(height: 5,color: Colors.white,),
               provider.isLoaded?ListView.separated(
                   separatorBuilder: (context,index){return
                     const Divider(color: Colors.grey,height: 2,);},
                   itemCount: provider.response.table.length,
                   shrinkWrap: true,
                   padding: EdgeInsets.zero,
                   physics: const AlwaysScrollableScrollPhysics(),
                   itemBuilder: (context, index) {
                     return  GestureDetector(
                       onTap: (){
                        var homeProvider=Provider.of<HomeProvider>(context,listen: false);
                        homeProvider.callRequest(provider.response.table[index].b);
                        homeProvider.tempResponse.table.clear();
                        homeProvider.isLoaded=false;
                        Navigator.pop(context);
                       },
                       child: Padding(
                         padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                         child: Text('${provider.response.table[index].a}(${provider.response.table[index].c})'
                           ,style: whiteText,),
                       ),
                     );

                   }):const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
