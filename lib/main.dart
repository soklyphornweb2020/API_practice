
import 'package:api_flutter1/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(ApiFlutter());
class ApiFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: User(),
    );
  }
}