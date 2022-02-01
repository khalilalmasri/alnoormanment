import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:flutter/material.dart';
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlatform.colorgrey,
        height: MediaQuery.of(context).size.height,
        child: Center(child: CircularProgressIndicator(color: ColorPlatform.golden)));
  }
}

class FullHeightLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: LoadingIndicator());
  }
}

class WhiteLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: ColorPlatform.colorgrey,
    ));
  }
}
