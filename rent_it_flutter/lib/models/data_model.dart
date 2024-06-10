// class LoginAuth {
//   String message;
//   TokenAuth data;

//   LoginAuth({required this.message, required this.data});

//   LoginAuth.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     data = TokenAuth.fromJson(json['data']);
//   }
// }

class LoginAuth {
  String message;
  TokenAuth data;

  LoginAuth({required this.message, required this.data});

  LoginAuth.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        data = TokenAuth.fromJson(json['data']);
}

class TokenAuth {
  String token;

  TokenAuth({required this.token});

  factory TokenAuth.fromJson(Map<String, dynamic> json) {
    return TokenAuth(
      token: json['token'],
    );
  }
  // TokenAuth.fromJson(Map<String, dynamic> data) {
  //   token = data['token'];
  // }
}

// class User