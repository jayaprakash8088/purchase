import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:purchase_approval/data/model/home_response_model.dart';
homeApiReq(String branchCode,int level) async {
  try {
    const String url = 'http://106.51.77.162/PFMSINS/CBMMSWebSrv.asmx';
    const String soapAction = 'http://tempuri.org/XmlPODtl';
     String requestBody = '<?xml version="1.0" encoding="utf-8"?>'
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"'
        ' xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'
        '<soap:Body><XmlPODtl xmlns="http://tempuri.org/">'
        '<QryID>b</QryID>'
        ' <brcode>$branchCode</brcode>'
        ' <sComp>001</sComp>'
         ' <sLevel>$level</sLevel>'
        ' </XmlPODtl>'
        '</soap:Body></soap:Envelope>';

    final http.Response httpResponse = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'text/xml; charset=utf-8',
        'SOAPAction': soapAction,
      },
      body: requestBody,
    );

    if (httpResponse.statusCode == 200) {
      dynamic response = httpResponse.body;
      var t = response
          .replaceAll(
              '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><XmlPODtlResponse xmlns="http://tempuri.org/"><XmlPODtlResult>',
              '')
          .trim();
      var result = t
          .replaceAll(
              '</XmlPODtlResult></XmlPODtlResponse></soap:Body></soap:Envelope>',
              '')
          .trim();
      Map<String,dynamic> valueMap = json.decode(result);
      return HomeResponseModel.fromJson(valueMap);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('Error: $error');
  }
}
