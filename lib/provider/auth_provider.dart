import 'dart:convert';

import 'package:dashbord/models/profile_model.dart';
import 'package:dashbord/provider/base_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthenProvider extends BaseProvider {
  bool authenticated = false;
  bool? isFirstTime;
    ProfileModel? profileModel;


  isFirstTimee() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool("isFirstTime") ?? true;
    if (isFirstTime!) {
      prefs.setBool("isFirstTime", false);
    }
    if (kDebugMode) {
      print("isFirstTime: $isFirstTime");
    }
  }

  initializeAuthProvider() async {
    setLoading(true);
    setError(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    authenticated = (token != null) ? true : false;

    // if (authenticated) {
    //   api.refreshToken();
    // }
    if (kDebugMode) {
      print("Bearer Token is : $token");
      print("Auth Status is : $authenticated");
    }

    setLoading(false);
  }

  Future<List> login(Map<String, dynamic> body) async {
    setLoading(true);
    setError(false);
    Response response = await api.post("login", body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      prefs.setString("token", json.decode(response.body)['access_token']);
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      prefs.remove("token");
      return [false, json.decode(response.body)['message']];
    }
  }
  Future getUser() async {
    setLoading(true);
    setError(false);
    var response = await api.get("profile");
    if (response.statusCode == 200) {
      profileModel = ProfileModel.fromJson(jsonDecode(response.body));
      setLoading(false);
      setError(false);
      return ProfileModel;
    } else {
      setLoading(false);
      setError(true);
      return jsonDecode(response.body);
    }
  }
}