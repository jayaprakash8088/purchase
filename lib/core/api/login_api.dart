import 'package:http/http.dart' as http;

loginApiRequest(String userName, String pwd) async {
  try {
    const String url = 'http://122.165.228.175:81/PFMSINS/Login.asmx';
    const String soapAction = 'http://tempuri.org/LoginClick';
    String requestBody = '<?xml version="1.0" '
        'encoding="utf-8"?><soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" '
        'xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'
        '<soap:Body>  <LoginClick xmlns="http://tempuri.org/">'
        '<Userid>$userName</Userid>'
        '<Password>$pwd</Password>'
        '<IMEI>0</IMEI>'
        '<scomp>001</scomp>'
        '</LoginClick>'
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
              '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><LoginClickResponse xmlns="http://tempuri.org/"><LoginClickResult><string>',
              '')
          .trim();
      var result = t
          .replaceAll(
              '</LoginClickResult></LoginClickResponse></soap:Body></soap:Envelope>',
              '')
          .trim();
     var val=result.toString().substring(0, 1);
      return val=='1';
    } else {
      return null;
    }
  } catch (error) {
    print('Error: $error');
  }
}
