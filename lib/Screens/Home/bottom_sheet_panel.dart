//This is bottom sheet code with drop down menu

import 'package:flutter/material.dart';
import 'package:freezeria/common_code/common.dart';

class bottomSheetPanel extends StatefulWidget {
  @override
  _bottomSheetPanelState createState() => _bottomSheetPanelState();
}

class _bottomSheetPanelState extends State<bottomSheetPanel> {
  final _formkey = GlobalKey<FormState>();
  final List<String> blending = ['1', '2', '3', '4', '5'];
  final List<String> cupsize = ['Select', 'Small', 'Medium', 'Large'];
  String _flavour = 'Select';
  final List<String> flavour = [
    'Chocolate',
    'Vanilla',
    'Strawberry',
    'Blueberry',
    'Raspberry',
    'Kiwi',
        'Select'
  ];
  final List<String> cream = [
    'Whipped',
    'Caramel',
    'Chocolate',
    'Strawberry',
        'Select'
  ];
  final List<String> toppings = [
    'Oreo',
    'Cherry',
    'Strawberry',
    'Sweet Lime',
    'Waffle',
    'Blackberries',
        'Select'
  ];

  String _currentName;
  String _currentCupSize;
  String _currentBlend;
  String _currentFlavour;
  String _currentCream;
  String _currentToppings;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Update Your Data",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: decorationCode.copyWith(hintText: 'Enter your name'),
              validator: (val) => val.isEmpty ? 'Please enter a name' : null,
              onChanged: (val) => setState(() {
                return _currentName = val;
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              value: _currentCupSize ?? 'Select',
              items: cupsize.map((size) {
                return DropdownMenuItem(
                  value: size,
                  child: Text('$size Size'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                return _currentCupSize = val;
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              value: _currentFlavour ?? 'Select',
              items: flavour.map((flav) {
                return DropdownMenuItem(
                  value: flav,
                  child: Text('$flav Flavour'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                return _currentFlavour = val;
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              value: _currentCream ?? 'Select',
              items: cream.map((crem) {
                return DropdownMenuItem(
                  value: crem,
                  child: Text('$crem Cream'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                return _currentCream = val;
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButtonFormField(
              value: _currentToppings ?? 'Select',
              items: toppings.map((top) {
                return DropdownMenuItem(
                  value: top,
                  child: Text('$top Toppings'),
                );
              }).toList(),
              onChanged: (val) => setState(() {
                return _currentFlavour = val;
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () async {
                print(_currentName);
                print(_currentBlend);
                print(_currentCupSize);
                print(_currentFlavour);
                print(_currentToppings);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple[300]),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text(
                'UPDATE',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
