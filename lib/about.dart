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

// import packages
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class about extends StatefulWidget {

  @override
  _aboutState createState() => _aboutState();

}

class _aboutState extends State<about> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("About Uno Accessibility Suite"),
      ), // appBar
      body: DefaultTextStyle(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Semantics(
                  header: true,
                  child: Text("UNO ACCESSIBILITY ASSISTANT SUITE\n", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ), // Semantics
                Text("""This suite was developed with  blind users in mind.  The name is derived 'Uno', my first and only guide dog that retired. On the home page there is a pic of him.\n"""),
                Text("""I decided to develop this suite for the reason that some of the features I wanted to use was not available in current apps available.  I also  believe that most apps that can be run on the device without the need for third party payed access should be free for blind users and not be charged, it will enable Blind users to do what  other people can do for free.\n"""),
                Text("""As a blind man this App is my contribution to others in need of independence relating to blind users, should these apps be usefull to anyone else, and should anyone be interested in contributing to this project they are more than welcome to do so.  Contributions can be donations, programmers that want to contribute to the project to speed it up or even in some cases taking pictures or cropping pictures/images for training the neural networks for image classification and object detection. Feel free to contact me for more information regarding contribution and if you have any ideas for other apps not available in the list below, I am open to all ideas that can be use to develop apps for blind users.\n"""),
                Text("""1.  Uno Barcode Reader - (On play store in alfa version for testing.  You can go to the userguide page to read how to use),"""),
                Text("""2.  Uno Text Reader - (On play store in alfa version for testing."""),
                Text("""3.  Uno Cash Reader - (Currently in development.  Will only identify South African Rand and Namibian dollar for now), """),
                Text("""4.  Uno Object detection - (In planning), """),
                Text("""6.  Uno Face Detection - (In planning).\n"""),
                Text("""You are welcome to contact me if you require more information or have any suggestions.\n"""),
                Semantics(
                  header: true,
                  child: Text("""CONTACT DETAILS:""", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                ), // Semantics
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
          ), // single child scroll
        ),  //  container
        style: TextStyle(color: Colors.white),
      ), // body DefaultTextStyle
    );  // scaffold
  }  // build widget

  void _contactMe(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
 
}
