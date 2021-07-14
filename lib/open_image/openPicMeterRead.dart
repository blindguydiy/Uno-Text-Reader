//import packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class openPicAll extends StatefulWidget {
  @override
  _openPicAllState createState() => _openPicAllState();
}
class _openPicAllState extends State<openPicAll> {

  String result = '';
  List<ImageLabel> imageLabels = <ImageLabel>[];
  RecognisedText? _recognisedText;
  TextDetector _textDetector = GoogleMlKit.vision.textDetector();
  String? filePath;
  List<String>? _listFullTextStrings = ['where text apear'];
  List<String>? _listEmailStrings;

  @override
  void initState() {
    fromStorage();
    super.initState();
  }

  Future<void> fromStorage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final inputImage = InputImage.fromFilePath(pickedFile.path);

      final retrievedText = await _textDetector.processImage(inputImage);

      List<String> fullTextStrings = [];

      for (TextBlock block in retrievedText.blocks) {
        for (TextLine line in block.lines) {
          fullTextStrings.add(line.text);

        }
      }

      setState(() {
        filePath = pickedFile.path;
        _recognisedText = retrievedText;
        _listFullTextStrings = fullTextStrings;
      });

    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _textDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Results '),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child:  ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _listFullTextStrings!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                  title: Text('${_listFullTextStrings![index]}'),
                  );
                },
              ) //listview
  ), // container
          ), // expanded

        ] // column
      ), //column
    ); // return
  }



}

