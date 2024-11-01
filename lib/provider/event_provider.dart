import 'dart:convert';
import 'package:http/http.dart';

import 'package:dashbord/models/event_model.dart';
import 'package:dashbord/provider/base_provider.dart';

class EventProvider extends BaseProvider {
  List<EventModel> events = [];
  // EventModel event = EventModel();
  // Future<bool> addEvent() async {
  //   setLoading(true);

  //   final response = await api.post('events', event.toJson());
  //   if (response.statusCode == 200) {
  //     setLoading(false);
  //     return true;
  //   }

  //   setLoading(false);
  //   return false;
  // }

  Future getEvent(String id) async {
    events.clear();
    setLoading(true);
    setError(false);
    Response response = await api.get("events/$id");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        events.add(EventModel.fromJson(item));
      }
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }
}
