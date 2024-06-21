import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:purchase_approval/data/model/drawer_model.dart';
import 'package:purchase_approval/features/utils/app_config.dart';

drawerApiRequest(String userId,String ip) async {
  try {
     String url = 'http://$ip/PFMSINS/CBMMSWebSrv.asmx';
    const String soapAction = 'http://tempuri.org/XmlPOBranch';
    String requestBody = '<?xml version="1.0" encoding="utf-8"?>'
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
        ' xmlns:xsd="http://www.w3.org/2001/XMLSchema" '
        'xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'
        '<soap:Body><XmlPOBranch xmlns="http://tempuri.org/">'
        '<QryID>A</QryID><sComp>001</sComp><sUser>$userId</sUser>'
        ' <sLevel>$level</sLevel>'
        '</XmlPOBranch></soap:Body></soap:Envelope>';

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
              '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><XmlPOBranchResponse xmlns="http://tempuri.org/"><XmlPOBranchResult>',
              '')
          .trim();
      var result = t
          .replaceAll(
              '</XmlPOBranchResult></XmlPOBranchResponse></soap:Body></soap:Envelope>',
              '')
          .trim();
      Map<String, dynamic> valueMap = json.decode(result);
      return DrawerResponseModel.fromJson(valueMap);
    } else {
      return null;
    }
  } catch (error) {
    print('Error: $error');
  }
}
