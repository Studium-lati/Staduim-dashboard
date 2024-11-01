import 'dart:async';

import 'package:dashbord/services/api.dart';
import 'package:flutter/material.dart';



class BaseProvider extends ChangeNotifier {
  Api api = Api();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  void setLoading(bool value) {
    Timer(const Duration(milliseconds: 50), () {
      _isLoading = value;
      notifyListeners();
    });
  }

  void setError(bool value) {
    Timer(const Duration(milliseconds: 50), () {
      _isError = value;
      notifyListeners();
    });
  }
}
