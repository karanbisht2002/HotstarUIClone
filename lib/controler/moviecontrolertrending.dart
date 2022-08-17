import 'package:get/get.dart';
import 'package:hotstarui/modal/moviemodaltrending.dart';
import '../services/remoteservicetrending.dart';
class MovieControlerTrending extends GetxController
{
  late Rxn<Moviemodaltrending> fetchdatatr=Rxn<Moviemodaltrending>();
  @override
  void onInit() {
    fetchdatatrending();
    super.onInit();
  }
  var isloading=true.obs;
  void fetchdatatrending() async
  {
    try
    {
      isloading(true);
      var product = await RemoteServiceTrending.fetchdataTrending();
      //isLoading(true);
      if(product!=null)
      {
        fetchdatatr.value=product;
      }
    }
    finally
    {
      isloading(false);
    }

  }
}