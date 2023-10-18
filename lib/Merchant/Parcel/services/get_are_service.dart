import 'dart:convert';
import 'dart:developer';

import 'package:courier/Merchant/Parcel/models/get_area_model.dart';
import 'package:http/http.dart' as http;

class GetAreaService {
  Future<GetAreaModel> fetchGetArea({int districtId}) async {
    String fullUrl = "https://foxs.com.bd/api/merchant/get_area/$districtId";
    var response = await http.get(
      Uri.parse(fullUrl),
    );
    return getAreaModelFromJson(response.body.toString());
    // try {
    //   var response = await http.get(Uri.parse(fullUrl));
    //   var data = jsonDecode(response.body);
    //   if (response.statusCode == 200) {
    //     if (data['success'] == true) {
    //       return getAreaModelFromJson(response.body);
    //     } else {
    //       return null;
    //     }
    //   }
    // } catch (e) {
    //   print(e);
    //   return null;
    // }
  }
}
