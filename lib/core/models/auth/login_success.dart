// ignore_for_file: unnecessary_this, prefer_collection_literals

class LoginSuccess {
  Logintoken? logintoken;

  LoginSuccess({this.logintoken});

  LoginSuccess.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      logintoken = Logintoken.fromJson(json['data']);
    } else {
      logintoken = null;
    }
  }

  Map<String, dynamic> toJson(String body) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.logintoken != null) {
      data['data'] = this.logintoken!.toJson();
    }
    return data;
  }
}

class Logintoken {
  String? accessToken;
  int? expires;
  String? refreshToken;

  Logintoken({this.accessToken, this.expires, this.refreshToken});

  Logintoken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expires = json['expires'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires'] = this.expires;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
