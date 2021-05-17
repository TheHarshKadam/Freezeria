//THIS IS WRAPPER CODE
//It decides on which page user should be prompted
//If email-password correct it pushes user on home page else authentication page

import 'package:flutter/material.dart';
import 'package:freezeria/Screens/Home/home.dart';
import 'package:freezeria/Screens/authenticate/authenticate.dart';
import 'package:freezeria/req_info/user.dart';
import 'package:provider/provider.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final receiveUser = Provider.of<User>(context);
    print(receiveUser);
    
    if (receiveUser == null) {
      return authenticate();
    } else {
      return home();
    }
  }
}
