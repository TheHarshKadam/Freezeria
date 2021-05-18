//This is card template displayed on home screen

import 'package:flutter/material.dart';
import 'package:freezeria/req_info/shakes.dart';

class shakeWidget extends StatelessWidget {
  final frezzeriaShakes widget_shake;
  shakeWidget({this.widget_shake});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey[widget_shake.Blend],
          ),
          title: Text(widget_shake.Name),
          subtitle: Text(
              '${widget_shake.CupSize} cup with ${widget_shake.Flavour} flavour and ${widget_shake.Cream} cream with ${widget_shake.Toppings} toppings'),
        ),
      ),
    );
  }
}
