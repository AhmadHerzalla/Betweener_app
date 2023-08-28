import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
//import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/models/follow.dart';
import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:tt9_betweener_challenge/views_featuers/auth/login_view.dart';

Future<Follow> getFollowInfo() async {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final token = await SharedPrefsController().getData('user');

  final response = await _helper
      .get("/follow", {'Authorization': 'Bearer ${token['token']}'});

  //print(followFromJson(response));
  // print(followFromJson(response).runtimeType);

  return followFromJson(jsonEncode(response));
}

Future<bool> addFollow(Map<String, String> body) async {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final token = await SharedPrefsController().getData('user');

  await _helper
      .post("/follow", body, {'Authorization': 'Bearer ${token['token']}'});

  return true;
}









// Future<Follow> getFollowInfo(context) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   User1 user = userFromJson(prefs.getString('user')!);

//   final response = await http.get(Uri.parse(followUrl),
//       headers: {'Authorization': 'Bearer ${user.token}'});

//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);

//     return Follow.fromJson(data);
//   }

//   if (response.statusCode == 401) {
//     Navigator.pushReplacementNamed(context, LoginView.id);
//   }

//   return Future.error('Somthing wrong');
// }

// Future<bool> addFollow(context, Map<String, dynamic> body) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   User1 user = userFromJson(prefs.getString('user')!);

//   final response = await http.post(Uri.parse(followUrl),
//       headers: {'Authorization': 'Bearer ${user.token}'}, body: body);

//   if (response.statusCode == 200) {
//     //print(response.body);

//     return true;
//   }

//   if (response.statusCode == 401) {
//     Navigator.pushReplacementNamed(context, LoginView.id);
//   }

//   return Future.error('Somthing wrong');
// }
