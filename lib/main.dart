//THIS IS MAIN FILE

import 'package:flutter/material.dart';
import 'package:freezeria/Screens/services/auth.dart';
import 'package:freezeria/Screens/wrapper.dart';
import 'package:freezeria/req_info/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
    value: AuthService().user,
          initialData: null,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        home: wrapper(),
      ),
    );
  }
}


