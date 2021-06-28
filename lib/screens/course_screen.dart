import 'package:flutter/material.dart';
import 'package:hyperschedule_flutter/services/Course.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Map mData = {};
  Course mCourse;
  @override
  Widget build(BuildContext context) {
    mData = ModalRoute.of(context).settings.arguments;
    mCourse = mData['course'];
    return Scaffold(
      body: SafeArea(
        child: Column(
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
      ),
    );
  }
}
