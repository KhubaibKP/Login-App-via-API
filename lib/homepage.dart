import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ms_task1/posts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ms_task1/constants.dart' as constants;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  String email = '';
  String password = '';
  String usernamelogin = '';
  String namelogin = '';
  String addresslogin = '';
  String suitelogin = '';
  String citylogin = '';
  String zipcodelogin = '';
  bool isLogin = false;
  int idlogin = 0;



  Future<List<User>> _getUsers() async {
    var data = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var jsonData = json.decode(data.body);


    for(var u in jsonData){

      User user = User(u["name"], u["username"], u["address"]["street"], u["address"]["suite"], u["address"]["city"], u["address"]["zipcode"], u["id"]);
      users.add(user);
    }

    return users;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Center(
                child: Image.asset('images/Loremipsum.jpg'),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.grey.shade300,
              child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                    setState(() {
                      email;
                    });
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Email')
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.grey.shade300,
              child: TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                    setState(() {
                      password;
                    });
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Password')
              )
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
        Container(
          color: Colors.white,
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Text('');
              } else {
                return Text('');
              }
            },
          ),
        ),

        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 50.0,

              child: ElevatedButton(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 25))
                ), onPressed: () {

                for (var i = 0; i < 10; i++) {
                  if (users[i].username == email && users[i].username == password)
                  {
                    setState(() {
                      isLogin = true;
                      usernamelogin = users[i].username;
                      namelogin = users[i].name;
                      addresslogin = users[i].street;
                      suitelogin = users[i].suite;
                      citylogin = users[i].city;
                      zipcodelogin = users[i].zipcode;
                      idlogin = users[i].id;

                      constants.usernamelogin = usernamelogin;
                      constants.namelogin = namelogin;
                      constants.addresslogin = addresslogin;
                      constants.suitelogin = suitelogin;
                      constants.citylogin = citylogin;
                      constants.zipcodelogin = zipcodelogin;
                      constants.idlogin = idlogin;

                    });
                    break;


                  }
                }


                if (isLogin == true)
                  {
                    isLogin =false;
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                      const Posts(),
                      ),
                    );
                  }
              },
              ),

            ),
          ),



      ],
      ),
    );
  }
}

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.black),
  focusColor: Colors.black,
  fillColor: Colors.grey,
  contentPadding:
  EdgeInsets.symmetric(vertical: 2.0, horizontal: 25.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 5.0),
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

class User {
  final String username;
  final String name;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final int id;

  User(this.name, this.username, this.street, this.suite, this.city, this.zipcode, this.id);

}