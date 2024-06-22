// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchase_approval/core/api/register_api.dart';
import 'package:purchase_approval/data/model/register_response_model.dart';
import 'package:purchase_approval/features/presentation/login/login_screen.dart';

import '../../../data/app_shared_pref.dart';
import '../../utils/my_strings.dart';
import '../../utils/text_style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  var pref = AppSharedPref();
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
    TextEditingController userName=TextEditingController();
    TextEditingController companyCode=TextEditingController();
    return  Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.08,
          ),
          child: AppBar(
            title: Text(register, style: whiteText),
            backgroundColor: const Color.fromRGBO(174, 39, 95, 1),
          )),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(padding: const EdgeInsets.only(top: 100.0,left: 10.0,
             right: 10.0,bottom: 10.0),
              child: Text('Enter Company Code',style: blackText,),),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 50.0,
                child: TextField(
                  controller: companyCode,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: code),
                ),
              ),
            ),
             Padding(padding: const EdgeInsets.all(10.0),
              child: Text('Enter User Id',style: blackText,),),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 50.0,
                child: TextField(
                  controller: userName,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: userIdText),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: ()  async{
                if(userName.text.trim().isNotEmpty &&
                    companyCode.text.trim().isNotEmpty){
                  if  (_connectionStatus[0]==ConnectivityResult.mobile||
                      _connectionStatus[0]==ConnectivityResult.wifi){
                    RegisterResponseModel response = await registerApiRequest(userName.text, companyCode.text);
                    if (response.iP.isNotEmpty) {
                       pref.setIp(response.iP);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
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
                      const SnackBar(content: Text(userCode)));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(174, 39, 95, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        submit,
                        style: smallWhiteText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
