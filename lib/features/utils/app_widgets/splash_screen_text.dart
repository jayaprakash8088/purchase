import 'package:flutter/material.dart';

class SplashScreenText extends StatelessWidget {
  const SplashScreenText({super.key, required this.text1, required this.text2});
  final String text1,text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text1,style: const TextStyle(fontSize: 12.0,color: Colors.white,fontStyle: FontStyle.normal,
          ),),
          const SizedBox(height: 5.0,),
          Text(text2,style: const TextStyle(fontSize: 12.0,color: Colors.white,fontStyle: FontStyle.normal,
             ),)
        ],
      ),
    );
  }
}
