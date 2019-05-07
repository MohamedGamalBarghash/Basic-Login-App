import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class Register extends StatelessWidget
{
  const Register({
    Key key,
    @required this.onRegister,
  }) : super(key:key);

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();
  static final TextEditingController _passConfirm = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
  final VoidCallback onRegister;

  String get username => _user.text;
  String get password => _pass.text;
  String get confirmedPass => _passConfirm.text;
  String get email => _email.text;

  Widget build(BuildContext context)
  {
    return new Container(
      child: new Center(
        child: new Column(
          children: <Widget>[
                new TextField(controller: _user, decoration: const InputDecoration(hintText: "Type your username"),),
                new TextField(controller: _pass, decoration: const InputDecoration(hintText: "Type your password"),obscureText: true,),
                new TextField(controller: _passConfirm, decoration: const InputDecoration(hintText: "Confirm your password"),obscureText: true,),
                new TextField(controller: _email, decoration: const InputDecoration(hintText: "Type your e-mail"),obscureText: false,),
                new RaisedButton(child: new Text("Register"),color: Colors.blue,onPressed: onRegister,),
          ],
        ),
      ),
    );
  }
}