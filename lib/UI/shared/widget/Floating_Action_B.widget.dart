import 'package:alnoormanment/DAL/model/ads/ad_body.dart';
import 'package:alnoormanment/UI/ad/ad_new_screen.dart';
import 'package:flutter/material.dart';
import '../thems.dart';

class FloatingActionBar extends StatefulWidget {
  final VoidCallback? onPressed;
 const FloatingActionBar ({Key? key, this.onPressed,

  }) : super(key: key);

  @override
  _FloatingActionBarState createState() => _FloatingActionBarState();
}

class _FloatingActionBarState extends State<FloatingActionBar> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      child: Icon(
        Icons.add,
        color: ColorPlatform.colorgrey,
      ),
      backgroundColor: ColorPlatform.golden,
    );
  }
}
