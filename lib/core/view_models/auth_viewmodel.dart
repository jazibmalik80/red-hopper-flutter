// ignore_for_file: non_constant_identifier_names, avoid_print, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/services/auth_service.dart';
import 'package:redhopper_app/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  AuthenticationService authservice = locator<AuthenticationService>();
  viewState view_State = viewState.idle;
  AUTH_STATES auth_states = AUTH_STATES.LoggedOut;
  bool? loginSuccess;
  bool? loginMeSuccess;

  Future LoginAuthentication(String email, String Password) async {
    print('Login Authenticating');
    view_State = viewState.busy;
    notifyListeners();

    loginSuccess = await authservice.login(email, Password);
    view_State = viewState.idle;
    notifyListeners();
    print("Login Successfull");
  }

  Future loadParticipantProfile() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String loggedInUserToken = sharedPref.getString("access_token") ?? "";
    if (loggedInUserToken.isNotEmpty) {
      auth_states = AUTH_STATES.LoggingIn;
      loginMeSuccess = await authservice.Melogin(loggedInUserToken);
      notifyListeners();
    } else {
      auth_states = AUTH_STATES.LoggedOut;
      notifyListeners();
    }
  }

  Future logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("access_token", "");
    auth_states = AUTH_STATES.LoggedOut;
    notifyListeners();
  }
}
