class Users{
  late final String uid;

  Users({required this.uid});
}

class UserData{
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({required this.sugars, required this.name,required this.uid, required this.strength});
}