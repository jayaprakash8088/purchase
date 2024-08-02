import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchase_approval/features/app_providers/drawer_provider.dart';
import 'package:purchase_approval/features/app_providers/home_provider.dart';
import 'package:purchase_approval/features/utils/text_style.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    var drawerProvider = Provider.of<DrawerProvider>(context);
    drawerProvider.isLoaded ? null : drawerProvider.callRequest();

    return DropdownButton<String>(
      hint: Text( drawerProvider.selectedValue??'Please choose here',
          style: blackText),
      items: drawerProvider.responseModel.table.map((value) {
        return DropdownMenuItem<String>(
          onTap: (){
            drawerProvider.id=value.b;
          },
          value: '${value.a}(${value.c})',
          child: Text(
            value != null ? '${value.a}(${value.c})' : drawerProvider.selectedValue!,
            style: blackText,
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          drawerProvider.selectedValue = newValue;
        });
        var homeProvider = Provider.of<HomeProvider>(context, listen: false);
        homeProvider.callRequest(drawerProvider.id);
        homeProvider.tempResponse.table.clear();
        homeProvider.isLoaded = false;
      },
      value: drawerProvider.selectedValue,
    );
  }
}
