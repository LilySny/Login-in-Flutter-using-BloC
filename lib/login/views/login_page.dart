import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_app/login/blocs/login_bloc.dart';
import 'package:login_app/shared/blocs/authentication_bloc.dart';
import 'package:login_app/shared/repositories/user_repository.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthenticationBloc _authenticationBloc;
  LoginBloc _loginBloc;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc.getInstance();
    _loginBloc = LoginBloc(UserRepository());

    _loginBloc.currentUser.listen(
      _authenticationBloc.userEvent,
      onError: (e, s) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Deu ruim"),
          content: Text(e.message),
          actions: <Widget>[
            FlatButton(
              child: Text("ok"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (v) => v.contains("@") && v.contains(".")
                      ? null
                      : "The value isn't an",
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                TextFormField(
                  validator: (v) => v.length >= 8 && v.length <= 16
                      ? null
                      : "The password must contain at least 8 characters and in the max 16",
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
