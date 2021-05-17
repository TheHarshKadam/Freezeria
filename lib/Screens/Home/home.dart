//THIS IS HOME PAGE

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezeria/Screens/Home/bottom_sheet_panel.dart';
import 'package:freezeria/Screens/services/auth.dart';
import 'package:freezeria/Screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:freezeria/Screens/Home/shakesList.dart';
import 'package:freezeria/req_info/shakes.dart';
import 'package:freezeria/common_code/common.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    // void _editMenu() {
    //   showModalBottomSheet(
    //       context: context,
    //       builder: (context) {
    //         return Container(
    //           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
    //           child: Text("This Is Bottom Sheet"),
    //         );
    //       });
    // }

    return StreamProvider<List<frezzeriaShakes>>.value(
      value: Database().shakes,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          title: Text('Freezeria!'),
          centerTitle: true,
          backgroundColor: Colors.purple[400],
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.purple[100],
              ),
              onPressed: () async {
                await _auth.userSignOut();
              },
            ),
            // IconButton(
            //     icon: Icon(Icons.edit,
            //     color: Colors.purple[100],),
            //     onPressed: () {
            //       return _editMenu();
            //     })
          ],
        ),
        body: ShakesList(),
        floatingActionButton: FloatingActionButton(
          elevation: 3.0,
          backgroundColor: Colors.purple[300],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
          child: Icon(Icons.edit),
          onPressed: () {
            return showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                )
              ),
                context: context,
                builder: (context) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                    child: bottomSheetPanel(),
                  );
                });
          },
        ),
      ),
    );
  }
}
