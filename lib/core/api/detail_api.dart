import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/model/detail_response_model.dart';

detailApiRequest() async {
  try {
    const String url = 'http://106.51.77.162/PFMSINS/CBMMSWebSrv.asmx';
    const String soapAction = 'http://tempuri.org/XmlPORate';
     String requestBody =
        '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'
        '<soap:Body>'
        '<XmlPORate xmlns="http://tempuri.org/">'
        '<QryID>a</QryID>'
        '<sComp>001</sComp>'
        '</XmlPORate>'
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
              '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><XmlPORateResponse xmlns="http://tempuri.org/"><XmlPORateResult>',
              '')
          .trim();
      var result = t
          .replaceAll(
              '</XmlPORateResult></XmlPORateResponse></soap:Body></soap:Envelope>',
              '')
          .trim();
      Map<String, dynamic> valueMap = json.decode(result);
      return DetailResponseModel.fromJson(valueMap);
    } else {
      return null;
    }
  } catch (error) {
    print('Error: $error');
  }
}
