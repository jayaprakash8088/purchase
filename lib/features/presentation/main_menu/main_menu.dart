import 'package:flutter/material.dart';
import 'package:purchase_approval/features/presentation/approval_screen/approval_screen.dart';

import '../../utils/app_widgets/logout_dialog.dart';
import '../../utils/my_strings.dart';
import '../../utils/text_style.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(MediaQuery.of(context).size.width ,
          MediaQuery.of(context).size.height*0.08),
          child:AppBar(
            title: Text(mainMenu,style: whiteText),
            backgroundColor: const Color.fromRGBO(174, 39, 95,1),
          )),
      body: PopScope(
        canPop: false,
        onPopInvoked: (_)=>logOutDialog(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 75.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ApprovalPage()),
                        );
              },
              child: Center(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration:  BoxDecoration(
                    color: const Color.fromRGBO(174, 39, 95, 1),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text(
                      title,
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
      ),
    );
  }
}
