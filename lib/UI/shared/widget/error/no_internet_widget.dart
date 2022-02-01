import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onPressed;

  const NoInternetWidget({required this.message, required this.onPressed})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: ColorPlatform.golden,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 35,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width / 35),
          RaisedButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(MediaQuery.of(context).size.width / 41),
            ),
            icon: Icon(Icons.wifi),
            onPressed: onPressed,
            label: Text('حاول مجدداً',),
          ),
        ],
      ),
    );
  }
}
