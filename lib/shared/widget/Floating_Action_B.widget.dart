import 'package:flutter/material.dart';
import '../thems.dart';

class Floating_Action_B extends StatefulWidget {
  final String Path;
 const Floating_Action_B ({Key? key,
  required this.Path,
  }) : super(key: key);

  @override
  _Floating_Action_BState createState() => _Floating_Action_BState();
}

class _Floating_Action_BState extends State<Floating_Action_B> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.Path);
      },
      child: Icon(
        Icons.add,
        color: ColorPlatform.colorgrey,
      ),
      backgroundColor: ColorPlatform.golden,
    );
  }
}
