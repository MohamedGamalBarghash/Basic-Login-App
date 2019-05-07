import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intellij_idea_projects/Settings.dart';
import 'package:intellij_idea_projects/login.dart';
import 'package:intellij_idea_projects/Register.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget
{
  MyApplication createState() => new MyApplication();
}

class MyApplication extends State<MyApp>
{
  String title = "Please login to continue";

  String newUserName;
  String newPass;

  Widget _current;
  Login loginScreen;
  Settings settingsScreen;
  Register registerScreen;

  bool authenticated;

  MyApplication()
  {
    loginScreen = new Login(onSubmit: onSubmit,onRegister: onRegister,);
    settingsScreen = new Settings();
    registerScreen = new Register(onRegister: onRegisterSecond,);
    _current = loginScreen;
  }

  void onHome ()
  {
      if(authenticated == true)
      {
        title = "Welcome $newUserName";
        authentication(true);
        authenticated = true;
      }else{
        title = "Please login to continue";
        authentication(false);
        authenticated = false;
      }
  }

  void logOut()
  {
    if(authenticated == true)
    {
      title = "Please login to continue";
      authentication(false);
      authenticated = false;
    }
  }

  void onSubmit()
  {
    if(loginScreen.username == "admin" && loginScreen.password == "admin")
      {
        authenticated = true;
        authentication(true);
        newUserName = "admin";
      }
    else if(loginScreen.username == newUserName && loginScreen.password == newPass)
    {
      authenticated = true;
      authentication(true);
    }
  }

  void onRegister()
  {
    title = "Register";
    _current = registerScreen;
  }

  void onRegisterSecond()
  {
    if(registerScreen.username != null && registerScreen.password != null && registerScreen.confirmedPass != null && registerScreen.email != null)
      {
        if(registerScreen.password == registerScreen.confirmedPass)
          {
            newUserName = registerScreen.username;
            newPass = registerScreen.password;
            _current = loginScreen;
          }
      }
  }

  void authentication(bool auth)
  {
      if(auth == true)
      {
        title = "Welcome $newUserName";
        _current = settingsScreen;
      }else{
        title = "Please login to continue";
        _current = loginScreen;
      }
  }

  Widget build(BuildContext context)
  {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.home),onPressed: () {onHome();},),
            new IconButton(icon: Icon(Icons.exit_to_app),onPressed: () {logOut();},),
          ],
        ),
        body: _current,
      )
    );
  }
}

