import 'package:flutter_bloc_v8_api_tut/models/bored_model.dart';
import 'package:http/http.dart';

class BoredService {
  Future<BoredModel> getBoredActivity() async {
    final response =
        await get(Uri.parse('https://www.boredapi.com/api/activity'));
    BoredModel boredActivity = boredModelFromJson(response.body);

    return boredActivity;
  }
}
