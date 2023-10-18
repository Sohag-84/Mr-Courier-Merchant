import 'dart:convert';
import 'dart:developer';

import 'package:courier/Merchant/Parcel/model/track_model.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class TrackParcelService {
  Future<TrackModel> getData(String trackId) async {
    final pref = GetStorage();

    var response = await http.get(
      Uri.parse("https://mrdelivery.com.bd/api/parcel/track/$trackId"),
      // headers: {
      //   'id': "155",
      // },
    );

    if (response.statusCode == 200) {
      log(response.body);
      var data = jsonDecode(response.body);
      if (data['trackInfos'] != null) {
        log("Percel details data: ${response.body}");
        return trackModelFromJson(response.body);
      }
    } else {
      return null;
    }
  }
}
