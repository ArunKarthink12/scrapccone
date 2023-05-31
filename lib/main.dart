import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:zero_scarp/view/livelocation/area.dart';

import 'allpackages.dart';
import 'firebase_options.dart';

final init =
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await init;
}

FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

AndroidNotificationChannel channel =
    const AndroidNotificationChannel('1', 'name', description: "description");

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await init;
  initialized();
  if (Platform.isAndroid) {
    await AndroidFlutterLocalNotificationsPlugin()
        .createNotificationChannel(channel);
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await checkLogin();
  runApp(const MyApp());
}

String? token;
checkLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString(Constants.authToken);
  log('tokeen');
  log(token.toString());
}

initialized() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('launcher_icon');

  IOSInitializationSettings initializationSettingsIOS =
      const IOSInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await notifications.initialize(
    initializationSettings,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {}
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                styleInformation: null,
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage message) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      theme: ThemeData(
        radioTheme: RadioThemeData(
          materialTapTargetSize: MaterialTapTargetSize
              .padded, // increase the size of the tap target for all Radio widgets
        ),
        primarySwatch: Colors.teal,
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.transparent,
        ),
        splashColor: Colors.transparent,
        textTheme: GoogleFonts.jostTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.black,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: token != null ? const HomePage() : const CityScreen()),
    );
  }
}
