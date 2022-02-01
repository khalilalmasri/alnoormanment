import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:alnoormanment/UI/shared/widget/progress/progress.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({required this.image,required this.width});

  final String image;
  final double width;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          width:width,
          fit: BoxFit.fitHeight,
          imageUrl: image,
          placeholder: (context, url) => LoadingIndicator(),
          errorWidget: (context, url, error) => ErrorImage(),
        ),
      ),
    );
  }
}
