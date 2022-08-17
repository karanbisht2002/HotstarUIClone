import 'package:hotstarui/modal/moviemodaltrending.dart';
import 'package:http/http.dart' as http;

class RemoteServiceTrending 
{
  static var client=http.Client();

  static Future<Moviemodaltrending?> fetchdataTrending () async
  {
    var  response=await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/week?api_key=b446989950f59feffb9d1867bccc84d0'));
    if(response.statusCode==200)
      {
        print('jashdhjas');
        print("hsdjh${response.body}");

        return moviemodaltrendingFromJson(response.body);
      }
  }
}