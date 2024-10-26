class AuthModel{
  late User? user;
  late String token;
  AuthModel({required this.user, required this.token});
  factory AuthModel.fromJson(Map<String,dynamic> json){
   return AuthModel(
    user: json['user']!= null? User.fromJson(json['user']) : null,
    token:json['token']
   );
  }
}

class User{
  final String email;
  final String name;
  User({required this.email, required this.name});
  factory User.fromJson(Map<String, dynamic>json){
    return User(email:json['email'], name:json['name']);
  }
}
