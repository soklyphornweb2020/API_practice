import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
      List users;
      Map userData;
  Future setUser() async {
    //reques of API
    String url="https://reqres.in/api/users";
    //respone of api
    http.Response response = await http.get(url);
    userData = json.decode(response.body);
    setState(() {
      users = userData['data'];
    });
  }
  @override
  void initState(){
    super.initState();
    setUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Of Information"),
      ),
      body: ListView.builder(
        itemCount: users ==null ? 0 : users.length,
        itemBuilder: (BuildContext context, int i){
          final user = users[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container( 
                child: Row(  
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage("${user["avatar"]}"),
                      ),
                    ),
                      Text("${user["first_name"]}"),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}