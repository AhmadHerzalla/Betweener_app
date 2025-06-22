import 'dart:convert';

import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';

import 'package:tt9_betweener_challenge/models/user.dart';

Future<User1> login(Map<String, String> body) async {
  final ApiBaseHelper helper = ApiBaseHelper();
  final response = await helper.post2(
    "/login",
    body,
  );

  return userFromJson((jsonEncode(response)));
}
