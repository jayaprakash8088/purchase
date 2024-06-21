import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:purchase_approval/data/model/register_response_model.dart';

Future<dynamic> registerApiRequest(String userName, String companyCode) async {
  try {
    var fd={'COMCODE':companyCode,
    'USERNAME':userName};
    const String url = 'http://featzapps.com/fz_smart/login_approval.php?';
    final http.Response httpResponse = await http.post(
      Uri.parse('${url}COMCODE=${companyCode}USERNAME=$userName'),
      body:fd,
    );

    if (httpResponse.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(httpResponse.body);
      Map<String, dynamic> firstItem = jsonResponse.first;
      return RegisterResponseModel.fromJson(firstItem);
    } else {
      return null;
    }
  } catch (error) {
    print('Error: $error');
  }
}
