import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
//import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/models/register.dart';
//import 'package:tt9_betweener_challenge/models/user.dart';

// Future<Register> register(Map<String, String> body) async {
//   print(body);
//   final response = await http.post(
//     Uri.parse(registerUrl),
//     body: body,
//   );
//   print(response.statusCode);

//   if (response.statusCode == 201) {
//     return registerFromJson(response.body);
//   } else {
//     throw Exception('Failed to register');
//   }
// }

Future<Register> register(Map<String, String> body) async {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final response = await _helper.post2(
    "/register",
    body,
  );

  return registerFromJson((jsonEncode(response)));
}
