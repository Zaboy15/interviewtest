import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakario_app_test/utils/helper/helper.dart';
import 'package:zakario_app_test/utils/widget/buttons.dart';
import 'package:zakario_app_test/views/menu/main_menu.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.always;
  String? email;
  String? password;
  bool _secureText = true;
  bool _isLogin = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _submit() async {
    final form = _loginKey.currentState;
    SharedPreferences _pref = await SharedPreferences.getInstance();

    if (form!.validate()) {
      form.save();

      if (email!.isNotEmpty && password!.isNotEmpty) {
        _isLogin = await _pref.setBool("isLogin", true);
        Navigator.of(context)
            .pushReplacement(new MaterialPageRoute(builder: (_) {
          return new MainMenu();
        }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBarSession);
      }
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.disabled;
      });
    }
  }

  final snackBarSession = SnackBar(
    content: Text("Password atau email belum terisi !"),
    backgroundColor: Colors.red,
    action: SnackBarAction(
      label: "Close",
      textColor: Colors.white,
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(10, 200, 10, 250),
      child: Card(
        child: Form(
          key: _loginKey,
          autovalidateMode: _autovalidateMode,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (e) {
                    if (!e!.contains("@")) {
                      return "Silahkan isi dengan format email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (e) => email = e,
                  decoration: InputDecoration(labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: _secureText,
                  onSaved: (e) => password = e,
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: showHide,
                        icon: Icon(_secureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                ),
              ),
              ButtonPrimaryRounded(
                onPressed: () async {
                  await _submit();
                },
                title: "Login",
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
