//import camera view
import 'camera_live_view/camera_view.dart';

//import packages
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class meterReader extends StatefulWidget {

  @override
  _meterReaderState createState() => _meterReaderState();
}

class _meterReaderState extends State<meterReader> {

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
      title: 'Meter Reader',
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

    //retrieve the text from the RecognisedText object and then separate out the meter reading from it. The text is present in blocks -> lines -> text.
    // Regular expression for verifying an decimal number with 3 digits infront and 2 decimal places
    String pattern = r"^\b(\d{1,3}\.)\d{1,2}\b$";
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
