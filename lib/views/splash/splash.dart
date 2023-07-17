import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakario_app_test/views/login/login.dart';
import 'package:zakario_app_test/views/menu/main_menu.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  bool isLoginState = false;

  checkLogin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isLoginState = _pref.getBool("isLogin") ?? false;
    if (isLoginState) {
      menuLaunch();
    } else {
      loginLaunch();
    }
  }

  loginLaunch() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new Login();
      }));
    });
  }

  menuLaunch() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new MainMenu();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(Icons.home),
      ),
    );
  }
}
