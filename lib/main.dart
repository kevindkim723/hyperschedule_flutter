import 'package:flutter/material.dart';
import 'package:hyperschedule_flutter/screens/course_screen.dart';
import 'package:hyperschedule_flutter/screens/home_screen.dart';
import 'package:hyperschedule_flutter/screens/loading_screen.dart';

void main() => runApp(
      MaterialApp(initialRoute: '/home', routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomeScreen(),
        '/course': (context) => CourseScreen(),
      }),
    );
