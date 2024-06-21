// ignore_for_file: use_build_context_synchronously
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:purchase_approval/features/app_providers/login_provider.dart';
import 'package:purchase_approval/features/utils/my_strings.dart';
import 'package:purchase_approval/features/utils/text_style.dart';

import '../main_menu/main_menu.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
  }



  @override
  Widget build(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.08,
          ),
          child: AppBar(
            title: Text(appTitle, style: whiteText),
            backgroundColor: const Color.fromRGBO(174, 39, 95, 1),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: loginProvider.userName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: userIdText),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: loginProvider.showClicked,
              controller: loginProvider.pwd,
              decoration: InputDecoration(
                  suffix: GestureDetector(
                    onTap: () {
                      loginProvider.changeShow();
                    },
                    child: Text(
                      show,
                      style: blackText,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  // labelText: 'Password',
                  hintText: password),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: ()  async{
              if(loginProvider.userName.text.trim().isNotEmpty &&
                  loginProvider.pwd.text.trim().isNotEmpty){
                if  (_connectionStatus[0]==ConnectivityResult.mobile||
              _connectionStatus[0]==ConnectivityResult.wifi){
                  bool response = await loginProvider.callRequest(context);
                  if (response) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainMenu()),
                            (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(somethingWrong)));
                  }
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text(checkInternet)));
                }
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(userPwd)));
              }
            },
            child: Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(174, 39, 95, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  login,
                  style: smallWhiteText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
