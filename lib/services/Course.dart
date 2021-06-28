class Course {
  //instance variables that will be useful for displaying course information
  var courseJSON;
  var courseCode;
  var courseName;
  var courseDays;
  var courseTime;
  var courseLocation;
  var instructorList;
  var courseCredits;
  var courseDescription;
  var courseStatus;
  var courseSeats;
  var courseTerm;
  var courseSortKey;

  ///constructor for the Course Class that takes in a Json-formatted Map object [courseJson] with this specific course object
  /// [courseJson] must be the proper sub-JsonMap in the sense that courseJson[courseTime],courseJson[courseName],... can be called without errors
  Course(Map courseJSON) {
    this.courseJSON = courseJSON;
    feed();
  }

  ///input: a map [listCourses] equivalent to rootJson['data']['courses']
  ///output: updates the JsonMap of the current Course so that its fields like [courseDescription] and [courseStatus] are up-to-date
  update(Map courseListJSON) {
    this.courseJSON = courseListJSON[courseSortKey];
  }

  ///helper method that updates all course information instance variables
  ///through fetching information from [courseJSON] instance variable.
  feed() {
    courseSortKey = courseJSON['courseSortKey'].first;
    courseCode = courseJSON['courseCode'];
    courseName = courseJSON['courseName'];
    instructorList = courseJSON['courseInstructors'];
    courseCredits = courseJSON['courseCredits'].toString();
    courseDescription = courseJSON['courseDescription'];
    courseSeats = courseJSON['courseSeatsFilled'].toString() +
        " / " +
        courseJSON['courseSeatsTotal'].toString();
    courseTerm = courseJSON['courseTerm'];
    courseStatus = courseJSON['courseEnrollmentStatus'];
    var scheduleJSON;
    try {
      scheduleJSON = courseJSON['courseSchedule'].first;
      courseDays = scheduleJSON['scheduleDays'].toString();
      courseLocation = scheduleJSON['scheduleLocation'].toString();
      courseTime = scheduleJSON['scheduleStartTime'].toString() +
          " - " +
          scheduleJSON['scheduleEndTime'].toString();
    } catch (e) {
      print("*" * 100);
      print("error on course: " + courseCode);
      courseDays = "null";
      courseLocation = "null";
      courseTime = "null";
    }
    print(courseDays);
  }

  ///firstLine() ... sixthLine() provides strings of what is to be shown when
  ///user taps on the course
  String firstLine() => courseCode + " " + courseName;

  String secondLine() =>
      courseDays + " " + courseTime + " at " + courseLocation;

  String thirdLine() {
    StringBuffer sb = new StringBuffer();
    for (String instructor in instructorList) {
      sb.write(instructor);
      sb.write(" ");
    }
    return sb.toString();
  }

  String fourthLine() => courseTerm + ", " + courseCredits + " credits";

  String fifthLine() => courseDescription;

  String sixthLine() => courseStatus + ", " + courseSeats + " filled";

  @override
  String toString() {
    // TODO: implement toString
    return firstLine();
  }
}
