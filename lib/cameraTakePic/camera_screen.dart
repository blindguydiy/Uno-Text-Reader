//import classes
import 'all_text.dart';
import 'grab_email.dart';
import 'four_digits.dart';
import 'meter_reader.dart';
import 'card_number.dart';

//import packages
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class cameraCaptureScreen extends StatefulWidget {

  cameraCaptureScreen(
      {Key? key,
      required this.option,})
      : super(key: key);

  var option;


  @override
  _cameraCaptureScreenState createState() => _cameraCaptureScreenState();
}

class _cameraCaptureScreenState extends State<cameraCaptureScreen> {

  late final CameraController _controller;
  int? options;
  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  // Initializes camera controller to preview on screen
  void _initializeCamera() async {
    final CameraController cameraController = CameraController(
      //cameras = await availableCameras();

      cameras[0],
      ResolutionPreset.high,
    );
    _controller = cameraController;

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
_controller.setFlashMode(FlashMode.torch);

    });
  }

  @override
  void dispose() {
      _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Picture View'),
      ),
      body: _controller.value.isInitialized
        ? Stack(
          children: <Widget>[
          CameraPreview(_controller),
            
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
              children: [
              ElevatedButton.icon(
                icon: Icon(Icons.flash_on),
                label: Text("FLASH ON"),
                onPressed: () async {
                  _controller.setFlashMode(FlashMode.torch);

                },
                ),
              ElevatedButton.icon(
                icon: Icon(Icons.camera),
                label: Text("CAPTURE"),
                onPressed: () async {
                  // If the returned path is not null, navigate
                  // to the DetailScreen
                  await _takePicture().then((String? path) {
                  if (path != null) {
                    switch(widget.option) {
                      case 1: {
                    Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => allText(
                          imagePath: path,
                        ),
                      ),
                    );

                      }
                      break;
                      case 2: {
                    Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => grabEmail(
                          imagePath: path,
                        ),
                      ),
                    );
                      }
                      break;
                      case 3: {
                    Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => meterReader(
                          imagePath: path,
                        ),
                      ),
                    );
                      }
                      break;
                      case 4: {
                    Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => fourDigits(
                          imagePath: path,
                        ),
                      ),
                    );
                      }
                      break;
                      case 5: {
                    Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => cardNumber(
                          imagePath: path,
                        ),
                      ),
                    );
                      }
                      break;

                    }
              } else {
                print('Image path not found!');
              }
            });
          },
        ),
              ElevatedButton.icon(
                icon: Icon(Icons.flash_off),
                label: Text("FLASH OFF"),
                onPressed: () async {
                  _controller.setFlashMode(FlashMode.off);
                },
                ),

]
), //row
      ), // container
              ), // padding
          ], // stack widget
        )
        : Container(
          color: Colors.black,
          child: Center(
            child: CircularProgressIndicator(),
          ), //center
        ), // container
    ); // return
  }  // widget build

  Future<String?> _takePicture() async {
    if (!_controller.value.isInitialized) {
      print("Controller is not initialized");
      return null;
    }

    String? imagePath;

    if (_controller.value.isTakingPicture) {
      print("Processing is in progress...");
      return null;
    }

    try {
      // Turning off the camera flash
      _controller.setFlashMode(FlashMode.off);
      // Returns the image in cross-platform file abstraction
      final XFile file = await _controller.takePicture();
      // Retrieving the path
      imagePath = file.path;
    } on CameraException catch (e) {
      print("Camera Exception: $e");
      return null;
    }

    return imagePath;
  }

}