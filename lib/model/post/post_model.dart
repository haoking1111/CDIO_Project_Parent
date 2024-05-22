class Post {
  int? id;
  String? image;
  String? title;
  String? content;
  int? createdYear;
  int? createdMonth;
  int? createdDay;

  Post({
    this.id,
    this.image,
    this.title,
    this.content,
    this.createdYear,
    this.createdMonth,
    this.createdDay,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      image: json['image'],
      title: json['title'],
      content: json['content'],
      createdYear: json['postDate'][0] is String ? int.parse(json['postDate'][0]) : json['postDate'][0],
      createdMonth: json['postDate'][1] is String ? int.parse(json['postDate'][1]) : json['postDate'][1],
      createdDay: json['postDate'][2] is String ? int.parse(json['postDate'][2]) : json['postDate'][2],
    );
  }
}