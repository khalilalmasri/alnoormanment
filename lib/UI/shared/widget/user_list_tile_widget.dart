import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/UI/users/adduser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../thems.dart';
import '../words.dart';
import 'handel_image/image_widget.dart';

class UserListTileWidget extends StatefulWidget {
  final String user_name;
  final String name;
  final String email;
  final String phone;
  final String userRole;
  ValueChanged<bool>? onChange;
  bool? isBlocked;
  final int id;

  UserListTileWidget({
    Key? key,
     this.isBlocked,
    required this.user_name,
    required this.phone,
     this.onChange,
    required this.id,
    required this.name,
    required this.email,
    required this.userRole,
  }) : super(key: key);

  @override
  _UserListTileWidgetState createState() => _UserListTileWidgetState();
}

class _UserListTileWidgetState extends State<UserListTileWidget> {
  bool usr = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 100,
      decoration: BoxDecoration(
        color: ColorPlatform.ColorButton,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, AddUserScreen.routeName,
            arguments: UpdateUserScreenArguments(User(
              id: widget.id,
              userName: widget.user_name,
              isBlocked: widget.isBlocked!,
              phoneNumber: widget.phone,
              userRole: widget.userRole,
              name: widget.name,
              email: widget.email,
            ))),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.user_name,
              style: StylePlatform.Tilestyly,
            ),
            Text(
              widget.phone,
              style: StylePlatform.Tilestyly,
            ),
          ],
        ),
        // subtitle: Text(
        //  "description",
        //   style: StylePlatform.subtitle,
        // ),
        leading:     Switch(
          value: !widget.isBlocked!,
          onChanged:widget.onChange,
          activeColor: ColorPlatform.green,
          inactiveThumbColor: ColorPlatform.red,
          inactiveTrackColor: ColorPlatform.golden,
          activeTrackColor: ColorPlatform.golden,
        ),
        trailing: Container(
            height: 100,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("images/2.png")),
            )),
      ),
    );
  }
}
