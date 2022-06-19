class LoginCredentials {
  final String identifier;
  final String password;

  LoginCredentials(this.identifier, this.password);

  Map<String, String> toJson() {
    return {'user': identifier, 'password': password};
  }
}
