import 'dart:convert';
import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/models/register.dart';

Future<Register> register(Map<String, String> body) async {
  final ApiBaseHelper helper = ApiBaseHelper();
  final response = await helper.post2(
    "/register",
    body,
  );

  return registerFromJson((jsonEncode(response)));
}
