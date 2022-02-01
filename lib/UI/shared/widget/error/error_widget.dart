import 'package:flutter/material.dart';


class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({required this.message}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 35,
          ),
        ),
      ),
    );
  }
}
