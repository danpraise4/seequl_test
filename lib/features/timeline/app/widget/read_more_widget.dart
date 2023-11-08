// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seequl/core/resources/constants.dart';
import 'package:seequl/core/resources/strings.dart';
import 'package:seequl/core/seequl/theme.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(this.text);
  final String text;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  bool isExpanded = false;
  late bool isOver150;
  double height = 100;

  @override
  void initState() {
    super.initState();
    isOver150 = widget.text.toString().trim().length >= 150;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          isOver150 && isExpanded
              ? InkWell(
                  onTap: () {
                    setState(() {
                      height = 100;
                      isExpanded = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 10),
                    decoration: BoxDecoration(
                        color: Palette.background.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "...Less",
                          style: GoogleFonts.montserrat(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w500),
                        ),
                        w5,
                        Transform.rotate(
                          angle: 3.1,
                          child: Image.asset(
                            '$imagePath/im_arr_1.png',
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      AnimatedSize(
          duration: const Duration(milliseconds: 500),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 0),
            style: isExpanded
                ? GoogleFonts.montserrat(
                    fontSize: 16, fontWeight: FontWeight.w500)
                : GoogleFonts.montserrat(
                    fontSize: 14, fontWeight: FontWeight.w500),
            child: isOver150
                ? !isExpanded
                    ? Text(
                        widget.text,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        widget.text,
                      )
                : Text(
                    widget.text,
                  ),
          )),
      h15,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "27 Oct. 2020 @5:23pm",
            style: TextStyle(
                color: Colors.red.shade200,
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
          isOver150 && !isExpanded
              ? InkWell(
                  onTap: () {
                    setState(() {
                      height = 200;
                      isExpanded = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 10),
                    decoration: BoxDecoration(
                        color: Palette.background.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Text(
                          "...More",
                          style: GoogleFonts.montserrat(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.w500),
                        ),
                        w5,
                        Image.asset(
                          '$imagePath/im_arr_1.png',
                          height: 20,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      )
    ]);
  }
}
