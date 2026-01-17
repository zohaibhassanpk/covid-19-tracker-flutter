import 'package:covid_19_tracker/view/world_state.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image ;
  String  name ;
  int totalCases , totalDeaths, totalRecovered , active , critical, todayRecovered , test;
   DetailScreen({super.key,
     required this.image ,
     required this.name ,
     required this.totalCases,
     required this.totalDeaths,
     required this.totalRecovered,
     required this.active,
     required this.critical,
     required this.todayRecovered,
     required this.test,
   });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.1),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
            
                  children: [
            
                    Padding(
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.067,
                      ),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
            
                            children: [
            
                              SizedBox(height: MediaQuery.of(context).size.height * .06),
                              Reuseable(title: 'Cases', value: widget.totalCases.toString(),),
                              Reuseable(title: 'Recovered', value:  widget.totalRecovered.toString(),),
                              Reuseable(title: 'Death', value:  widget.totalDeaths.toString(),),
                              Reuseable(title: 'Critical', value: widget.critical.toString(),),
                              Reuseable(title: 'Today Recovered', value:widget.totalRecovered.toString(),),
                              Reuseable(title: 'Active', value:widget.active.toString(),),
                              Reuseable(title: 'Test', value:widget.test.toString(),),
            
                            ],
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:NetworkImage(widget.image) ,
                    ),
            
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
