import 'package:flutter/material.dart';
import 'package:seequl/core/resources/constants.dart';
import 'package:seequl/core/seequl/theme.dart';
import 'package:seequl/features/timeline/app/widget/media_inpute_widget.dart';
import 'package:seequl/features/timeline/app/widget/single_comment_view_widget.dart';
import 'package:seequl/features/timeline/data/models/post.model.dart';

class CommentsView extends StatefulWidget {
  final Post post;

  const CommentsView({
    super.key,
    required this.post,
  });

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  final bodyController = TextEditingController();
  bool creating = false;
  bool deleted = false;
  final focusNode = FocusNode();

  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.grey.shade700),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Text(
                    '45k Comments',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            h15,
            Expanded(
              child: ListView.builder(
                itemCount: 20, // (post.commentsData ?? []).length,
                itemBuilder: (context, index) => CommentWidget(),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: SocialImpute()),
            h25,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    bodyController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
