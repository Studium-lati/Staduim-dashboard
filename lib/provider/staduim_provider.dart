import 'dart:convert';
import 'package:dashbord/models/staduim_model.dart';
import 'package:dashbord/provider/base_provider.dart';
import 'package:http/http.dart';


class StaduimProvider extends BaseProvider {
  List<StadiumsModel> stadiums = [];
  List<StadiumsModel> beststadiums = [];
  int? selectedStadiumId;

  
  Future getStaduim() async {
    stadiums.clear();
    setLoading(true);
    setError(false);
    Response response = await api.get("stadiums");
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      for (var item in data) {
        stadiums.add(StadiumsModel.fromJson(item));
      }
selectedStadiumId = stadiums[0].id;
      setLoading(false);
      setError(false);
    } else {
      setLoading(false);
      setError(true);
    }
  }
  
}
