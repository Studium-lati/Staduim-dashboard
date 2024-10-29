
import 'dart:convert';

import 'package:dashbord/helper/const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Api {
  Future<Response> get(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(Uri.parse(BASE_URL + url), headers: {
      "Accept": 'application/json',
      "content-type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (kDebugMode) {
      print('GET $url');
      print('Response: ${response.body}');
      print("Status Code: ${response.statusCode}");
    }
    
    return response;
  }
   Future<Response> post(String endpoint, Map<String, dynamic> data) async {


    final response = await http.post(

      Uri.parse('http://stadium.test/api/events/create$endpoint'),

      body: jsonEncode(data),

      headers: {'Content-Type': 'application/json'},

    );

    return response;

  }

}

  

