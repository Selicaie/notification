import 'package:get/get.dart';
import 'package:notification/model/profile_info_model.dart';



class Profile_info_controller extends GetxController{


  Profile_info_model model = Profile_info_model.fromJson(
      {"Employee_no":3013,"emp_aname":"اسامه محمد عبده شبكه","manager_id":846,"manager":"محمود فتحى عثمان على",
        "emp_org":"ا.ع للبنية الاساسية وتامين المعلومات","org_2":"ا.م لنظم المعلومات والتحول الرقمى",
        "org_3":"الوكيل الدائم"}
  );


  get_data(){

  }


}