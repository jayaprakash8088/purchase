import 'package:flutter/material.dart';
import 'package:purchase_approval/features/utils/app_widgets/stock_widget.dart';
import 'package:purchase_approval/features/utils/text_style.dart';

class CardDetailsWidget extends StatelessWidget {
  const CardDetailsWidget(
      {super.key,
      required this.title,
      required this.desc,
        this.processNum='0',
        this.stockNum='0',
       this.isForStock=false});

  final String title;
  final String desc;
  final String stockNum;
  final String processNum;
  final bool isForStock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: SizedBox(
                width: 100,
                child: Text(
                  title,
                  style: blackText,
                )),
          ),
          Text(
            ':',
            style: blackText,
          ),
         isForStock?
          StockWidget(inStockNum: stockNum, processingNum:processNum):
         Padding(
            padding: const EdgeInsets.only(right: 5.0, left: 5.0),
            child: Text(
              desc,
              style: pinkText,
            ),
          )
        ],
      ),
    );
  }
}
