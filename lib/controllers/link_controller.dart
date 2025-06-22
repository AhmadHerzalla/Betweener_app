import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';

import 'package:tt9_betweener_challenge/models/link_respons_model.dart';

class LinkRepository {
  Future<List<Link>?> fetchLinks() async {
    final ApiBaseHelper helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');
    // print(token);
    final response = await helper
        .get("/links", {'Authorization': 'Bearer ${token['token']}'});

    return LinkResponse.fromJson(response).results;
  }

  Future<bool> addLinks(Map<String, String> body) async {
    final ApiBaseHelper helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');

    await helper
        .post("/links", body, {'Authorization': 'Bearer ${token['token']}'});

    return true;
  }

  Future<bool> editLinks(Map<String, String> body, int id) async {
    final ApiBaseHelper helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');

    await helper
        .put("/links/$id", body, {'Authorization': 'Bearer ${token['token']}'});

    return true;
  }

  Future<bool> deleteLinks(int id) async {
    final ApiBaseHelper helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');

    await helper
        .delete("/links/$id", {'Authorization': 'Bearer ${token['token']}'});

    return true;
  }
}
