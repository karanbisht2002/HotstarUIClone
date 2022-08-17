import 'package:hotstarui/modal/moviemodal.dart';
import 'package:http/http.dart' as http;
class RemoteServices
{
  static var client=http.Client();

  static Future<Moviemodal?> fetchdataremote ()async
  {
    var response=await http.get( Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=b446989950f59feffb9d1867bccc84d0&with_genres=35'));

    if( response.statusCode==200)
      {
        // print('jashdhjas');
        // print("hsdjh${response.body}");
        return moviemodalFromJson(response.body);
      }

  }

}