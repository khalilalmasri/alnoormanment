import 'package:flutter/material.dart';


class NoAcceptedUserRoleWidgetWidget extends StatelessWidget {
  final String message;
  final String routeName;

  const NoAcceptedUserRoleWidgetWidget({required this.message,required this.routeName})
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
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width/38,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width/41),
          RaisedButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/41),
            ),
            icon: Icon(Icons.clear),
            onPressed: () => Navigator.pushReplacementNamed(context, routeName),
            label: Text('Close'),
          ),
        ],
      ),
    );
  }
}
