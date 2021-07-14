//importing classes
//live streaming
import 'camera_live_stream/all_text.dart';
import 'camera_live_stream/grab_email.dart';
import 'camera_live_stream/meter_reader.dart';
import 'camera_live_stream/four_digits.dart';
import 'camera_live_stream/card_number.dart';

//take picture
import 'cameraTakePic/camera_screen.dart';

//open image
import 'open_image/openPicAll.dart';

import 'mitLicense.dart';
import 'about.dart';
import 'user_guide.dart';
//import packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

class homePage extends StatefulWidget {

  const homePage({Key? key}): super(key: key);
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int? _value; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Uno Text Reader'),
/*
        actions: [
          IconButton(
            icon: Text('Software License'),
            tooltip: 'Software license for Uno Text Reader',
            onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>                             appLicense()),
              );  // Navigator.push 
            },
          ),
          IconButton(
            icon: Text('Applicable License'),
            tooltip: 'Applicable licenses for Uno Barcode Reader',
            onPressed: () { 
              showLicensePage(context: context);
            },
          ),
        ],
*/
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/unoWalking.jpg"),
          fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child:DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("ALL TEXT"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("EMAIL ADDRESS"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("METER READER"),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("4 NUMBERS"),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text("CARD NUMBER"),
                          value: 5,
                        ),
/*
                        DropdownMenuItem(
                          child: Text("WEB ADDRESS"),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text("BANK CARD NUMBER"),
                          value: 7,
                        ),
*/
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                          scanOptions(_value);
                          _value = null;
                        });
                      },
                      hint:Text("SCAN")
                    ), //dropdown
                  ), // container
                ), // expanded

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child:DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("ALL TEXT"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("EMAIL ADDRESS"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("METER READER"),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("4 NUMBERS"),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text("CARD NUMBER"),
                          value: 5,
                        ),
/*
                        DropdownMenuItem(
                          child: Text("WEB ADDRESS"),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text("BANK CARD NUMBER"),
                          value: 7,
                        ),
*/
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                          captureOptions(_value);
                          _value = null;
                        });
                      },
                      hint:Text("CAPTURE IMAGE")
                    ), //dropdown
                  ), // container
                ), // expanded


                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child:DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("ALL TEXT"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("EMAIL ADDRESS"),
                          value: 2,
                        ),
/*
                        DropdownMenuItem(
                          child: Text("METER READER"),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("4 NUMBERS"),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text("PHONE NUMBERS"),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: Text("WEB ADDRESS"),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text("BANK CARD NUMBER"),
                          value: 7,
                        ),
*/
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                          openOptions(_value);
                          _value = null;
                        });
                      },
                      hint:Text("OPEN IMAGE")
                    ), //dropdown
                  ), // container
                ), // expanded
                FloatingActionButton.extended(
                  tooltip: 'User guide to explain how to use and licenses.',
                  label: Text('USER GUIDE'),
                  heroTag: 'userGuide',
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>                             userGuide()),
                    );  // Navigator.push

                  }, // onPress
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ), // floating action button extended
                FloatingActionButton.extended(
                  tooltip: 'About the Uno Accessibility suite, other apps in the suite, contact details.',
                  label: Text('ABOUT'),
                  heroTag: 'about',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>                             about()),
                    );  // Navigator.push
                  },  // onPress
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ), // floating action button extended

              ] // column widget
            ), // column (fab
          ), // padding
        ), // center
      ) // body container
    );  // scaffold
  }  // widget build

  scanOptions(var option) {
    switch(option) {
      case 1: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             allText()),
        );
      }
      break;
      case 2: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             grabEmail()),
        );
      }
      break;
      case 3: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             meterReader()),
        );
      }                              
      break;
      case 4: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             fourDigits()),
        );
      }
      break;

      case 5: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cardNumber()),
        );
      }
      break;
/*
      case 6: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             webAddress()),
        );
      }
      break;
      case 7: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             bankCardNumber()),
        );
      }
      break;
      default: {
        //flutterTts.speak('Please choose a pdf templet');
      }
      break;
*/
    }
  }


  captureOptions(var option) {
    switch(option) {
      case 1: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cameraCaptureScreen(option: option)),
        );
      }
      break;

      case 2: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cameraCaptureScreen(option: option)),
        );
      }
      break;

      case 3: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cameraCaptureScreen(option: option)),
        );
      }                              
      break;
      case 4: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cameraCaptureScreen(option: option)),
        );
      }
      break;

      case 5: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cameraCaptureScreen(option: option)),
        );
      }
      break;
/*
      case 6: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cameraCaptureScreen(option: option)),
        );
      }
      break;
      case 7: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             cameraCaptureScreen(option: option)),
        );
      }
      break;
      default: {
        //flutterTts.speak('Please choose a pdf templet');
      }
      break;
*/
    }
  }

  openOptions(var option) {
    switch(option) {
      case 1: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             openPicAll()),
        );
      }
      break;
/*
      case 2: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             grabEmail()),
        );
      }
      break;
      case 3: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             meterReader()),
        );
      }                              
      break;
      case 4: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             fourDigits()),
        );
      }
      break;

      case 5: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             phoneNumber()),
        );
      }
      break;
      case 6: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             webAddress()),
        );
      }
      break;
      case 7: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>                             bankCardNumber()),
        );
      }
      break;
      default: {
        //flutterTts.speak('Please choose a pdf templet');
      }
      break;
*/
    }
  }

  void showLicensePage({
    required BuildContext context,
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
    bool useRootNavigator = false,
  }) {
    assert(context != null);
    assert(useRootNavigator != null);
    Navigator.of(context, rootNavigator: useRootNavigator)
        .push(MaterialPageRoute<void>(
      builder: (BuildContext context) => LicensePage(
        applicationName: applicationName,
        applicationVersion: applicationVersion,
        applicationIcon: applicationIcon,
        applicationLegalese: applicationLegalese,
      ),
    ));
  }


}