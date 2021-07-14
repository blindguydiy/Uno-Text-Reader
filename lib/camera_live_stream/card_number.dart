// import camera view
import 'camera_live_view/camera_view.dart';

//import packages
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class cardNumber extends StatefulWidget {

  @override
  _cardNumberState createState() => _cardNumberState();
}

class _cardNumberState extends State<cardNumber> {

  TextDetector textDetector = GoogleMlKit.vision.textDetector();
  bool isBusy = false;
  List? outputText = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() async {
    super.dispose();
    await textDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Card Number',
      onImage: (inputImage) {
        processImage(inputImage);
      },
      outputText: outputText,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final recognisedText = await textDetector.processImage(inputImage);

    //retrieve the text from the RecognisedText object and then separate out the 4 digits from it. The text is present in blocks -> lines -> text.
    // Regular expression for verifying an int number
    String pattern = r"^\d{4}[-, ]?\d{4}[-, ]?\d{4}[-, ]\d{4}$";
    RegExp regEx = RegExp(pattern);

    List? grabText = [];

    // Finding and storing the text String(s)
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        if (regEx.hasMatch(line.text )) {
          grabText.add(line.text);
        }
      }
    }

    isBusy = false;
    if (mounted) {
      setState(() {});
      outputText = grabText;
    }
  }

}
