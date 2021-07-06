import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    mData = ModalRoute.of(context).settings.arguments;
    mListCourses = mData['listCourses'];
    mFilteredCourses = mListCourses;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: mListFilter,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Search for courses...",
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: buildList(),
      ),
    );
  }

  void setUpListFilterListener() {
    mListFilter.addListener(() {
      if (mListFilter.text.isEmpty) {
        setState(() {
          mSearchText = "";
          mFilteredCourses = mListCourses;
        });
      } else {
        setState(() {
          mSearchText = mListFilter.text;
        });
      }
    });
  }

  Widget buildList() {
    if (mSearchText.isNotEmpty) {
      List<Course> mTempList = new List<Course>.from(mFilteredCourses);
      for (Course c in mFilteredCourses) {
        if (!containsKeyword(c, mSearchText)) {
          mTempList.remove(c);
        }
      }
      mFilteredCourses = mTempList;
    }
    return ListView.builder(
        itemCount: mFilteredCourses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: .5, horizontal: 4.0),
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/course',
                      arguments: {'course': mFilteredCourses[index]});
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(mFilteredCourses[index].courseCode),
                          Text(mFilteredCourses[index].courseName),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            mFilteredCourses[index].courseSeats +
                                " seats filled",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  bool containsKeyword(Course mCourse, String mKeyword) {
    String mCourseNameLowercase = mCourse.courseName.toString().toLowerCase();
    String mInstructors = "";
    List mInstructorList = mCourse.instructorList;
    mInstructorList.forEach((element) {
      mInstructors += element.toString().toLowerCase() + " ";
    });
    String mFilterPatterns = mCourseNameLowercase + " " + mInstructors;
    for (var value in mKeyword.split(" ")) {
      if (mFilterPatterns.contains(value)) {
        print("CONTAINED $value");
        return true;
      }
    }

    return false;
  }
}
