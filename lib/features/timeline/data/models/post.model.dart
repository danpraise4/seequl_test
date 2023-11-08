import 'package:seequl/features/timeline/data/models/comment.model.dart';
import 'package:seequl/features/timeline/data/models/media.model.dart';

class Post {
  String? text;
  String? postId;
  int? likes;
  int? comments;
  List<Media>? media;
  List<Comments>? commentsData;

  Post(
      {this.text,
      this.postId,
      this.media,
      this.comments,
      this.likes,
      this.commentsData});

  Post.fromJson(Map json) {
    text = json['text'];
    likes = json['likes'];
    comments = json['comments'];
    postId = json['post_id'];
    if (json['comments'] != null) {
      commentsData = <Comments>[];
      json['comments'].forEach((v) {
        commentsData!.add(Comments.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map toJson() {
    final Map data = {};
    data['text'] = text;
    data['comments'] = comments;
    data['likes'] = likes;
    data['post_id'] = postId;
    if (comments != null) {
      data['comments'] = commentsData!.map((v) => v.toJson()).toList();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
