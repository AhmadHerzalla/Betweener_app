// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tt9_betweener_challenge/core/util/constants.dart';
// //import 'package:tt9_betweener_challenge/core/util/constants.dart';
// import 'package:tt9_betweener_challenge/models/user.dart';
// import 'package:tt9_betweener_challenge/views_featuers/auth/login_view.dart';

// import '../models/link.dart';
// import 'package:http/http.dart' as http;

// Future<List<Link>> getLinks(context) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   User1 user = userFromJson(prefs.getString('user')!);

//   final response = await http.get(Uri.parse(linksUrl),
//       headers: {'Authorization': 'Bearer ${user.token}'});

//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body)['links'] as List<dynamic>;

//     return data.map((e) => Link.fromJson(e)).toList();
//   }

//   if (response.statusCode == 401) {
//     Navigator.pushReplacementNamed(context, LoginView.id);
//   }

//   return Future.error('Somthing wrong');
// }

// Future<bool> addLink(context, Map<String, dynamic> body) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   User1 user = userFromJson(prefs.getString('user')!);

//   final response = await http.post(Uri.parse(linksUrl),
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

// Future<bool> editLink(context, Map<String, dynamic> body, int id) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   User1 user = userFromJson(prefs.getString('user')!);

//   final response = await http.put(Uri.parse(editLinkUrl + id.toString()),
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

// Future<bool> deleteLink(context, int id) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();

//   User1 user = userFromJson(prefs.getString('user')!);

//   final response = await http.delete(Uri.parse(deleteUrl + id.toString()),
//       headers: {'Authorization': 'Bearer ${user.token}'});

//   if (response.statusCode == 200) {
//     //print(response.body);

//     return true;
//   }

//   if (response.statusCode == 401) {
//     Navigator.pushReplacementNamed(context, LoginView.id);
//   }

//   return Future.error('Somthing wrong');
// }

import 'package:tt9_betweener_challenge/core/helper/api_base_helper.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';

import 'package:tt9_betweener_challenge/models/link_respons_model.dart';

class LinkRepository {
  Future<List<Link>?> fetchLinks() async {
    final ApiBaseHelper _helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');
    print(token);
    final response = await _helper
        .get("/links", {'Authorization': 'Bearer ${token['token']}'});

    return LinkResponse.fromJson(response).results;
  }

  Future<bool> addLinks(Map<String, String> body) async {
    final ApiBaseHelper _helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');

    await _helper
        .post("/links", body, {'Authorization': 'Bearer ${token['token']}'});

    return true;
  }

  Future<bool> editLinks(Map<String, String> body, int id) async {
    final ApiBaseHelper _helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');

    await _helper
        .put("/links/$id", body, {'Authorization': 'Bearer ${token['token']}'});

    return true;
  }

  Future<bool> deleteLinks(int id) async {
    final ApiBaseHelper _helper = ApiBaseHelper();
    final token = await SharedPrefsController().getData('user');

    await _helper
        .delete("/links/$id", {'Authorization': 'Bearer ${token['token']}'});

    return true;
  }
}
