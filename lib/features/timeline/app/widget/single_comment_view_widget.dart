// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:seequl/core/resources/constants.dart';
import 'package:seequl/core/resources/strings.dart';
import 'package:seequl/features/timeline/app/pages/reply_comment_page.dart';
import 'package:seequl/features/timeline/app/widget/profile_image_widget.dart';

class CommentWidget extends StatelessWidget {
  bool showReaction;
  CommentWidget({super.key, this.showReaction = true});

  Widget action({image_name, count}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          '$imagePath/$image_name.png',
          width: 25,
          height: 25,
        ),
        w10,
        count == null
            ? const SizedBox()
            : Text(
                count,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
              )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileImage(
            size: 45,
          ),
          w20,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Kerry john",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        w20,
                        Text(
                          "@Kerryjo",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent.shade700),
                        )
                      ],
                    ),
                    const Text(
                      "3 hours ago",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey),
                    )
                  ],
                ),
                h5,
                Text(
                  " metus purus et purus. Vestibulum 🎈 quis lacinia turpis. Aenean 🌈 id metus eu mauris tincidunt .   Aenean 🌈 id metus eu mauris tincidunt .  ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                ),
                h10,
                showReaction
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.withOpacity(.2)),
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "View 15 replies",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  ),
                                  w10,
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 13,
                                    color: Colors.red,
                                  )
                                ]),
                          ),
                          h10,
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ReplayCommentPage()));
                                  },
                                  child: action(
                                      image_name: 'im_comment', count: "10k")),
                              w30,
                              action(image_name: 'im_like', count: "7k"),
                              w30,
                              action(image_name: 'im_flag')
                            ],
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
