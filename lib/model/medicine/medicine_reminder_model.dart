class MedicineReminder {
  int? id;
  String? comment;
  String? currentStatus;
  int? childId;
  int? createdYear;
  int? createdMonth;
  int? createdDay;
  int? updateYear;
  int? updateMonth;
  int? updateDay;

  MedicineReminder({
    this.id,
    this.comment,
    this.currentStatus,
    this.childId,
    this.createdYear,
    this.createdMonth,
    this.createdDay,
    this.updateYear,
    this.updateMonth,
    this.updateDay
  });

  factory MedicineReminder.fromJson(Map<String, dynamic> json) {
    return MedicineReminder(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      comment: json['comment'],
      currentStatus: json['currentStatus'] ,
      childId: json['childId'] is String ? int.parse(json['childId']) : json['childId'],
      createdYear: json['createdDate'][0] is String ? int.parse(json['createdDate'][0]) : json['createdDate'][0],
      createdMonth: json['createdDate'][1] is String ? int.parse(json['createdDate'][1]) : json['createdDate'][1],
      createdDay: json['createdDate'][2] is String ? int.parse(json['createdDate'][2]) : json['createdDate'][2],
      updateYear: json['updatedDate'][0] is String ? int.parse(json['updatedDate'][0]) : json['updatedDate'][0],
      updateMonth: json['updatedDate'][1] is String ? int.parse(json['updatedDate'][1]) : json['updatedDate'][1],
      updateDay: json['updatedDate'][2] is String ? int.parse(json['updatedDate'][2]) : json['updatedDate'][2],
    );
  }
}