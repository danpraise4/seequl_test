import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seequl/core/resources/constants.dart';
import 'package:seequl/core/resources/strings.dart';

class SideReactionButton extends StatelessWidget {
  final String icon;
  final Color? color;
  final String? count;
  final VoidCallback onTap;

  const SideReactionButton({
    super.key,
    required this.icon,
    this.color,
    this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Container(
              width: 35.0,
              height: 35.0,
              child: SvgPicture.asset(
                '$svgPath/$icon.svg',
              ),
            ),
            Visibility(
              visible: count != null,
              child: Text(
                count != 0 ? '$count' : '',
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ]),
              ),
            ),
            h15,
          ],
        ),
      ),
    );
  }
}
