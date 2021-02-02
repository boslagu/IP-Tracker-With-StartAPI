
class User {
  int UserID;
  String Name;
  String Username;
  String Role;
  String Password;

  User({ this.UserID, this.Name, this.Username, this.Role, this.Password});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      UserID : int.parse(json["id"]) as int,
      Name : json["name"] as String,
      Username : json["username"] as String,
      Role : json["role"] as String,
      Password : json["password"] as String,
    );
  }
}