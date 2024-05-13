class Message {
  int? id;
  String? content;
  int? createdYear;
  int? createdMonth;
  int? createdDay;
  int? hour;
  int? minute;
  int? second;
  int? sendUserId;
  int? receiveUserId;

  Message({
    this.id,
    this.content,
    this.createdYear,
    this.createdMonth,
    this.createdDay,
    this.hour,
    this.minute,
    this.second,
    this.sendUserId,
    this.receiveUserId
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      content: json['content'],
      createdYear: json['sendTime'][0] is String ? int.parse(json['sendTime'][0]) : json['sendTime'][0],
      createdMonth: json['sendTime'][1] is String ? int.parse(json['sendTime'][1]) : json['sendTime'][1],
      createdDay: json['sendTime'][2] is String ? int.parse(json['sendTime'][2]) : json['sendTime'][2],
      hour: json['sendTime'][3] is String ? int.parse(json['sendTime'][3]) : json['sendTime'][3],
      minute: json['sendTime'][4] is String ? int.parse(json['sendTime'][4]) : json['sendTime'][4],
      second: json['sendTime'][5] is String ? int.parse(json['sendTime'][5]) : json['sendTime'][5],
      sendUserId: json['sendUserId'] is String ? int.parse(json['sendUserId']) : json['sendUserId'],
      receiveUserId: json['receiveUserId'] is String ? int.parse(json['receiveUserId']) : json['receiveUserId']
    );
  }
}