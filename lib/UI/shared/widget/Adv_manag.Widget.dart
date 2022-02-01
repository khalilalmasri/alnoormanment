import 'package:alnoormanment/DAL/model/ads/ad_body.dart';
import 'package:alnoormanment/UI/ad/ad_new_screen.dart';
import 'package:alnoormanment/UI/shared/widget/error/error_image.dart';
import 'package:alnoormanment/UI/shared/widget/progress/loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../thems.dart';
import 'handel_image/image_widget.dart';

class AdWidget extends StatefulWidget {
  final String name;
  final int id;
  final String image;
  final bool isBlocked;

  const AdWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.isBlocked,
    required this.id,
  }) : super(key: key);

  @override
  _AdWidgetState createState() => _AdWidgetState();
}

class _AdWidgetState extends State<AdWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 85,
      decoration: BoxDecoration(
        color: ColorPlatform.ColorButton,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: () =>
          Navigator.pushNamed(context, AddNewAdScreen.routeName,
            arguments: UpdateAdScreenArguments(AdBody(
              id: widget.id,
              name: widget.name,
              image: widget.image,
              isActive: widget.isBlocked,
              link: '',
            ))),
        title: Text(
          widget.name,
          style: StylePlatform.Tilestyly,
        ),
        // subtitle: Text(
        //  "description",
        //   style: StylePlatform.subtitle,
        // ),
        leading: Switch(
          value: widget.isBlocked,
          onChanged: (val) {},
          activeColor: ColorPlatform.green,
          inactiveThumbColor: ColorPlatform.red,
          inactiveTrackColor: ColorPlatform.ColorButton,
          activeTrackColor: ColorPlatform.ColorButton,
        ),
        trailing: ImageWidget(image: widget.image,width:  MediaQuery.of(context).size.width/5),
      ),
    );
  }
}
