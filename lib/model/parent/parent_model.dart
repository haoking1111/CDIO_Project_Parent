class Parent {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? address;


  Parent({
     this.id,
     this.fullName,
     this.phoneNumber,
     this.email,
     this.address,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      address: json['address']
    );
  }
}