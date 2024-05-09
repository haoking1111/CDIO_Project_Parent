class User {
  int userId;
  String accessToken;

  User({
    required this.userId,
    required this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] is String ? int.parse(json['userId']) : json['userId'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() => {
    'userId': userId.toString(),
    'accessToken' : accessToken,
  };
}