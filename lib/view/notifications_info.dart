import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controller/notification_info_controller.dart';


class notification_info extends StatelessWidget{

  Notification_info_controller info_controller = Get.put(Notification_info_controller());

  @override
  Widget build(BuildContext context) {

    info_controller.get_data();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SizedBox(height: 50,),
              Center(child: Obx(()=>Text(info_controller.data.value['title'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))),
             SizedBox(height: 30,),
             Obx(()=>FadeInImage.assetNetwork(image: info_controller.data.value['image'],
               width: MediaQuery.of(context).size.width,
               height: 200,placeholder: 'assets/loading.gif',
             )),
              SizedBox(height: 30,),
              Obx(()=>Text(info_controller.data.value['body'])),

            ],
          ),
        ),
      ),
    );
  }

}