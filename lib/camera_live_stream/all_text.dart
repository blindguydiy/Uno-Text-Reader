//import camera view
import 'camera_live_view/camera_view.dart';

//import packages
import 'dart:async';
//import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class allText extends StatefulWidget {

  @override
  _allTextState createState() => _allTextState();
}

class _allTextState extends State<allText> {

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
      title: 'All Text Reader',
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

    List? grabText = [];
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        grabText.add(line.text);
      }
    }
    isBusy = false;
    if (mounted) {
      setState(() {});
      outputText = grabText;
    }
  }

}
