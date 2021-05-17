//THIS IS AUTHENTICATION CODE
//It decides weather user is New user or Exsisting User
//Existing user will able to Sign in, New User will need to Register

import 'package:flutter/material.dart';
import 'package:freezeria/Screens/authenticate/register.dart';
import 'package:freezeria/Screens/authenticate/sign_in.dart';

class authenticate extends StatefulWidget {
   
  @override
  _authenticateState createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {

  bool showSignIn_pg = true;
  void toggleview() {
    setState(() {
      return showSignIn_pg = !showSignIn_pg;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn_pg) {
      return signin(toggle : toggleview);
    } else {
      return newuserRegister(toggle : toggleview);
    }
  }
}
