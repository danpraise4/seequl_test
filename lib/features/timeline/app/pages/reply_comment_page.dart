import 'package:flutter/material.dart';
import 'package:seequl/core/resources/constants.dart';
import 'package:seequl/core/seequl/theme.dart';
import 'package:seequl/features/timeline/app/widget/media_inpute_widget.dart';
import 'package:seequl/features/timeline/app/widget/single_comment_view_widget.dart';

class ReplayCommentPage extends StatefulWidget {
  const ReplayCommentPage({super.key});

  @override
  State<ReplayCommentPage> createState() => _ReplayCommentPageState();
}

class _ReplayCommentPageState extends State<ReplayCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Palette.background),
                child: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          "Reply",
          style: TextStyle(color: Palette.background),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            h15,
            CommentWidget(
              showReaction: false,
            ),
            SocialImpute()
          ],
        ),
      ),
    );
  }
}
