import 'package:flutter/material.dart';
import 'package:hyperschedule_flutter/services/Course.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map data = {};
  List<Course> listCourses = [];
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    listCourses = data['listCourses'];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
          itemCount: listCourses.length, itemBuilder: (context, index) {}),
    );
  }
}
