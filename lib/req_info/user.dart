//This User and UserData instance file

class User {
  final String uid;

  User({this.uid});
}

class UserData{
  final String uid;
  final String Name;
  final String CupSize;
  final int Blend;
  final String Flavour;
  final String Cream;
  final String Toppings;

  UserData(
      {this.uid,
      this.Blend,
      this.Cream,
      this.CupSize,
      this.Flavour,
      this.Name,
      this.Toppings});
}
