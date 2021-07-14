//import packages
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class cardNumber extends StatefulWidget {
  final String imagePath;

  cardNumber({required this.imagePath});

  @override
  _cardNumberState createState() => _cardNumberState();
}

class _cardNumberState extends State<cardNumber> {

  late final String _imagePath;
  late final TextDetector _textDetector;
  Size? _imageSize;
  List? outputText= [];
  List? speakText = [];
  // Fetching the image size from the image file
  Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();
    final Image image = Image.file(imageFile);

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      ));
      }),
    );

    final Size imageSize = await completer.future;

    setState(() {
      _imageSize = imageSize;
    });
  }

  void _recognizeText() async {
    _getImageSize(File(_imagePath));
    //Create an InputImage object using the image path, and process it to recognize text present in it:
    // Creating an InputImage object using the image path
    final inputImage = InputImage.fromFilePath(_imagePath);
    // Retrieving the RecognisedText from the InputImage
    final text = await _textDetector.processImage(inputImage);

    // Regular expression for verifying an email address
    String pattern = r"^\d{4}[-, ]?\d{4}[-, ]?\d{4}[-, ]\d{4}$";
    RegExp regEx = RegExp(pattern);

    //retrieve the text from the RecognisedText object and then separate out the email addresses from it. The text is present in blocks -> lines -> text.

    List? grabText = [];

    // Finding and storing the text String(s)
    for (TextBlock block in text.blocks) {
      for (TextLine line in block.lines) {
        if (regEx.hasMatch(line.text )) {
          grabText.add(line.text);
        }


      }
    }
    //Store the text retrieved in the form of a list to the _listEmailStrings variable.
    setState(() {
      outputText = grabText;
    });
    outputText!.isEmpty ? speakText!.add('No text found') : speakText = outputText;
  }

  @override
  void initState() {
    _imagePath = widget.imagePath;
    // Initializing the text detector
    _textDetector = GoogleMlKit.vision.textDetector();
    _recognizeText();
    super.initState();
  }

  @override
  void dispose() {
    // Disposing the text detector when not used anymore
    _textDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text details"),
      ),
      body: ListView.builder(
        itemCount: speakText!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${speakText![index]}'),
          );
        },
      ) 
    ); // return
  } // scaffold

}
