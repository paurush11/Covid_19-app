import 'dart:async';
import 'package:covid_19app/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_19app/reusable_card.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher',
      home: MyHomePage(title: 'URL Launcher'),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0A0E20),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _launched;
  String _phone = '';

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.cylog.org/headers/';
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    onChanged: (String text) => _phone = text,
                    decoration: const InputDecoration(
                        hintText: 'Input the phone number to launch')),
              ),
              RaisedButton(
                onPressed: () => setState(() {
                  _launched = _makePhoneCall('tel:$_phone');
                }),
                child: const Text('Make phone call'),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              FutureBuilder<void>(future: _launched, builder: _launchStatus),

              reusablecard(
                colour: Color(0XA0003E7B),
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Emergency", style: KCountrystyle ,),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Andhra Pradesh"),
                        Text("0866-2410978")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Arunachal Pradesh"),
                        Text("9436055743")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Assam"),
                        Text("6913347770")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Haryana "),
                        Text("8558893911")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Kerala "),
                        Text("786-12552056")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Maharashtra"),
                        Text("020-26127394")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Manipur"),
                        Text("3852411668")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Nagaland"),
                        Text("7005539653")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Odisha"),
                        Text("9439994859")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Rajasthan"),
                        Text("0141-2225624")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Tamil Nadu"),
                        Text("044-29510500")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Tripura"),
                        Text("0381-2315879")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Uttar Pradesh"),
                        Text("18001805145")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("West Bengal"),
                        Text("1800313444222")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("New-Delhi"),
                        Text("011-22307145")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Chandigarh"),
                        Text("9779558282")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Jammu & Kashmir "),
                        Text("01912520982")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Rest"),
                        Text("104/108")
                      ],
                    ),


                  ],
                ),
              )


            ],
          ),
        ],
      ),
    );
  }
}
