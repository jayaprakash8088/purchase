import 'package:flutter/material.dart';
import 'package:purchase_approval/data/model/home_response_model.dart';
import 'package:purchase_approval/features/utils/app_widgets/card_details_widget.dart';
import 'package:purchase_approval/features/utils/my_strings.dart';

class DetailsCardWidget extends StatelessWidget {
  const DetailsCardWidget({super.key, required this.table});

  final MyTable table;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardDetailsWidget(
            title: item,
            desc: table.G,
          ),
          CardDetailsWidget(title: nature, desc: table.H),
          CardDetailsWidget(title: quantity, desc: table.I.toString()),
          CardDetailsWidget(title: rate, desc: table.J.toString()),
          CardDetailsWidget(title: discount, desc: table.K.toString()),
          CardDetailsWidget(title: addChrgs, desc: table.L.toString()),
          CardDetailsWidget(title: tax, desc: table.M),
          CardDetailsWidget(title: totalValue, desc: table.N.toString()),
          CardDetailsWidget(
            title: stock,
            desc: '',
            isForStock: true,
            processNum: table.S.toString(),
            stockNum: table.R.toString(),
          ),
        ],
      ),
    );
  }
}
