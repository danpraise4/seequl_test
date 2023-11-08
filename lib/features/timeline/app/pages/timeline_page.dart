import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:seequl/core/resources/enums.dart';
import 'package:seequl/core/resources/strings.dart';
import 'package:seequl/core/seequl/theme.dart';
import 'package:seequl/features/timeline/app/widget/media_widget.dart';
import 'package:seequl/features/timeline/app/widget/comment_view_widget.dart';
import 'package:seequl/features/timeline/data/constants/constants.dart';
import 'package:seequl/features/timeline/data/models/post.model.dart';

class TimelineFullView extends StatefulWidget {
  const TimelineFullView({
    super.key,
  });

  @override
  State<TimelineFullView> createState() => _TimelineFullViewState();
}

class _TimelineFullViewState extends State<TimelineFullView> {
  late PageController pageController;
  CustomPopupMenuController _controller = CustomPopupMenuController();

  List<Post> posts = [];
  late List menuItems = [
    {"name": "Post a Seequl", "image": "ac_t_1"},
    {"name": "View your likes", "image": "ac_t_2"},
    {"name": "Your Seequl posts", "image": "ac_t_3"},
    {"name": "Reference contribution", "image": "ac_t_4"},
    {"name": "Hashtag challenges", "image": "ac_t_5"},
    {"name": "Notifications", "image": "ac_t_6"},
    {"name": "About SeeQul", "image": "ac_t_7"},
  ];
  late int postIndex;

  @override
  void initState() {
    super.initState();

    posts = getPosts;
    postIndex = 0;

    pageController = PageController(
      initialPage: postIndex,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: PageView.builder(
          controller: pageController,
          itemCount: posts.length,
          scrollDirection: Axis.vertical,
          scrollBehavior: const ScrollBehavior(),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: PageView.builder(
                    itemCount: posts[index].media?.length,
                    itemBuilder: (context, i) {
                      final post = posts[index];
                      return MediaDisplayBox(
                        index: i,
                        post: post,
                        onAction: handlePostAction,
                      );
                    },
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: CustomPopupMenu(
                        menuBuilder: () => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.white,
                            child: IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: menuItems
                                    .map(
                                      (item) => GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () {
                                          _controller.hideMenu();
                                        },
                                        child: Container(
                                          height: 40,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset(
                                                '$imagePath/${item['image']}.png',
                                                width: 20,
                                                height: 20,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  child: Text(
                                                    item['name'],
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        pressType: PressType.singleClick,
                        verticalMargin: -10,
                        controller: _controller,
                        child: Container(
                          child: Icon(Icons.menu, color: Colors.black),
                          padding: EdgeInsets.all(10),
                        ),
                      ),
                    )),
              ],
            );
          },
        ));
  }

  Future<void> handlePostAction(p0, post) async {
    switch (p0) {
      case PostAction.like:
        break;
      case PostAction.comment:
        await showCommentsView(
          context,
          post,
          onUpdate: (p0) {},
        );
        break;
      default:
        break;
    }
  }

  Future<dynamic> showCommentsView(
    BuildContext context,
    Post post, {
    void Function(Post)? onUpdate,
  }) async {
    return await showModalBottomSheet(
      context: context,
      backgroundColor: Palette.white,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: BoxConstraints.loose(
        Size(MediaQuery.of(context).size.width, 600),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return CommentsView(
          post: post,
        );
      },
    );
  }
}
