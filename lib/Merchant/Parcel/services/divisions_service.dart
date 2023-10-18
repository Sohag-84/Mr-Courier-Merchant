import 'dart:convert';
import 'dart:developer';

import 'package:courier/Merchant/Parcel/models/divisions_model.dart';
import 'package:http/http.dart' as http;

class DivisionsService {
  String fullUrl = "https://foxs.com.bd//api/merchant/division_list";

  Future<List<DivisionsModel>> fetchDivision() async {
    var jsonData;
    var response = await http.get(Uri.parse(fullUrl));
    jsonData = json.decode(response.body);

    log(response.toString());

    List<DivisionsModel> divisions = jsonData.map<DivisionsModel>((json) {
      return DivisionsModel.fromJson(json);
    }).toList();

    return divisions;
  }
}
