import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> students = [
    {'name': 'Alice', 'id': 'S001'},
    {'name': 'Bob', 'id': 'S002'},
  ];

  void _deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  void _editStudent(int index, Map<String, String> updatedStudent) {
    setState(() {
      students[index] = updatedStudent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(student['name']!),
              subtitle: Text('ID: ${student['id']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      final updated = await Navigator.pushNamed(
                        context,
                        '/edit',
                        arguments: student,
                      ) as Map<String, String>?;
                      if (updated != null) _editStudent(index, updated);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteStudent(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newStudent = await Navigator.pushNamed(context, '/add')
              as Map<String, String>?;
          if (newStudent != null) {
            setState(() {
              students.add(newStudent);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
