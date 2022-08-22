import 'dart:convert';
import 'package:ms_task1/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllPosts extends StatefulWidget {
  const AllPosts({Key? key}) : super(key: key);

  @override
  State<AllPosts> createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  List<User> users = [];
  bool isTrue = false;
  var var1 = 'ok';
  var var2 = 'ok';


  Future<List<User>> _getUsers() async {

    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var jsonData = json.decode(data.body);


    for(var u in jsonData){

      User user = User(u["title"]);

      users.add(user);

    }


    for (var i = 0; i < 10; i++) {
      if (var1 == var2) {
        setState(() {
          isTrue = true;
        });

      }
      }

    return users;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:
        FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child: Text("Loading...", style: TextStyle(fontSize: 25.0),)
                  )
              );
            } else {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {

                  return
                    Container(
                      decoration: BoxDecoration( //                    <-- BoxDecoration
                        border: Border(bottom: BorderSide(width: 0.8)),
                        color: Colors.white,
                      ),
                      child: ListTile(

                        title: Text('Title', style: TextStyle(fontSize: 24.0, fontWeight: index == constants.idlogin-1? FontWeight.bold : null, color: index == constants.idlogin-1? Colors.red : null),),
                        subtitle: Text(snapshot.data[index].title, style: TextStyle(fontSize: 22.0, fontWeight: index == constants.idlogin-1? FontWeight.bold : null, color: index == constants.idlogin-1? Colors.black : null),),
                      ),
                    );

                },

              );
            }
          },
        ),
      ),
    );
  }





  }


class User {
  final String title;
  
  User(this.title);

}

const kStyleTrue = TextStyle(
  fontWeight: FontWeight.bold,
);