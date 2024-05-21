class CommentForChild {
  int? id;
  String? comment;
  int? postMonth;
  int? childId;

  CommentForChild({this.id, this.comment, this.postMonth, this.childId});

  factory CommentForChild.fromJson(Map<String, dynamic> json) {
    return CommentForChild(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      comment: json['comment'],
      postMonth: json['postMonth'] is String ? int.parse(json['postMonth']) : json['postMonth'],
      childId: json['childId'] is String ? int.parse(json['childId']) : json['childId'],
    );
  }
}
