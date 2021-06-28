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
    fetchCourses();
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

  void fetchCourses() async {
    http.Response response = await http.get(Uri.parse(
        'https://hyperschedule.herokuapp.com/api/v3/courses?school=hmc'));
    Map json = await jsonDecode(response.body);
    debugPrint(json.toString());
    Map courseListJSON = json['data']['courses'];

    debugPrint(courseListJSON['AFRI010A AF-01 FA2021']['courseInstructors'][0]
        .toString());
    List<Course> listCourses = JSONToList(courseListJSON);
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'listCourses': courseListJSON});
  }

  List<Course> JSONToList(Map courseListJSON) {
    List<Course> listCourses = [];
    courseListJSON.forEach((key, value) {
      listCourses.add((new Course(value)));
    });
    return listCourses;
  }
}
