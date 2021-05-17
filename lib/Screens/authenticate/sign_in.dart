//THIS IS SIGN IN PAGE

import 'package:flutter/material.dart';
import 'package:freezeria/Screens/services/auth.dart';
import 'package:freezeria/common_code/common.dart';
import 'package:freezeria/common_code/loader.dart';

class signin extends StatefulWidget {
  final Function toggle;
  signin({this.toggle});

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  final AuthService _auth = AuthService();
  //This is for valid email id and password input:-
  final _validationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        elevation: 0.0,
        //centerTitle: true,
        title: Text('Sign In To Freezeria!'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person_outlined),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            label: Text(
              'Register',
              style: TextStyle(
                letterSpacing: 0.5,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              widget.toggle();
            },
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _validationFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: decorationCode.copyWith(hintText: 'Email'),
                  validator: (value) => value.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      return email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: decorationCode.copyWith(hintText: 'Password'),
                  validator: (value) => value.length <= 5
                      ? 'Password must be atleast 6 char long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    return password = val;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_validationFormKey.currentState.validate()) {
                      setState(() {
                        return loading = true;
                      });
                      dynamic result =
                          await _auth.signInEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Email Or Password Incorrect';
                          loading = false;
                        });
                      }
                    }
                    // print(email);
                    // print(password);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple[50]),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: Text('Sign In'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
