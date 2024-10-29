import 'package:dashbord/models/event_model.dart';
import 'package:dashbord/provider/base_provider.dart';

class EventProvider  extends BaseProvider{

  EventModel event =EventModel();
  Future<bool> addEvent() async {
  
    setLoading(true);
   
      final  response = await api.post('events', event.toJson());
      if(response.statusCode == 200){
        setLoading(false);
        return true;
      }
      
    setLoading(false);
    return false;

  }
}
