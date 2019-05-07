import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class Login extends StatelessWidget
{
  const Login({
    Key key,
    @required this.onSubmit,
    @required this.onRegister,
  }) : super(key:key);

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _pass = new TextEditingController();
  final VoidCallback onSubmit;
  final VoidCallback onRegister;

  String get username => _user.text;
  String get password => _pass.text;

  Widget build(BuildContext context)
  {
    return new Container(
      child: new Center(
      child: new Column(
       children: <Widget>[
         new TextField(controller: _user, decoration: const InputDecoration(hintText: "Enter your username"), obscureText: false,),
         new TextField(controller: _pass, decoration: const InputDecoration(hintText: "Enter your password"), obscureText: true,),
         new Row(
           children: <Widget>[
             new RaisedButton(child: new Text("Login"),onPressed: onSubmit,padding: EdgeInsets.all((20.0)),color: Colors.blue,),
             new RaisedButton(child: new Text("Register"),onPressed: onRegister,padding: EdgeInsets.all(20.0),color: Colors.blue,),
           ]
         ),
       ],
      ),
      ),
    );
  }
}