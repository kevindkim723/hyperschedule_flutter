import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hyperschedule_flutter/services/Course.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Course c;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }

  void getem() async {
    http.Response response = await http.get(Uri.parse(
        'https://hyperschedule.herokuapp.com/api/v3/courses?school=hmc'));
    Map json = await jsonDecode(response.body);
    Map courseJSON = json['data']['courses'];
    print(courseJSON);
    print("*************");
    print(courseJSON['ASTR062  HM-01 SP2021']['courseSortKey'].first);
    c = new Course(courseJSON["ASTR062  HM-01 SP2021"]);
    print(c.secondLine());
    Navigator.pushReplacementNamed(context, '/course', arguments: c);
  }
}
