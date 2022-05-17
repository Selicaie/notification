import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/controller/home_controller.dart';
import 'package:notification/view/profile_info.dart';





class Home extends StatelessWidget{

  Home_controller home_controller = Get.put(Home_controller());

  TextEditingController text_body = TextEditingController();
  TextEditingController text_title = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _Draw_drawer(),
      appBar: AppBar(
        title: Text('title'),
        backgroundColor: Color(0xff005194),
        shadowColor: Colors.black,

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 60,),
              _Draw_drop_down(home_controller),
              SizedBox(height: 30,),
              _Draw_text_field('title', text_title,1),
              SizedBox(height: 30,),
              _Draw_text_field('message', text_body,4),
              SizedBox(height: 40,),
              _Draw_button(home_controller, text_title, text_body)
            ],
          ),
        ),
      ),
    );
  }

}


class _Draw_drawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: ListView(
        children: [

          _Draw_drawer_header(),

          SizedBox(height: 30,),
          _Draw_drawer_items('Employee Info'),
          SizedBox(height: 20,),
          _Draw_drawer_items('Services'),

        ],
      ),
    );
  }

  Widget _Draw_drawer_items(String text){
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        child:Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
            color: Color(0xff013764)),) ,
        onTap: (){
          switch(text){
            case 'Employee Info': Get.to(Profile_info()); break;
          }
        },
      ),
    );
  }

  Widget _Draw_drawer_header(){
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xff005194),//Colors.blue[300],
      ),
      child: Column(
        children: [
          CircleAvatar(backgroundImage:AssetImage('assets/loading.gif'),radius: 50,),
          SizedBox(height: 10,),
          Text('Employee name',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
        ],
      ),
    );
  }

}

class _Draw_text_field extends StatelessWidget{

  TextEditingController text;
  String label;
  int max_line;

  _Draw_text_field(this.label,this.text,this.max_line);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: label
      ),
      maxLines: max_line,
      controller: text,
      textAlign: TextAlign.center,
    );
  }

}

class _Draw_drop_down extends StatelessWidget{

  Home_controller controller ;
  _Draw_drop_down(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>DropdownButton(
      items:  controller.images_url.value.map((val)=>
          DropdownMenuItem(child:Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(val),),value: val,)).toList(),
      hint: const Text('Select image',style: TextStyle(color:Color(0xff005194),fontSize: 20,
          fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ,
      value: controller.selected_imge.value.isEmpty?null:controller.selected_imge.value ,
      icon: const Icon(Icons.arrow_drop_down_circle,color:Color(0xff005194),),
      style: const TextStyle(color:Color(0xff005194),fontSize: 20,
          fontWeight: FontWeight.bold),
      onChanged: (val){
        print(val);
         controller.selected_imge.value = val.toString();
      },
    ));
  }

}

class _Draw_button extends StatelessWidget{

  TextEditingController text_body;
  TextEditingController text_title;
  Home_controller controller;

  _Draw_button(this.controller,this.text_title,this.text_body);

  @override
  Widget build(BuildContext context) {
     return TextButton(
       child: Text('send',style: TextStyle(
         fontWeight: FontWeight.bold,
         color: Colors.white,
         fontSize: 25,
       )),
       onPressed: (){
         controller.push_notification_topic(text_body.text,text_title.text);
       },
       style: ButtonStyle(alignment: Alignment.center,
         backgroundColor: MaterialStateProperty.all<Color>(Color(0xff005194),),
         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
             RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20.0),
             )
         ),
         // textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
         //   fontWeight: FontWeight.bold,
         //   color: Colors.white,
         //   fontSize: 25,
         // )),
         padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10)),
       ),
     );
  }

}