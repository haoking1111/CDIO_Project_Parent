class Teacher {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? address;


  Teacher({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.address,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
        id: json['id'] is String ? int.parse(json['id']) : json['id'],
        fullName: json['fullName'],
        phoneNumber: json['phoneNumber'],
        email: json['email'],
        address: json['address']
    );
  }
}