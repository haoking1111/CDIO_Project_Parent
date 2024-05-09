class Child {
  int? id;
  String? fullName;
  int? age;
  String? birthDay;
  int? height;
  int? weight;
  bool? gender;
  String? hobby;
  int? parentId;
  int? teacherId;
  int? classroomId;

  Child(
      {this.id,
      this.fullName,
      this.age,
      this.birthDay,
      this.height,
      this.weight,
      this.gender,
      this.hobby,
      this.parentId,
      this.teacherId,
      this.classroomId});

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      fullName: json['fullName'],
      age: json['age'] is String ? int.parse(json['age']) : json['age'],
      birthDay: json['birthDay'],
      height: json['height'] is String ? int.parse(json['height']) : json['height'],
      weight: json['weight'] is String ? int.parse(json['weight']) : json['weight'],
      gender: json['gender'],
      hobby: json['hobby'],
      parentId: json['parentId'] is String ? int.parse(json['parentId']) : json['parentId'],
      teacherId: json['teacherId'] is String ? int.parse(json['teacherId']) : json['teacherId'],
      classroomId: json['classroomId'] is String ? int.parse(json['classroomId']) : json['classroomId'],
    );
  }
}
