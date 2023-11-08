import 'package:seequl/core/resources/enums.dart';
import 'package:seequl/features/timeline/data/models/media.model.dart';
import 'package:seequl/features/timeline/data/models/post.model.dart';

int get EXPANDED_H => 250;
int get EXPANDED_NH => 100;

String get profileImage {
  return 'https://media.istockphoto.com/id/1287400198/photo/beautiful-afro-woman-with-perfect-make-up.jpg?b=1&s=612x612&w=0&k=20&c=PTqPgmj8tKTs3bfyACpso8G4MYrgUl9WYeGRDRTM4r0=';
}

List<Post> get getPosts {
  return [
    Post(
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
        postId: "ss",
        media: [
          Media(
              type: MediaType.image,
              url:
                  'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZpdG5lc3N8ZW58MHx8MHx8fDA%3D')
        ]),
    Post(
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim",
        postId: "addad",
        media: [
          Media(
              type: MediaType.image,
              url:
                  'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg?auto=compress&cs=tinysrgb&w=1600')
        ])
  ];
}
