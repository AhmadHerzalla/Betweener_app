import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';
import 'package:tt9_betweener_challenge/models/sender.dart';

class ActiveCotroller {
  Future<Sender> getsenderinfo() async {
    final ApiBaseHelper helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');
    final Map<String, dynamic> response = await helper.get(
        "/activeShare/nearest/${token['user']["id"]}",
        {'Authorization': 'Bearer ${token['token']}'});
    return Sender.fromJson(response);
  }
}
