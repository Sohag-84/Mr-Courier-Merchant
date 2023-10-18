import 'package:courier/Merchant/Parcel/models/charge_of_delivery_model.dart';
import 'package:http/http.dart' as http;

class ChargeOfDeliveryService {
  String endpoint = "api/charge/get/1";
  String rootUrl = 'https://foxs.com.bd/';
  Future<ChargeOfDeliveryModel> fetchChargeOfDelivery() async {
    String fullUrl = rootUrl + endpoint;
    var response = await http.get(Uri.parse(fullUrl));
    if (response.statusCode == 200) {
      chargeOfDeliveryModelFromJson(response.body);
    } else
      return null;
  }
}
