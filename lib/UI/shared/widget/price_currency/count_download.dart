import 'package:alnoormanment/BL/bloc/price_currency/bloc.dart';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:alnoormanment/UI/shared/widget/error/error.dart';
import 'package:alnoormanment/UI/shared/widget/progress/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../words.dart';

class CountDownloadWidget extends StatefulWidget {
  final int countDownload;
  final GestureTapCallback? onTap;

  const CountDownloadWidget({Key? key, required this.countDownload, this.onTap})
      : super(key: key);

  @override
  _CountDownloadWidgetState createState() => _CountDownloadWidgetState();
}

class _CountDownloadWidgetState extends State<CountDownloadWidget> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceCurrencyBloc, PriceCurrencyState>(
        builder: (context, state) {
          if (state is LoadCountDownloadData) {
            return _pageContent();
          } else if (state is PriceCurrencyHasData) {
            return _pageContent();
          } else if (state is PriceCurrencyLoading) {
            return Center(child: LoadingIndicator());
          } else if (state is PriceCurrencyNoInternetConnection) {
            return NoInternetWidget(
              message: StringPlatform.no_internet,
              onPressed: () {
                context.read<PriceCurrencyBloc>().add(LoadCountDownloadData());
              },
            );
          } else
            return Text('no bloc');
        });
  }


  Widget _pageContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: ColorPlatform.ColorCountDownload,
          borderRadius: BorderRadius.circular(5)),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.countDownload.toString(),
            style: CountDownloadWidgetStyle._textStyle,
          ),
          const Text(
            StringPlatform.total_download,
            style: CountDownloadWidgetStyle._textStyle,
          ),
          Container(
            color: ColorPlatform.ColorCountRefreshDownload,
            child: Center(
              child: GestureDetector(
                  onTap: widget.onTap!,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: const [
                      Text(
                        StringPlatform.refresh,
                        style: CountDownloadWidgetStyle._textStyle,
                      ),
                      Icon(
                        Icons.refresh,
                        color: ColorPlatform.colorwhite,
                        size: 25,
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class CountDownloadWidgetStyle {
  static const TextStyle _textStyle = TextStyle(
      fontSize: 21,
      color: ColorPlatform.colorwhite,
      fontWeight: FontWeight.bold);
}
