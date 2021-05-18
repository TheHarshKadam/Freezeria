//This code for linking user with database

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezeria/req_info/shakes.dart';

class Database {
  final String uid;
  Database({this.uid});

  final CollectionReference freezeriaShakes =
      Firestore.instance.collection('shakes');

  Future updateData(String CupSize, String Name, int Blend, String Flavour,
      String mix, String Cream, String syrup, String Toppings) async {
    return await freezeriaShakes.document(uid).setData({
      'Cup Size': CupSize,
      'Name': Name,
      'Blend': Blend,
      'Flavour': Flavour,
      'Cream': Cream,
      'Toppings': Toppings
    });
  }

  Stream<List<frezzeriaShakes>> get shakes {
    return freezeriaShakes.snapshots().map(_listofShakesAttributes);
  }

  List<frezzeriaShakes> _listofShakesAttributes(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return frezzeriaShakes(
        Name : doc.data['Name']?? ' ',
        CupSize : doc.data['Cup Size']?? ' ',
        Blend : doc.data['Blend']?? '0',
        Flavour : doc.data['Flavour']?? ' ',
        Cream : doc.data['Cream']?? ' ',
        Toppings : doc.data['Toppings']?? ' ',
      );
    }).toList();
  }
}
