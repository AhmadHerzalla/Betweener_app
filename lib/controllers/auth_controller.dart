import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
//import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/models/user.dart';

Future<User1> login(Map<String, String> body) async {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final response = await _helper.post2(
    "/login",
    body,
  );

  return userFromJson((jsonEncode(response)));
}


// Future<User1> login(Map<String, String> body) async {
//   final response = await http.post(
//     Uri.parse(loginUrl),
//     body: body,
//   );

//   if (response.statusCode == 200) {
//     return userFromJson(response.body);
//   } else {
//     throw Exception('Failed to login');
//   }
// }

