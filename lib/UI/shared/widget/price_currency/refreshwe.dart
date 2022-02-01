import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../words.dart';

class Refreshwi extends StatefulWidget {
  final String LastUpdateDate;
  final String LastUpdateTime;

  const Refreshwi({
    Key? key,
    required this.LastUpdateDate,
    required this.LastUpdateTime,
  }) : super(key: key);

  @override
  _RefreshwiState createState() => _RefreshwiState();
}

class _RefreshwiState extends State<Refreshwi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                StringPlatform.finalrefresh,
                style: StylePlatform.StyleTile,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: Text((widget.LastUpdateDate),
                  style:
                      TextStyle(fontSize: 20, color: ColorPlatform.colorwhite)),
            ),
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: Text((widget.LastUpdateTime),
                  style:
                      TextStyle(fontSize: 20, color: ColorPlatform.colorwhite)),
            ),
          ),
        ],
      ),
    );
  }
}
