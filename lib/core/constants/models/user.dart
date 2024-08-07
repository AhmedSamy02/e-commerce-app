class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? token;

  User(
      {this.token,
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.email});
  //implement from json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
    );
  }
}
