import 'dart:async';

import 'package:covid_19_tracker/model/WorldStateModel.dart';
import 'package:covid_19_tracker/services/state_services.dart';
import 'package:covid_19_tracker/view/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldState extends StatefulWidget {
  const WorldState({super.key});

  @override
  State<WorldState> createState() => _WorldStateState();
}

class _WorldStateState extends State<WorldState>with TickerProviderStateMixin {
  @override

  late final AnimationController _controller= AnimationController(

      duration: Duration(seconds: 5),

      vsync: this)..repeat();
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  final colorlist=<Color>[
    Color(0xff4245F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  Widget build(BuildContext context) {
    StateServices stateServices=StateServices();
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              FutureBuilder(future: stateServices.fetchWorldStateRecords(),
                  builder: (context,AsyncSnapshot<WorldStateModel>snapshot){
                if(!snapshot.hasData){
                  return Expanded(

                      flex: 1,
                      child:SpinKitFadingCircle(
                       color: Colors.white,
                        size: 50,
                        controller: _controller,
                      ));
                }
                else{
                  return Column(
                    children: [
                      PieChart(
                        chartRadius:MediaQuery.of(context).size.width/3.2 ,
                        legendOptions: LegendOptions(
                            legendPosition: LegendPosition.left
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true
                        ),
                        dataMap:
                        {
                          "Totel":double.parse(snapshot.data!.cases!.toString()),
                          "Recoverd":double.parse(snapshot.data!.recovered!.toString()),
                          "Deaths":double.parse(snapshot.data!.deaths!.toString())
                        },

                        animationDuration: Duration(milliseconds: 1200),
                        chartType: ChartType.ring,
                        colorList: colorlist,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.06),
                        child: Card(
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10 ),
                            child: Column(
                              children: [
                                Reuseable(title: "Totel Cases", value: snapshot.data!.cases!.toString()),
                                Reuseable(title: "Recovered", value: snapshot.data!.recovered!.toString()),
                                Reuseable(title: "Totel Deaths", value:snapshot.data!.deaths!.toString() ),
                                Reuseable(title: "Active", value:snapshot.data!.active!.toString() ),
                                Reuseable(title: "Critical", value:snapshot.data!.critical!.toString() ),
                                Reuseable(title: "Today Cases", value:snapshot.data!.todayCases!.toString() ),
                                Reuseable(title: "Today Deaths", value:snapshot.data!.todayDeaths!.toString() ),
                                Reuseable(title: "Today Recovered", value:snapshot.data!.todayRecovered!.toString() ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>CountriesListScreen() ));
                        },
                        child: Container(
                          height: 50,
                          decoration:BoxDecoration(
                            color: Color(0xff1aa260),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: Center(child: Text("Track Country", style: TextStyle(fontWeight: FontWeight.bold),)),
                        ),
                      )


                    ],
                  );


                }
              }),


            ],
          ),
        ),
      ),
    );
  }
}
class Reuseable extends StatelessWidget {
  String title, value;
   Reuseable({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),

          ],

        ),
        SizedBox(height: 5,),
        Divider()
      ],
    );
  }
}
