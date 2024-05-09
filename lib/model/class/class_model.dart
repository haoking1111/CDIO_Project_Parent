class Class {
  int? id;
  String? name;

  Class({
    this.id,
    this.name,
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      name: json['name'],
    );
  }
}
