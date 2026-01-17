import 'dart:convert';

import 'package:covid_19_tracker/model/WorldStateModel.dart';
import 'package:covid_19_tracker/services/utitlities/app_url.dart';
import 'package:covid_19_tracker/view/world_state.dart';
import 'package:http/http.dart' as http;
class StateServices{
  Future<WorldStateModel> fetchWorldStateRecords()async{
    final response = await http.get(Uri.parse(apiurl.worldstateurl));
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    }
    else{
      throw Exception('error');
    }
  }
  Future<List<dynamic>> countriryListApi() async {
    print('API URL: ${apiurl.countriesurl}'); // Check URL

    final response = await http.get(Uri.parse(apiurl.countriesurl));

    print('Status Code: ${response.statusCode}'); // Check status
    print('Response Body: ${response.body}'); // Check response

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('Data length: ${data.length}'); // Check data
      return data;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }


}