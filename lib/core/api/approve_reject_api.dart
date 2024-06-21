
import 'package:http/http.dart' as http;

approveRejectApiRequest(dynamic formData,String ip) async {
  try {
     String url = 'http://$ip/PFMSINS/CBMMSWebSrv.asmx';
    const String soapAction = 'http://tempuri.org/XmlPOAppr';
    String requestBody = '<?xml version="1.0" encoding="utf-8"?>'
        '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'
        '<soap:Body>'
        '<XmlPOAppr xmlns="http://tempuri.org/">'
        ' <response>[$formData]</response>'
        ' <sComp>001</sComp>'
        ' </XmlPOAppr>'
        ' </soap:Body>'
        ' </soap:Envelope>';

    final http.Response httpResponse = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'text/xml; charset=utf-8',
        'SOAPAction': soapAction,
      },
      body: requestBody,
    );

    if (httpResponse.statusCode == 200) {
      var response=httpResponse.body;
      var t = response
          .replaceAll(
          '<?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><soap:Body><XmlPOApprResponse xmlns="http://tempuri.org/"><XmlPOApprResult>',
          '')
          .trim();
      var result = t
          .replaceAll(
          '</XmlPOApprResult></XmlPOApprResponse></soap:Body></soap:Envelope>',
          '')
          .trim();
      var res=result.substring(0,4);
      return res.toLowerCase()!='fail';
    } else {
      return false;
    }
  } catch (error) {
    print('Error: $error');
  }
}
