
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../my_strings.dart';
import '../text_style.dart';

logOutDialog(BuildContext baseContext){
  showDialog(
    context: baseContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          sureLogout,
          style: pinkText,
        ),
        actions: [
          TextButton(
            child: const Text(cancel),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(logout),
            onPressed: ()  {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
          ),
        ],
      );
    },
  );
}