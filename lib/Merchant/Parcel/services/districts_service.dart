import 'dart:convert';

import 'package:courier/Merchant/Parcel/models/districts_model.dart';
import 'package:http/http.dart' as http;

class DistrictsService {
  Future<DistrictsModel> fetchDistricts({int divisionId}) async {
    String fullUrl =
        "https://foxs.com.bd/api/merchant/get_district?division_id=$divisionId";
    var jsonData;
    var response = await http.get(Uri.parse(fullUrl));
    jsonData = json.decode(response.body);

    // List<DistrictsModel> districts = jsonData.map<DistrictsModel>((json) {
    //   return DistrictsModel.fromJson(json);
    // }).toList();

    return DistrictsModel.fromJson(jsonData);
  }
}
