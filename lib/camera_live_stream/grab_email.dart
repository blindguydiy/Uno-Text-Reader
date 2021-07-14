//camera view
import 'camera_live_view/camera_view.dart';

//import packages
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class grabEmail extends StatefulWidget {

  @override
  _grabEmailState createState() => _grabEmailState();
}

class _grabEmailState extends State<grabEmail> {

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
      title: 'Detect email address',
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

    //retrieve the text from the RecognisedText object and then separate out the email addresses from it. The text is present in blocks -> lines -> text.
    // Regular expression for verifying an email address
    String pattern = r" [a-zA-Z0-9.+-_]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,63}";
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
