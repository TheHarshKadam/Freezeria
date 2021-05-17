import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezeria/req_info/shakes.dart';
import 'package:freezeria/Screens/Home/shake_widget.dart';

class ShakesList extends StatefulWidget {
  @override
  _ShakesListState createState() => _ShakesListState();
}

class _ShakesListState extends State<ShakesList> {
  @override
  Widget build(BuildContext context) {
    final shakes = Provider.of<List<frezzeriaShakes>>(context) ?? [];

    return ListView.builder(
      itemCount: shakes.length,
      itemBuilder: (context, index) {
        return shakeWidget(widget_shake: shakes[index]);
      },
    );
  }
}
 