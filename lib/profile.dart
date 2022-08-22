import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ms_task1/constants.dart' as constants;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<User> users = [];


  Future<List<User>> _getUsers() async {
    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var jsonData = json.decode(data.body);


    for(var u in jsonData){

      User user = User(u["username"]);
      users.add(user);
    }
    return users;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Name', style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(constants.namelogin, style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Username', style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(constants.usernamelogin, style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Address', style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(constants.addresslogin+', '+constants.suitelogin+', '+constants.citylogin, style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Zipcode', style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration( //                    <-- BoxDecoration
                    border: Border(bottom: BorderSide(width: 0.5)),
                    color: Colors.white,
                  ),
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(constants.zipcodelogin, style: TextStyle(fontSize: 25.0),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class User {
  final String username;

  User(this.username);

}