class Comments {
  String? fromImage;
  String? from;
  String? to;
  String? time;
  String? text;
  String? likesCount;
  String? commentsCount;

  Comments(
      {this.fromImage,
      this.from,
      this.to,
      this.time,
      this.text,
      this.likesCount,
      this.commentsCount});

  Comments.fromJson(Map<String, dynamic> json) {
    fromImage = json['fromImage'];
    from = json['from'];
    to = json['to'];
    time = json['time'];
    text = json['text'];
    likesCount = json['likesCount'];
    commentsCount = json['commentsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromImage'] = this.fromImage;
    data['from'] = this.from;
    data['to'] = this.to;
    data['time'] = this.time;
    data['text'] = this.text;
    data['likesCount'] = this.likesCount;
    data['commentsCount'] = this.commentsCount;
    return data;
  }
}
