import 'package:flutter/material.dart';
import 'package:hyperschedule_flutter/services/Course.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    Course mCourse = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(mCourse.firstLine()),
          Text(mCourse.secondLine()),
          Text(mCourse.thirdLine()),
          Text(mCourse.fourthLine()),
          Text(mCourse.fifthLine()),
          Text(mCourse.sixthLine()),
        ],
      ),
    );
  }
}
