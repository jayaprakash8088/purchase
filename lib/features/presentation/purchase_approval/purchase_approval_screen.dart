import 'package:flutter/material.dart';
import 'package:purchase_approval/data/model/home_response_model.dart';
import 'package:purchase_approval/features/presentation/purchase_approval/details_screen.dart';
import 'package:purchase_approval/features/utils/app_widgets/details_card_widget.dart';
import '../../utils/my_strings.dart';
import '../../utils/text_style.dart';

class PurchaseApprovalScreen extends StatelessWidget {
  const PurchaseApprovalScreen({super.key, required this.table});
  final List<MyTable> table;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(MediaQuery
          .of(context)
          .size
          .width,
          MediaQuery
              .of(context)
              .size
              .height * 0.08),
          child: AppBar(
            title: Text(approvedPurchase, style: whiteText),
            backgroundColor: const Color.fromRGBO(174, 39, 95, 1),
          )),
      // drawer: const AppDrawer(),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: table.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const DetailsScreen()));
                      },
                      child:  DetailsCardWidget(table:table[index]));
                }),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
