import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;
  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  FirebaseAuth auth = FirebaseAuth.instance;


  Future <void> init() async{
    await Firebase.initializeApp();
    if(!_initialized){
      _firebaseMessaging.requestPermission();
      //_firebaseMessaging.c;
      String? token = await _firebaseMessaging.getToken();
      print("Este es el token: ");
      print(token);
      _initialized = true;
    }
  }

}
