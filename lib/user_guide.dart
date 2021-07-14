/*
MIT License

Copyright (c) 2021 Hendrik Lubbe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

//import pages
import 'mitLicense.dart';
import 'privacyPolicy.dart';

// import packages
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'dart:io';

class userGuide extends StatefulWidget {

  @override
  _userGuideState createState() => _userGuideState();

}

class _userGuideState extends State<userGuide> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How to use"),

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
            tooltip: 'Applicable licenses for Uno Text Reader',
            onPressed: () { 
              showLicensePage(context: context);
            },
          ),
          IconButton(
            icon: Text('Privacy Policy'),
            tooltip: 'Privacy Policy',
            onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>                             privacyPolicy()),
              );  // Navigator.push 
            },
          ),

        ],

      ),
      body: DefaultTextStyle(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Semantics(
                  header: true,
                  child: Text('STEP BY STEP HOW TO USE:', style: TextStyle(
                    //color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40)) //HeadingWidget()
                ), // Semantics
                Text("""Below you will find information about the app, how to use the app, contact details to contact me and licenses applicable to the app on top right on the app bar."""),
                Text("""On the home page there is 5 buttons.  3 of these buttons is drop down buttons with options what text you would like to detect or extract from images.\nWith scanning you can currently detect all text, email addresses, 4 digits for reading scales, meter reader for electricity pre-paid meter that has 3 digits then a '.' and then 2 decimal digits and the 16 digit card number on bank cards and credit cards\nWith taking picture from camera you have the same options and with open image from device you will also have the same options.\nFuture versions will include edge detection and auto descewing of images for better results."""),
                Semantics(
                  header: true,
                  child: Text(""" ABOUT THE APP""", style: TextStyle(
                    //color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40)) //HeadingWidget()
                ), // Semantics
                Text("""This app was designed and developed with blind users in mind.\n"""),
                Semantics(
                  header: true,
                  child: Text("""USER GUIDE BUTTON:""", style: TextStyle(
        //color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 40)) //HeadingWidget())
                ),
                Text("""This is where you are currently to give you a idea how to use the app and also have the licenses and contact details for feedback and suggestions.\n\n"""),
                Semantics(
                  header: true,
                  child: Text("""ABOUT BUTTON:""", style: TextStyle(
        //color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 40)) //HeadingWidget())
                ),
                Text("""This will give you information on what the Uno Accessibility suite is about and what other apps are in the process to be developed.\n"""),
                Semantics(
                  header: true,
                  child: Text("""CONTACT DETAILS:""", style: TextStyle(
        //color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 40)) //HeadingWidget())
                ),
                Text("""You can double tap on the email to open your email app to send me a email or double tap on the phone number to open your dialing app to call me.\n"""),
                Text("""Developer: Hendrik Lubbe"""),
                GestureDetector(
                  child: Text("""Email:  blindguydiy@gmail.com<mailto:blindguydiy@gmail.com>"""),
                  onTap: () {
                    setState(() {
                      _contactMe(        Uri.encodeFull('mailto:blindguydiy@gmail.com?subject=Uno Barcode Reader Response')); 
                    }); // setstate
                  } // ontap
                ), // gesture detector
                GestureDetector(
                  child: Text("""Contact number:  +27795235842"""),
                  onTap: () {
                    setState(() {
                      _contactMe("tel:+27795235842");
                    }); // setstate
                  } // ontap
                ), // gesture detector
              ], // column widget
            ), // column

          ), // single scroll child
        ), // container
        style: TextStyle(color: Colors.white),
      ), // body DefaultTextStyle
    ); // scaffold
  } // widget build

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

  void _contactMe(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }


} //class