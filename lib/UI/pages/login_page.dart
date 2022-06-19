// ignore_for_file: prefer_const_constructors

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redhopper_app/UI/pages/homepage.dart';
import 'package:redhopper_app/UI/pages/signup_page.dart';
import 'package:redhopper_app/core/enums/view_state.dart';
import 'package:redhopper_app/core/view_models/auth_viewmodel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/MUN_logo.png',
                      ),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      autofocus: false,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Enter Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      autofocus: false,
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility,
                            color: Colors.grey[600],
                          ),
                          onPressed: toggle,
                        ),
                      ),
                    ),
                    TextButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'FORGOT PASSWORD?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: 40),
                    Consumer<AuthViewModel>(
                      builder: (context, viewmodel, child) =>
                          viewmodel.view_State == viewState.busy
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CupertinoButton(
                                  onPressed: () async {
                                    await viewmodel.LoginAuthentication(
                                        emailController.text,
                                        passwordController.text);
                                    if (viewmodel.loginSuccess == true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                      BotToast.showText(
                                          text: "Login Successful");
                                    }
                                  },
                                  child: Text('Log In'),
                                  color: Colors.blue,
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          CupertinoButton(
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
