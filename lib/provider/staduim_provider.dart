import 'dart:convert';
import 'package:dashbord/models/staduim_model.dart';
import 'package:dashbord/provider/base_provider.dart';
import 'package:http/http.dart';

class StaduimProvider extends BaseProvider {
  List<StadiumsModel> stadiums = [];
  StadiumsModel? currentStaduim;
  Future getStaduim() async {
    stadiums.clear();
    setLoading(true);
    setError(false);
    Response response = await api.get("stadiums/owner");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (var item in data) {
        stadiums.add(StadiumsModel.fromJson(item));
      }
      currentStaduim = stadiums[0];
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }
}
