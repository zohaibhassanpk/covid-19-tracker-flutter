import 'package:covid_19_tracker/services/state_services.dart';
import 'package:covid_19_tracker/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searcheditingController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateServices stateServices=StateServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searcheditingController,
                onChanged: (value){
                  setState(() {

                  });
                },


                decoration: InputDecoration(

                  hint: Text('Search with country name'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.grey
                    ),
                    
                  ),
                 // prefix: Icon(Icons.search,color: Colors.white,)
                ),
              ),
            ),
            Expanded(child: FutureBuilder(future: stateServices.countriryListApi(),
                builder: (context,AsyncSnapshot<List<dynamic>> Snapshot){
              if(!Snapshot.hasData){
                return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context ,index){
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.white,
                        child:Column(
                          children: [
                            ListTile(
                              title:Container(
                                height: 10,
                                width: 90,
                                color: Colors.white,
                              ),
                              subtitle:Container(
                                height: 10,
                                width: 90,
                                color: Colors.white,
                              ),
                              leading: Container(
                                  height:MediaQuery.of(context).size.height*0.10,
                                  width: MediaQuery.of(context).size.width*0.12,
                                  color: Colors.white
                                  ),
                            )


                          ],
                        ),);


                    });

              }
              else{
                return  ListView.builder(
                    itemCount: Snapshot.data!.length,
                    itemBuilder: (context ,index){
                      String name=Snapshot.data![index]['country'];

                      if(searcheditingController.text.isEmpty){
                        return Column(
                          children: [
                            InkWell(
                              onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(

                                  image: Snapshot.data![index]['countryInfo']['flag'],
                                  name: Snapshot.data![index]['country'] ,
                                  totalCases:  Snapshot.data![index]['cases'] ,
                                  totalRecovered: Snapshot.data![index]['recovered'] ,
                                  totalDeaths: Snapshot.data![index]['deaths'],
                                  active: Snapshot.data![index]['active'],
                                  test: Snapshot.data![index]['tests'],
                                  todayRecovered: Snapshot.data![index]['todayRecovered'],
                                  critical: Snapshot.data![index]['critical'] ,

                                ),));
                              },
                              child: ListTile(
                                title:Text(Snapshot.data![index]['country'],style: TextStyle(fontWeight: FontWeight.w500),),
                                subtitle:Text(Snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                    height:MediaQuery.of(context).size.height*0.11,
                                    width: MediaQuery.of(context).size.width*0.11,
                                    image: NetworkImage(Snapshot.data![index]['countryInfo']['flag'])),
                              ),
                            )


                          ],
                        );

                      }else if(name.toLowerCase().contains(searcheditingController.text.toLowerCase())){
                        return Column(
                          children: [
                            InkWell(
                              onTap:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(

                                  image: Snapshot.data![index]['countryInfo']['flag'],
                                  name: Snapshot.data![index]['country'] ,
                                  totalCases:  Snapshot.data![index]['cases'] ,
                                  totalRecovered: Snapshot.data![index]['recovered'] ,
                                  totalDeaths: Snapshot.data![index]['deaths'],
                                  active: Snapshot.data![index]['active'],
                                  test: Snapshot.data![index]['tests'],
                                  todayRecovered: Snapshot.data![index]['todayRecovered'],
                                  critical: Snapshot.data![index]['critical'] ,

                                ),));
                              },
                              child: ListTile(
                                title:Text(Snapshot.data![index]['country'],style: TextStyle(fontWeight: FontWeight.w500),),
                                subtitle:Text(Snapshot.data![index]['cases'].toString()),
                                leading: Image(
                                    height:MediaQuery.of(context).size.height*0.11,
                                    width: MediaQuery.of(context).size.width*0.11,
                                    image: NetworkImage(Snapshot.data![index]['countryInfo']['flag'])),
                              ),
                            )


                          ],
                        );
                      }else{
                        return Container();
                      }


                });
              }

            }))
            
          ],
        ),
      ),
    );
  }
}
