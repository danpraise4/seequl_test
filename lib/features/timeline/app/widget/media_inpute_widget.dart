// ignore_for_file: must_be_immutable

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:seequl/core/resources/constants.dart';
import 'package:seequl/core/resources/strings.dart';
import 'package:seequl/features/timeline/app/widget/profile_image_widget.dart';

import 'package:flutter/foundation.dart' as foundation;

class SocialImpute extends StatefulWidget {
  SocialImpute({super.key});

  @override
  State<SocialImpute> createState() => _SocialImputeState();
}

class _SocialImputeState extends State<SocialImpute> {
  final _controller = TextEditingController();

  bool emojiShowing = false;

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProfileImage(
              size: 50,
            ),
            w10,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => emojiShowing = !emojiShowing),
                      child: Container(
                        color: Colors.transparent,
                        child: Image.asset(
                          '$imagePath/im_smile.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 55.0,
                      child: TextField(
                        controller: _controller,
                        minLines: 10,
                        maxLines: 15,
                        style:
                            const TextStyle(fontSize: 15.0, color: Colors.grey),
                        cursorOpacityAnimates: false,
                        textInputAction: TextInputAction.send,
                        textCapitalization: TextCapitalization.sentences,
                        onSubmitted: (value) {},
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 18.0,
                            horizontal: 5,
                          ),
                          hintText: 'Add comment.',
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )),
                    Image.asset(
                      '$imagePath/im_send.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Offstage(
          offstage: !emojiShowing,
          child: SizedBox(
              height: 250,
              child: EmojiPicker(
                textEditingController: _controller,
                onBackspacePressed: _onBackspacePressed,
                config: Config(
                  columns: 7,
                  // Issue: https://github.com/flutter/flutter/issues/28894
                  emojiSizeMax: 32 *
                      (foundation.defaultTargetPlatform == TargetPlatform.iOS
                          ? 1.30
                          : 1.0),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  gridPadding: EdgeInsets.zero,
                  initCategory: Category.SMILEYS,
                  bgColor: const Color(0xFFF2F2F2),
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  backspaceColor: Colors.blue,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  enableSkinTones: true,
                  recentTabBehavior: RecentTabBehavior.RECENT,
                  recentsLimit: 28,
                  replaceEmojiOnLimitExceed: false,
                  noRecents: const Text(
                    'No Recents',
                    style: TextStyle(fontSize: 20, color: Colors.black26),
                    textAlign: TextAlign.center,
                  ),
                  loadingIndicator: const SizedBox.shrink(),
                  tabIndicatorAnimDuration: kTabScrollDuration,
                  categoryIcons: const CategoryIcons(),
                  buttonMode: ButtonMode.CUPERTINO,
                  checkPlatformCompatibility: true,
                ),
              )),
        )
      ],
    );
  }
}
