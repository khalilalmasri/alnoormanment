import 'dart:io';
import 'package:alnoormanment/UI/shared/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'image_widget.dart';

typedef FileOnCallFunction = Function(File file);

class ImageHandler extends StatefulWidget {
  File? image;

  final FileOnCallFunction onCallFunction;
  final FileOnCallFunction onRemoveFunction;
  final String? url;

  ImageHandler(
      {this.image,
      required this.onCallFunction,
      required this.onRemoveFunction,
      this.url})
      : super();

  @override
  _ImageHandlerState createState() => _ImageHandlerState();
}

class _ImageHandlerState extends State<ImageHandler>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return widget.image != null
        ? Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: ColorPlatform.colorgrey,
                borderRadius: DecoPlatform.borderRadius,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30.0,
                      offset: Offset(0.0, 10.0))
                ],
                image: DecorationImage(
                    image: showImage(widget.image!), fit: BoxFit.scaleDown)),
            child: GestureDetector(
              onTap: () => _showChooseDialog(context),

            ),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: GestureDetector(
              child: widget.url !=null
                  ? ImageWidget(image: widget.url!,width: MediaQuery.of(context).size.width,)
                  :Image(image: AssetImage("images/ad_with_us.png")),
              onTap: () => _showChooseDialog(context),
            ));
  }

  ImageProvider showImage(File file) {
    return FileImage(file);
  }

  Future chooseImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    final lastIndex = pickedFile!.path.lastIndexOf(new RegExp(r'.jp'));
    final splitted = pickedFile.path.substring(0, (lastIndex));
    final outPath = "${splitted}_out${pickedFile.path.substring(lastIndex)}";

    final resultedFile = await FlutterImageCompress.compressAndGetFile(
      pickedFile.path,
      outPath,
      // minWidth: 800,
      // minHeight: 600,
    );
    setState(() {
      widget.onCallFunction(resultedFile);
      widget.image = resultedFile;
    });
     Navigator.pop(context);
  }

  _removeImage(File file) {
    setState(() {
      widget.onRemoveFunction(file);
    });
  }

  Future<void> _showChooseDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('اختر صورة من المعرض'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Text(
                      "المعرض",
                    ),
                    onTap: () {
                      chooseImage(context);
                    }),
                Container(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
