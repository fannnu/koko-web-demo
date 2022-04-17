import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url =
    'https://play.google.com/store/apps/details?id=com.tesseract.koko';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'koko',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white, // Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow[600], //Colors.white,
          title: Text(
            'koko',
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Colors.black, //Colors.yellow[800],
              fontWeight: FontWeight.w700,
            )),
            //style: TextStyle(color: Colors.black),
          ),
        ),
        body: w > 420 //Computer Website
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              w * 0.03, w * 0.07, w * 0.01, w * 0.01),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: h * 0.4,
                              width: w * 0.4,
                              child: Text(
                                'Get cosmetics in                30 mins',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontSize: w * 0.04,
                                  color: Colors.black, //Colors.yellow[800],
                                  fontWeight: FontWeight.w500,
                                )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              w * 0.01, w * 0.01, w * 0.05, w * 0.05),
                          child: GestureDetector(
                            onTap: _launchURL,
                            child: Container(
                              height: h * 0.2,
                              width: w * 0.4,
                              child: Image.network(
                                  "https://cdn-images-1.medium.com/max/1000/1*HxKmdivEjZuHGCONLaLEHQ.png"),
                              //child: Image.asset("playstore.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: h * 0.7,
                    width: w * 0.5,
                    child: Image.network(
                        "https://cdn-images-1.medium.com/max/1000/1*Q1OZWmtNOsk9-KTg_bLzng.png"),
                    //child: Image.asset("koko_ss.png"),
                  )
                ],
              )
            ////Phone screen
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          w * 0.05, w * 0.1, w * 0.05, w * 0.0),
                      child: Center(
                        child: Container(
                          height: h * 0.1,
                          width: w * 1,
                          child: Text(
                            '     Get cosmetics in 30 mins',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              fontSize: w * 0.065,
                              color: Colors.black, //Colors.yellow[800],
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: h * 0.6,
                      width: w * 1,
                      child: Image.network(
                          "https://cdn-images-1.medium.com/max/1000/1*Q1OZWmtNOsk9-KTg_bLzng.png"),

                      //child: Image.asset("koko_ss.png"),
                    ),
                    GestureDetector(
                      onTap: _launchURL,
                      child: Container(
                        height: h * 0.15,
                        width: w * 1,
                        child: Image.network(
                            "https://cdn-images-1.medium.com/max/1000/1*HxKmdivEjZuHGCONLaLEHQ.png"),

                        //child: Image.asset("playstore.png"),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    )
                  ],
                ),
              )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
