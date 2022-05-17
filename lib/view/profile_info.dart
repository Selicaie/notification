import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controller/profile_info_controller.dart';



class Profile_info extends StatelessWidget{

  Profile_info_controller profile_controller = Get.put(Profile_info_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30,),
          _Draw_header(profile_controller),
          SizedBox(height: 30,),
          _Draw_text('الاداره',profile_controller.model.empOrg!),
          SizedBox(height: 20,),
          _Draw_text('المدير المباشر',profile_controller.model.manager!),
          SizedBox(height: 20,),
          _Draw_text('الاداره الاعلى 1',profile_controller.model.org2!),
          SizedBox(height: 20,),
          _Draw_text('الاداره الاعلى 2',profile_controller.model.org3!)
        ],
      )
    );
  }

}


class _Draw_header extends StatelessWidget{

  Profile_info_controller profile_controller;
  _Draw_header(this.profile_controller);

  @override
  Widget build(BuildContext context) {
    return Container(width:Get.size.width,height: 120,
        decoration: BoxDecoration(
            color: Color(0xff013764),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)
            )
        ),
        padding: EdgeInsets.only(right: 25),
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('الرقم الوظيفى : '+profile_controller.model.employeeNo!.toString(),
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),
            SizedBox(height: 10,),
            Center(
              child: Text(profile_controller.model.empAname!,
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 25)),
            ),
          ],
        ));
  }

}

class _Draw_text extends StatelessWidget{

  String title;
  String body;
  _Draw_text(this.title,this.body);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff013764),fontSize:18 ),),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 35),
          child: Text(body,
            style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff013764),fontSize: 25),),
        ),
      ],
    );
  }
  
}