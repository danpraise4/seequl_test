import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seequl/core/provider/ToShowProvider.dart';
import 'package:seequl/core/resources/constants.dart';
import 'package:seequl/core/resources/enums.dart';
import 'package:seequl/core/resources/strings.dart';
import 'package:seequl/core/seequl/theme.dart';
import 'package:seequl/features/timeline/app/widget/post_reaction_widget.dart';
import 'package:seequl/features/timeline/app/widget/profile_image_widget.dart';
import 'package:seequl/features/timeline/app/widget/read_more_widget.dart';
import 'package:seequl/features/timeline/data/models/post.model.dart';
import 'package:video_player/video_player.dart';

class MediaDisplayBox extends StatefulWidget {
  final int index;
  final Post post;
  final void Function(PostAction, Post) onAction;

  const MediaDisplayBox({
    super.key,
    required this.post,
    required this.index,
    required this.onAction,
  });

  @override
  State<MediaDisplayBox> createState() => _MediaDisplayBoxState();
}

class _MediaDisplayBoxState extends State<MediaDisplayBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late MediaType type;
  VideoPlayerController? _controller;
  final fadeTween = Tween<double>(begin: 1, end: 0);
  final scaleTween = Tween<double>(begin: 0, end: 2.5);
  bool initialized = false;
  bool isPlaying = true;
  late Post post;

  @override
  void initState() {
    super.initState();
    post = widget.post;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    type = widget.post.media![widget.index].type!;
    if (type == MediaType.video) {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.post.media![widget.index].url!),
        videoPlayerOptions: VideoPlayerOptions(),
      )..initialize().then((value) async {
          _controller
            ?..play()
            ..setLooping(true);
          setState(() {
            initialized = true;
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool show = context.watch<ToShowProvider>().show ?? true;
    print(show);
    return Stack(
      children: [
        SizedBox(
          child: type == MediaType.video
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: playPauseGesture,
                      child: SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: _controller?.value.size.width ?? 0,
                            height: _controller?.value.size.height ?? 0,
                            child: VideoPlayer(_controller!),
                          ),
                        ),
                      ),
                    ),
                    !initialized
                        ? const Center(
                            child: SizedBox.square(
                              dimension: 30.0,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : const SizedBox.shrink(),
                    FadeTransition(
                      opacity: fadeTween.animate(_animationController),
                      child: ScaleTransition(
                        scale: scaleTween.animate(_animationController),
                        child: Icon(
                          isPlaying ? Icons.play_arrow_rounded : Icons.pause,
                          size: 80,
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CachedNetworkImage(
                    imageUrl: widget.post.media![widget.index].url!,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 240.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black87,
                  Colors.black54,
                  Colors.black26,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        show
            ? Positioned(
                bottom: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      top: 24.0, left: 15.0, right: 70.0, bottom: 20),
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.redAccent.shade100.withOpacity(.3),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Palette.textColor.withOpacity(.5))),
                        child: ExpandableText(
                          post.text ?? '',
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox(),

        //Side Buttons

        !show
            ? Positioned(
                bottom: 50,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<ToShowProvider>(context, listen: false)
                            .updateAccountProvider(true);
                      },
                      child: Transform.rotate(
                        angle: 3.2,
                        child: Image.asset(
                          '$imagePath/im_actions.png',
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //* Horizontal Spacer
                    const SizedBox(width: 15.0),
                  ],
                ),
              )
            : const SizedBox(),
        show
            ? Positioned(
                bottom: 50,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          ProfileImage(),
                          h10,
                          SideReactionButton(
                            icon: 'im_ac_1',
                            onTap: () => widget.onAction(
                                PostAction.comment, widget.post),
                          ),
                          SideReactionButton(
                            icon: 'im_ac_4',
                            count: '45k',
                            onTap: () => widget.onAction(
                                PostAction.comment, widget.post),
                          ),
                          SideReactionButton(
                            icon: 'im_ac_2',
                            count: '45k',
                            onTap: () =>
                                widget.onAction(PostAction.like, widget.post),
                          ),
                          SideReactionButton(
                            icon: 'im_ac_3',
                            onTap: () =>
                                widget.onAction(PostAction.share, widget.post),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Provider.of<ToShowProvider>(context, listen: false)
                            .updateAccountProvider(false);
                      },
                      child: Image.asset(
                        '$imagePath/im_actions.png',
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //* Horizontal Spacer
                    const SizedBox(width: 15.0),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }

  void playPauseGesture() {
    if (isPlaying) {
      _controller?.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      _controller?.play();
      setState(() {
        isPlaying = true;
      });
    }

    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
