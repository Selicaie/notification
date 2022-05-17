import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../main.dart';



class Home_controller extends GetxController{

  RxList<String> images_url = [
    'https://image.freepik.com/free-vector/maintenance-concept-illustration_114360-391.jpg',
    'https://toppng.com/uploads/preview/warning-stamp-11523434397pugy48eeay.png',
    'https://cdn3.vectorstock.com/i/1000x1000/18/37/breaking-news-concept-design-for-tv-channels-vector-19721837.jpg',
    'http://assets.rappler.com/612F469A6EA84F6BAE882D2B94A4B421/img/ADE59C30DBD44D2FB98B1496E93DECAD/smart-extra-work-hours.jpg',
    'https://ca-times.brightspotcdn.com/dims4/default/bc3e00d/2147483647/strip/true/crop/6500x4565+0+0/resize/840x590!/format/webp/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F69%2F42%2Fa9b2b3db43e58426f0002322f65c%2Fla-tr-travel-flyguy-20191222-04.jpg'
  ].obs;
  RxString selected_imge=''.obs;


  String token = 'key=AAAAcbuXX4w:APA91bGUzIXbqIYKnKlNKHQptujsnAp9BS1QkJBX-W7e8UZlEH7QkLKNLYwONFPI72AhAKg_NJdzc-tcMBxfxS0gqRtzwgbnDeO4XC5-T6mDZvKLj7CTMNxCn_sg5skyquAfyNZcH7Gg';


  @override
  void onInit() {
    fcm_forward_notification();
  }


  fcm_forward_notification(){

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        // print('Message also contained a notification: ${message.data['image'].runtimeType}');
      }

      String decode_data = jsonEncode(message.data);
      scheduleAlarm(message.notification!.body!, message.notification!.title!,decode_data);

    });
  }

  push_notification_topic(data_body,data_title) async {
    Map<String,dynamic> body = {
      "condition" : "'tt' in topics",
      "notification" : {
        "body" : 'data_body',
        "title": data_title,
        "image":selected_imge.value,
        "sound":"default"
      },
      "data" : {
        "body" : data_body,
        "title": data_title,
        "image":selected_imge.value

      }
    };
    final response = await Dio().post('https://fcm.googleapis.com/fcm/send',data: body
        ,options: Options(headers:{'Authorization':token} ));

    //print('response_data ${response.data}');
  }


  int temp = 0 ;
  void scheduleAlarm(String body,String title,String data) async {

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'CHATbj',
      'Chatsnn',
      //icon: 'app_logo',
      playSound: true,
      //sound:RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      // largeIcon: DrawableResourceAndroidBitmap('icon'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      // sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics,iOS: iOSPlatformChannelSpecifics);
    temp++;
    await flutterLocalNotificationsPlugin.show(temp, title, body, platformChannelSpecifics, payload: data);

  }


}








