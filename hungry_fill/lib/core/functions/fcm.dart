
 

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessageServices {
  
  final fireBaseMsgInstance =  FirebaseMessaging.instance;

  initializeFcm() async{

     await fireBaseMsgInstance.requestPermission();
    
    var fcmToken = await fireBaseMsgInstance.getToken();

    debugPrint('token : $fcmToken');
     
    // FirebaseMessaging.onBackgroundMessage(handleNotification);

    FirebaseMessaging.onMessage.listen((RemoteMessage event) async{
     await  NotificationService().showNotificationo(title: event.notification!.title ?? 'Hungry fill', body: 'background working');
    },);
     
  }
}

Future<void> handleNotification(RemoteMessage remotMessage)async{}

class NotificationService{
  
  final localNotificationPlugin =   FlutterLocalNotificationsPlugin();
   
  Future<void> initializeNotification()async{

    const initSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettings = InitializationSettings(
      android: initSettingsAndroid
    );
    
    await localNotificationPlugin.initialize(initSettings);
     
  }

  NotificationDetails notificationDetails(){
    const notificationDetail = NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id', 'daily channel',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high
        ),
    );
    return notificationDetail;
  }

  Future<void> showNotificationo({id = 0, required String title, required String body})async{
    return localNotificationPlugin.show(
      id, title, body,
       notificationDetails()
      );
  }
}