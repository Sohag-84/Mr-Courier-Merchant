import 'dart:convert';

import 'package:courier/Merchant/Parcel/models/unions_model.dart';
import 'package:http/http.dart' as http;

class UnionsService {
  fetchUnions({int areaid}) async {
    String fullUrl = "https://foxs.com.bd/api/merchant/get_union/$areaid";
    try {
      var response = await http.get(Uri.parse(fullUrl));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['success'] == true) {
          return unionsModelFromJson(response.body);
        } else {
          return null;
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
