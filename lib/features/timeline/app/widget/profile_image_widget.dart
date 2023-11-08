// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seequl/features/timeline/data/constants/constants.dart';

class ProfileImage extends StatelessWidget {
  double size;
  ProfileImage({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: CachedNetworkImage(
        width: size,
        height: size,
        imageUrl: profileImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
