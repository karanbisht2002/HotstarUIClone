import 'package:get/get.dart';
import '../modal/moviemodal.dart';
import '../services/remote_services.dart';

class Moviecontroller extends GetxController
{
  late Rxn<Moviemodal> fetchMovie= Rxn<Moviemodal>();
  var isLoading=true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  void  fetchData() async {
    try
    {
      isLoading(true);
    var product = await RemoteServices.fetchdataremote();
      //isLoading(true);
      if(product!=null)
      {
        fetchMovie.value=product;
      }
    }
    finally
    {
          isLoading(false);
    }

  }
}

