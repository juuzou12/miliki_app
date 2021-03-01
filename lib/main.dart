import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'Functions/AppModel.dart';
import 'Pages/ChangePassword.dart';
import 'Pages/Dashboard.dart';
import 'Pages/DeviceInspection.dart';
import 'Pages/ForgotPassword.dart';
import 'Pages/LoginPage.dart';
import 'Pages/OtpPage.dart';
import 'Pages/PinPad.dart';
import 'Pages/Splashscreen.dart';
import 'Pages/VerificationPage.dart';
import 'Pages/SupportPage.dart';
import 'Pages/SuccesfullPage.dart';
import 'Pages/QRScannerPage.dart';
import 'Pages/InboxPage.dart';
import 'Pages/AssignDevice.dart';
import 'Pages/TaxpayerOnboarding.dart';
import 'Pages/NewTaskPage.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppModel>(AppModel());
}

void main() {
  setup();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Splashscreen(),
        "/LoginPage": (context) => LoginPage(),
        "/ForgotPassword": (context) => ForgotPassword(),
        "/PinPad": (context) => PinPad(),
        "/Dashboard": (context) => Dashboard(),
        "/OtpPage": (context) => OtpPage(),
        "/ChangePassword": (context) => ChangePassword(),
        "/VerificationPage": (context) => VerificationPage(),
        "/SupportPage": (context) => SupportPage(),
        "/SuccesfullPage": (context) => SuccesfullPage(),
        "/InboxPage": (context) => InboxPage(),
        "/TaxpayerOnboarding": (context) => TaxpayerOnboarding(),
        "/AssignDevice": (context) => AssignDevice(),
        "/NewTaskPage": (context) => NewTaskPage(),
        "/QRScannerPage": (context) => QRScannerPage(),
        "/DeviceInspection": (context) => DeviceInspection(),
      },
    );
  }
}
