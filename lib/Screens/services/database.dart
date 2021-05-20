//This code for linking user with database


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezeria/req_info/shakes.dart';
import 'package:freezeria/req_info/user.dart';

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
        Name: doc.data['Name'] ?? ' ',
        CupSize: doc.data['Cup Size'] ?? ' ',
        Blend: doc.data['Blend'] ?? '0',
        Flavour: doc.data['Flavour'] ?? ' ',
        Cream: doc.data['Cream'] ?? ' ',
        Toppings: doc.data['Toppings'] ?? ' ',
      );
    }).toList();
  }

  Stream<UserData> get userDataStream {
    return freezeriaShakes.document(uid).snapshots()
     .map(_userDatafromsnapshot);
  }

  UserData _userDatafromsnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      Name: snapshot.data['name'],
      CupSize: snapshot.data['cupsize'],
      Blend: snapshot.data['blend'],
      Cream: snapshot.data['cream'],
      Flavour: snapshot.data['flavour'],
      Toppings: snapshot.data['toppings'],
    );
  }
}
