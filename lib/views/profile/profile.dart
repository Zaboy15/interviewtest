import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakario_app_test/utils/helper/helper.dart';
import 'package:zakario_app_test/utils/widget/buttons.dart';
import 'package:zakario_app_test/views/login/login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _signOut() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var _rememberLogin = _pref.getBool('isLogin') ?? false;
    if (_rememberLogin) {
      _pref.setBool('isLogin', false);
      _pref.clear();
    }
    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
      return new Login();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: 400,
          padding: EdgeInsets.fromLTRB(10, 100, 10, 0),
          child: ButtonPrimaryRounded(
              title: "Sign Out",
              onPressed: () async {
                await _signOut();
              })),
    );
  }
}
