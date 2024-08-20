import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purchase_approval/data/model/home_response_model.dart';
import 'package:purchase_approval/features/app_providers/home_provider.dart';
import 'package:purchase_approval/features/presentation/drop_down_widget.dart';
import 'package:purchase_approval/features/utils/app_config.dart';
import 'package:purchase_approval/features/utils/app_widgets/approved_card_widget.dart';

import '../../utils/my_strings.dart';
import '../../utils/text_style.dart';
import '../purchase_approval/purchase_approval_screen.dart';

class PurchaseApprovalPage extends StatelessWidget {
  const PurchaseApprovalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.08),
          child: AppBar(
            title: Text(appTitle, style: whiteText),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(levelString + level.toString(), style: whiteText),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_backspace),
              iconSize: 24.0,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromRGBO(174, 39, 95, 1),
          )),
      body: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          const DropdownWidget(),
          const SizedBox(
            height: 10.0,
          ),
          Flexible(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Consumer<HomeProvider>(
                builder: (context, homeProvider, child) => Column(
                  children: [
                    homeProvider.isLoaded &&
                            homeProvider.tempResponse.table.isEmpty
                        ? const SizedBox(
                            height: 50.0,
                            child: Center(
                              child: Text(notApproved),
                            ))
                        : ListView.builder(
                            physics: const ScrollPhysics(),
                            itemCount: homeProvider.tempResponse.table.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(10.0),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    List<MyTable> table =
                                        homeProvider.fetchList(homeProvider
                                            .tempResponse.table[index].A);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PurchaseApprovalScreen(
                                                  table: table)),
                                    );
                                  },
                                  child: ApprovedCardWidget(
                                    isFromApproval: true,
                                    isDark: index % 2 == 0,
                                    table:
                                        homeProvider.tempResponse.table[index],
                                    remove: () {
                                      homeProvider.removeList(index);
                                    },
                                    baseContext: context,
                                  ));
                            }),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
