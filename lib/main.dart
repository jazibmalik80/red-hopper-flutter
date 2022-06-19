// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/UI/pages/homebottomnav_view.dart';
import 'package:redhopper_app/UI/pages/login_page.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/view_models/auth_viewmodel.dart';
import 'package:redhopper_app/locator.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  locatorsetup();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel()..loadParticipantProfile(),
      child: MaterialApp(
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<AuthViewModel>(
          builder: (context, viewmodel, child) {
            if (viewmodel.auth_states == AUTH_STATES.LoggingIn) {
              return HomeBottomNavView();
            } else if (viewmodel.auth_states == AUTH_STATES.LoggedOut) {
              return LoginPage();
            } else {
              return LoggingInPage();
            }
          },
        ),
      ),
    );
  }
}

class LoggingInPage extends StatelessWidget {
  const LoggingInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image(
              image: AssetImage(
                "assets/MUN_logo.png",
              ),
              width: 280,
              height: 210,
            ),
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
