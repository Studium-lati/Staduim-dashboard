import 'dart:convert';
import 'package:dashbord/models/reservation_model.dart';
import 'package:dashbord/provider/base_provider.dart';
import 'package:http/http.dart' as http;


class ReservationsProvider extends BaseProvider {
  ReservationsModle reservationsModel = ReservationsModle();


  List<ReservationsModle> reservations = [];
  List<ReservationsModle> get getReservations => reservations;
  Future<void> fetchReservations() async {
    setLoading(true);
    setError(false);
    http.Response response = await api.get("reservations");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        reservations.add(ReservationsModle.fromJson(item));
      }
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

}
  