import 'package:get/get.dart';
import 'package:notification/controller/main_controller.dart';




class Notification_info_controller extends GetxController{

  RxMap data={}.obs;

  @override
  void onInit() {
    get_data();
    super.onInit();
  }


  get_data(){
    Main_controller controller = Get.find();
    data.value = controller.data;
  }


}