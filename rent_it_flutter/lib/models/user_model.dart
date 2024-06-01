class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String username;
  final String nim;
  final bool isAdmin;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.username,
    required this.nim,
    required this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      nim: json['nim'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'username': username,
      'nim': nim,
      'isAdmin': isAdmin,
    };
  }
}
