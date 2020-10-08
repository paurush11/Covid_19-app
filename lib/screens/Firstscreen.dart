import 'package:flutter/material.dart';
import 'package:covid_19app/constants.dart';
import 'package:covid_19app/services/covid-data.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid_19app/screens/payment.dart';
import 'contact.dart';
import 'package:covid_19app/reusable_card.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({ @required this.locationData, this.coviddata});
  final coviddata;
  final locationData;


  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String county;
  String country;
  String place;
  String postcode;
  String region;
  int activecases ;
  int Recoveredcases;
  int confirmedcases;
  int deathcases;
  int placecases;
  int cases;

  @override
  void initState() {
    locationdata(widget.locationData);
    getcoviddata(widget.coviddata);
    super.initState();
  }
  void getcoviddata(dynamic data)
  {
    List<String> States = new List<String>();
    List<int> active = new List<int>();
    List<int> confirmed = new List<int>();
    List<int> recovered = new List<int>();
    List<int> deaths = new List<int>();
    List<int>Values = [36,15,31,39,75,11,24,14,32,35,38,35,37,34,52,22,29,22,24,20,13,3,4,8,12,1,17,25,11,12,2,2,4,11,0,1,0];
    Map<int,List> names = new Map<int,List>();
    Map<int,List> Cases = new Map<int,List>();

    for(int i = 0;i<37;i++)
    {
      String st = data[i]['state'];
      States.add(st??"null");
      int act = data[i]['active'];
      int con = data[i]['confirmed'];
      int rec = data[i]['recovered'];
      int death = data[i]['deaths'];
      active.add(act);
      confirmed.add(con);
      recovered.add(rec);
      deaths.add(death);
      List<String> ID = new List<String>();
      List<int> Placecases = new List<int>();

      int j = 0;
      while(j<Values[i])
        {
          String id = data[i]["districtData"][j]["id"];
          int placecases = data[i]["districtData"][j]["confirmed"];
          ID.add(id);
          Placecases.add(placecases);
          j++;
        }
        names.putIfAbsent(i, () => ID);
      Cases.putIfAbsent(i, () => Placecases);

    }

    for(int i = 0;i<37;i++)
      {
        if(region ==States[i])
          {
            activecases = active[i];
            confirmedcases = confirmed[i];
            Recoveredcases = recovered[i];
            deathcases = deaths[i];
          }
        List nameofdistrict = names[i];
        List districtcases = Cases[i];

        for(int j = 0;j<nameofdistrict.length;j++)
          {
            if(place == nameofdistrict[j])
              {
                cases = districtcases[j];
              }
          }
      }

  }

  void locationdata(dynamic weatherData)
  {
    country = weatherData["address"]["country"];
    place = weatherData["address"]["state_district"];
    postcode = weatherData["address"]["postcode"];
    region = weatherData["address"]["state"];
    county = weatherData["address"]["county"];
    if(place == null)
      {
        place = county;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracker'),
      ),
      body: ListView(
        children: <Widget>[
          Column(

            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  reusablecard(
                    colour: Color(0XA0003E7B),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("$country" , style: KCountrystyle,),
                        SizedBox(
                          height: 50,
                        ),
                        Text("$place", style: Kactivecases,),
                        // Text("$observationTime")
                      ],
                    ),
                  ),
                  reusablecard(
                    colour: Color(0XA0003E7B),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Roundiconbutton(
                              icon: FontAwesomeIcons.rupeeSign,
                              onpress: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return HomePage();
                                }));

                              },

                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Roundiconbutton(
                              icon: FontAwesomeIcons.thermometer,

                            )


                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Roundiconbutton(
                              icon: FontAwesomeIcons.phoneSquareAlt,
                              onpress: (){
                                Navigator.push(context, MaterialPageRoute(builder:(context){
                                  return MyApp();
                                }));
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Roundiconbutton(
                              icon: FontAwesomeIcons.chartArea,

                            )


                          ],
                        ),
                        // Text("$observationTime")
                      ],
                    ),
                  ),
                ],
              ),
              reusablecard(
                colour: Color(0XA0003E7B),
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Covid Cases in $region",style: Kheadingstyle
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Active-Cases" , style: Kactivecases,),
                        Text("$activecases" , style: Knumbers,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Recovered-Cases" , style: Kactivecases,),
                        Text("$Recoveredcases", style: Knumbers,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Confirmed-Cases" , style: Kactivecases,),
                        Text("$confirmedcases" , style: Knumbers,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Total Deaths" ,style: Kdeaths,),
                        Text("$deathcases" , style: Knumbers,)
                      ],
                    ),
                  ],
                ),
              ),
              reusablecard(
                colour: Color(0XA0003E7B),
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("$place" ,style : Kheadingstyle
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Confirmed cases" , style: Kactivecases,),
                        Text("$cases" , style: Knumbers,),
                      ],
                    )


                  ],

                ),
              ),


            ],
          ),
        ],

      ),
    );
  }

}






class Roundiconbutton extends StatelessWidget {

  Roundiconbutton({ @required this.icon,  this.onpress});
  final IconData icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
        child: Icon(icon),
        shape: CircleBorder(),
        fillColor: Color(0XFF4C4F5E),
        onPressed: onpress,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        )
    );
  }
}


