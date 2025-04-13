import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/add_student_page.dart';
import 'pages/edit_student_page.dart';

void main() {
  runApp(StudentCRUDApp());
}

class StudentCRUDApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student CRUD App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/add': (context) => AddStudentPage(),
        '/edit': (context) => EditStudentPage(),
      },
    );
  }
}