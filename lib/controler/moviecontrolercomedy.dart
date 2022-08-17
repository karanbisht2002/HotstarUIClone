import 'package:get/get.dart';
import 'package:hotstarui/modal/moviemodalcomedy.dart';
import 'package:hotstarui/services/remoteservicecomedy.dart';

class MovieControlerComedy extends GetxController
{
  late Rxn<Moviemodalcomedy> fetchmoviecomedy=Rxn<Moviemodalcomedy>();
  void fetchdataComedy() async
  {
     var product=await RemoteServiceComedy.fetchdatacomedy();
     if(product!=null)
     {
       fetchmoviecomedy.value=product;
     }
  }
  @override
  void onInit(){
    fetchdataComedy();
    super.onInit();
  }
}