class Notification {
  int? id;
  String? title;
  String? content;
  int? postYear;
  int? postMonth;
  int? postDay;

  Notification({
    this.id,
    this.title,
    this.content,
    this.postYear,
    this.postMonth,
    this.postDay,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      title: json['title'],
      content: json['content'] ,
      postYear: json['postDate'][0] is String ? int.parse(json['postDate'][0]) : json['postDate'][0],
      postMonth: json['postDate'][1] is String ? int.parse(json['postDate'][1]) : json['postDate'][1],
      postDay: json['postDate'][2] is String ? int.parse(json['postDate'][2]) : json['postDate'][2],
    );
  }
}