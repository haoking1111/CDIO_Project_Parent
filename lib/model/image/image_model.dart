class ImageModel {
  int? id;
  int? createdYear;
  int? createdMonth;
  int? createdDay;
  int? hour;
  int? minute;
  int? second;
  String? image;
  int? childId;

  ImageModel({
    this.id,
    this.createdYear,
    this.createdMonth,
    this.createdDay,
    this.hour,
    this.minute,
    this.second,
    this.image,
    this.childId
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        id: json['id'] is String ? int.parse(json['id']) : json['id'],
        createdYear: json['postedTime'][0] is String ? int.parse(json['postedTime'][0]) : json['postedTime'][0],
        createdMonth: json['postedTime'][1] is String ? int.parse(json['postedTime'][1]) : json['postedTime'][1],
        createdDay: json['postedTime'][2] is String ? int.parse(json['postedTime'][2]) : json['postedTime'][2],
        hour: json['postedTime'][3] is String ? int.parse(json['postedTime'][3]) : json['postedTime'][3],
        minute: json['postedTime'][4] is String ? int.parse(json['postedTime'][4]) : json['postedTime'][4],
        second: json['postedTime'][5] is String ? int.parse(json['postedTime'][5]) : json['postedTime'][5],
        image: json['image'],
        childId: json['childId'] is String ? int.parse(json['childId']) : json['childId']
    );
  }
}