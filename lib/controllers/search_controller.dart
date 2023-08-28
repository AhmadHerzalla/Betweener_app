//import 'dart:convert';

//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';
//import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/models/search.dart';
//import 'package:tt9_betweener_challenge/models/search.dart';

// import 'package:tt9_betweener_challenge/models/user.dart';
// import 'package:tt9_betweener_challenge/views_featuers/auth/login_view.dart';
// import 'package:http/http.dart' as http;

// import '../core/util/constants.dart';

Future<List> searchFunction(Map<String, String> body) async {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final token = await SharedPrefsController().getData('user');

  final response = await _helper
      .post("/search", body, {'Authorization': 'Bearer ${token['token']}'});
  // Map<String, dynamic> finalrespons = jsonDecode(response.body);

  return Search.fromJson(response).user!;
}
// Future<Map> searchFunction(context, Map<String, dynamic> body) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   User1 user = userFromJson(prefs.getString('user')!);

//   final response = await http.post(Uri.parse(searchUrl),
//       headers: {'Authorization': 'Bearer ${user.token}'}, body: body);

//   if (response.statusCode == 200) {
//     Map<String, dynamic> finalrespons = jsonDecode(response.body);
//     return finalrespons;
//   }

//   if (response.statusCode == 401) {
//     Navigator.pushReplacementNamed(context, LoginView.id);
//   }

//   return Future.error('Somthing wrong');
// }
