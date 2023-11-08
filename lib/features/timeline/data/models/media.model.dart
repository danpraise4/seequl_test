import 'package:seequl/core/resources/enums.dart';

class Media {
  MediaType? type;
  String? url;

  Media({this.type, this.url});

  Media.fromJson(Map json) {
    type = json['type'] == "image" ? MediaType.image : MediaType.video;
    url = json['url'];
  }

  Map toJson() {
    final Map data = {};
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
