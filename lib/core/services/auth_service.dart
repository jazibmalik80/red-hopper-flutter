// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bot_toast/bot_toast.dart';
import 'package:redhopper_app/core/models/auth/login_success.dart';
import 'package:redhopper_app/core/services/endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  Future<bool> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var response = await http.post(Uri.parse("$baseUrl/$routeLogin"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email,
            "password": password,
          }));
      if (response.statusCode == 200) {
        LoginSuccess? loginSuccess =
            LoginSuccess.fromJson(jsonDecode(response.body));

        SharedPreferences sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString(
            'access_token', loginSuccess.logintoken!.accessToken ?? "");

        return true;
      } else {
        BotToast.showText(text: "Invalid Credentials");
        return false;
      }
    } else {
      BotToast.showText(text: "Please Fill all fields");
      return false;
    }
  }

  Future Melogin(String token) async {
    if (token.isNotEmpty) {
      var response = await http.get(
        Uri.parse("$baseUrl/$routeMe"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        return true;
      }
    } else {
      BotToast.showText(text: "User Not Signed In");
      return false;
    }
  }
}
