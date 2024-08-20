import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchase_approval/features/utils/app_config.dart';
import 'package:purchase_approval/features/utils/app_widgets/logout_dialog.dart';

import '../../app_providers/drawer_provider.dart';
import '../../app_providers/home_provider.dart';
import '../../utils/my_strings.dart';
import '../../utils/text_style.dart';
import '../approved_card_screen/approved_card_screen.dart';

class ApprovalPage extends StatelessWidget {
  const ApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.08),
          child: AppBar(
            title: Text(mainMenu, style: whiteText),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_backspace),
              iconSize: 24.0,
              color: Colors.white,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  logOutDialog(context);
                },
                icon: const Icon(Icons.logout),
                iconSize: 24.0,
                color: Colors.white,
              )
            ],
            backgroundColor: const Color.fromRGBO(174, 39, 95, 1),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              var provider =
                  Provider.of<DrawerProvider>(context, listen: false);
              provider.isLoaded = false;
              provider.selectedValue = null;
              provider.response.table.clear();
              provider.responseModel.table.clear();
              var homeProvider =
                  Provider.of<HomeProvider>(context, listen: false);
              homeProvider.tempResponse.table.clear();
              homeProvider.isLoaded = false;
              level = 1;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PurchaseApprovalPage()),
              );
            },
            child: Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(174, 39, 95, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    level1Approval,
                    style: smallWhiteText,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              var provider =
                  Provider.of<DrawerProvider>(context, listen: false);
              provider.isLoaded = false;
              provider.selectedValue = null;
              provider.response.table.clear();
              provider.responseModel.table.clear();
              var homeProvider =
                  Provider.of<HomeProvider>(context, listen: false);
              homeProvider.tempResponse.table.clear();
              homeProvider.isLoaded = false;
              level = 2;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PurchaseApprovalPage()),
              );
            },
            child: Center(
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(174, 39, 95, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    level2Approval,
                    style: smallWhiteText,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
