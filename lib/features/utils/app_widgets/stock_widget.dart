import 'package:flutter/material.dart';
import 'package:purchase_approval/features/utils/my_strings.dart';

import '../text_style.dart';

class StockWidget extends StatelessWidget {
  const StockWidget({super.key, required this.inStockNum,
    required this.processingNum});
    final String inStockNum;
    final String processingNum;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0,left: 5.0),
          child: Text('$onHand $inStockNum',style: pinkText,),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0,left: 5.0),
          child: Text('$processing  $processingNum',style: pinkText,),
        )
      ],
    );
  }
}
