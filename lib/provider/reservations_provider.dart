// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';
import 'package:dashbord/models/reservation_model.dart';
import 'package:dashbord/provider/base_provider.dart';
import 'package:http/http.dart' as http;

class ReservationsProvider extends BaseProvider {
  ReservationsModel reservationsModel = ReservationsModel();

  List<ReservationsModel> reservations = [];
  List<ReservationsModel> reservationsAproved = [];

  Future fetchReservationsApproved(String id) async {
    reservationsAproved.clear();
    setLoading(true);
    setError(false);
    var response = await api
        .get("reservations/status", body: {"status": 'approved', "id": '$id'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      data.forEach((reservation) {
        final Map<String, dynamic> reservationMap =
            Map<String, dynamic>.from(reservation);
        reservationsAproved.add(ReservationsModel.fromJson(reservationMap
            .map((key, value) => MapEntry(key, value.toString()))));
      });

      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }

  Future fetchReservations(String id) async {
    reservations.clear();
    setLoading(true);
    setError(false);
    var response = await api
        .get("reservations/status", body: {"status": "pending", "id": '$id'});
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      data.forEach((reservation) {
        final Map<String, dynamic> reservationMap =
            Map<String, dynamic>.from(reservation);
        reservations.add(ReservationsModel.fromJson(reservationMap
            .map((key, value) => MapEntry(key, value.toString()))));
      });

      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }

  Future<List> reserveStadium() async {
    setLoading(true);
    setError(false);
    // if (kDebugMode) {
    //   print(jsonEncode(reservationsModel.toJson()));
    // }
    http.Response response = await api.post("reservations/stadium", {
      "stadium_id": "${reservationsModel.stadiumId}",
      "date": "${reservationsModel.date}",
      "time": "${reservationsModel.time}",
      "duration": "${reservationsModel.duration}",
      "deposit": "${reservationsModel.deposit}",
    });
    if (response.statusCode == 201) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      return [false, json.decode(response.body)['message']];
    }
  }

  Future approveReservation(String id) async {
    setLoading(true);
    setError(false);
    var response = await api.put("reservations/changeStatus", body: {"id": id});
    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }
}
