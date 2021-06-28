import 'package:flutter/material.dart';
import 'package:hyperschedule_flutter/services/Course.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mListFilter = TextEditingController();
  String mSearchText = "";
  Map mData = {};
  List<Course> mListCourses = [];
  List<Course> mFilteredCourses = [];

  @override
  void initState() {
    // TODO: implement initState
    setUpListFilterListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mData = ModalRoute
        .of(context)
        .settings
        .arguments;
    //listCourses = data['listCourses'];
    //mFilteredCourses = mListCourses;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: mListFilter,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Search for courses...",
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
          itemCount: mListCourses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                ),
              ),
            );
          }),
    );
  }

  void setUpListFilterListener() {
    mListFilter.addListener(() {
      if (mListFilter.text.isEmpty) {
        mSearchText = "";
        mFilteredCourses = mListCourses;
      } else {
        mSearchText = mListFilter.text;
      }
    });
  }

  Widget buildList() {
    if (mSearchText.isNotEmpty) {
      List<Course> mTempList = [];
      mFilteredCourses.forEach((element) {
        if })
    }
  }

  bool containsKeyword(Course mCourse, String mKeyword) {
    String mCourseNameLowercase = mCourse.courseName.toString().toLowerCase();
    String mInstructors = "";
    List mInstructorList = mCourse.instructorList;
    mInstructorList.forEach((element) {
      mInstructors += element.toString().toLowerCase() + " ";
    });
    String mConstraints = mCourseNameLowercase + " " + mInstructors;
    for (var value in mConstraints.split(" ")) {
      if (mConstraints.contains(value)) {
        return true;
      }
    }
    return false;
  }
}
