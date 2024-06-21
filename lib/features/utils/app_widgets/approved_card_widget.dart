// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:fl_toast/fl_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:purchase_approval/data/app_shared_pref.dart';
import 'package:purchase_approval/features/utils/app_config.dart';
import 'package:purchase_approval/features/utils/app_widgets/please_wait.dart';
import 'package:purchase_approval/features/utils/my_strings.dart';
import 'package:purchase_approval/features/utils/text_style.dart';

import '../../../core/api/approve_reject_api.dart';
import '../../../data/model/home_response_model.dart';
import 'card_details_widget.dart';

class ApprovedCardWidget extends StatelessWidget {
  const ApprovedCardWidget(
      {super.key,
      required this.isFromApproval,
      required this.isDark,
      required this.table,
      required this.remove,
      required this.baseContext});

  final bool isFromApproval;
  final bool isDark;
  final MyTable table;
  final Function remove;
  final BuildContext baseContext;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: isFromApproval,
      closeOnScroll: true,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: _first,
            backgroundColor: Colors.white,
            foregroundColor: Colors.green,
            icon: Icons.check,
            label: approve,
          ),
          SlidableAction(
            onPressed: second,
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            icon: Icons.cancel,
            label: reject,
          ),
        ],
      ),

      child: Card(
        color: isFromApproval && isDark
            ? const Color.fromRGBO(244, 244, 244, 1)
            : const Color.fromRGBO(191, 181, 181, 1),
        elevation: 2.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDetailsWidget(title: docNo, desc: table.A),
                CardDetailsWidget(title: party, desc: table.B),
                CardDetailsWidget(title: itemType, desc: table.C),
                CardDetailsWidget(title: fright, desc: table.D),
                CardDetailsWidget(title: broker, desc: table.E),
                CardDetailsWidget(title: poValue, desc: table.F.toString())
              ],
            ),
            // const Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: Icon(
            //     Icons.check,
            //     color: Colors.green,
            //     size: 30.0,
            //   ),
            // )
          ],
        ),
      ),
      // ),
    );
  }

  Future<void> _first(BuildContext context) async {

    var pref=AppSharedPref();
    String ip=await pref.getIp();
    showLoaderDialog(baseContext);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    Map formData = {
      'DCNO': 'A',
      'docNo': table.O,
      'userId': userId,
      'reason': '',
      'date': formattedDate,
      'status': 'A',
      'level': level
    };
    var value = jsonEncode(formData);
    bool val = await approveRejectApiRequest(value,ip);
    if (val) {
      await showTextToast(
        duration:  const Duration(seconds: 1),
        text: approved,
        context: baseContext,
      );
     remove();
      Navigator.pop(baseContext);
    }else{
      Navigator.pop(baseContext);
      await showTextToast(
        duration: const Duration(seconds:2 ),
        text: tryAgain,
        context: baseContext,
      );
    }

  }

  second(BuildContext baseContext1) async{
    TextEditingController textEditingController = TextEditingController();
    bool rejectClicked=false;
   showDialog(
      context: baseContext1,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context,setState){
         return AlertDialog(
            title: Text(
              rejectionReason,
              style: pinkText,
            ),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               rejectClicked?const CircularProgressIndicator(): TextField(
                  controller: textEditingController,
                ),
              ],
            ),
            actions: [
              rejectClicked?
              const SizedBox(): TextButton(
                child: const Text(cancel),
                onPressed: () {
                  Navigator.pop(context,false);
                },
              ),
              rejectClicked?
              const SizedBox():
              TextButton(
                child: const Text(reject),
                onPressed: ()async  {
                  var pref=AppSharedPref();
                  String ip=await pref.getIp();
                  if(textEditingController.text.trim().isNotEmpty){
                    FocusScope.of(context).unfocus();
                    DateTime now = DateTime.now();
                    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
                    Map formData = {
                      'DCNO': 'R',
                      'docNo': table.O,
                      'userId': userId,
                      'reason': textEditingController.text,
                      'date': formattedDate,
                      'status': 'R',
                      'level': level
                    };
                    var value = jsonEncode(formData);
                    bool val = await approveRejectApiRequest(value,ip);
                    if (val) {
                      setState((){rejectClicked=true;});
                      await showTextToast(
                        text: rejected,
                        duration:  const Duration(microseconds: 500),
                        context:baseContext,
                      );
                      remove();
                    }else{
                      showTextToast(
                        text: tryAgain,
                        duration:  const Duration(seconds:2 ),
                        context:baseContext,
                      );
                    }
                    Navigator.pop(context);
                  }

                },
              ),
            ],
          );
        });
      },
    );
  }
}
