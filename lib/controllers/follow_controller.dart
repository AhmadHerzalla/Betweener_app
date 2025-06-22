import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';
import 'package:tt9_betweener_challenge/models/follow.dart';

Future<Follow> getFollowInfo() async {
  final ApiBaseHelper helper = ApiBaseHelper();
  final token = await SharedPrefsController().getData('user');
  final Map<String, dynamic> response = await helper
      .get("/follow", {'Authorization': 'Bearer ${token['token']}'});
  return Follow.fromJson(response);
}

Future<bool> addFollow(Map<String, String> body) async {
  final ApiBaseHelper helper = ApiBaseHelper();
  final token = await SharedPrefsController().getData('user');
  await helper
      .post("/follow", body, {'Authorization': 'Bearer ${token['token']}'});

  return true;
}
