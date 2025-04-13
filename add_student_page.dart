import 'package:flutter/material.dart';

class AddStudentPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) => value!.isEmpty ? 'Enter a name' : null,
            ),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(labelText: 'Student ID'),
              validator: (value) => value!.isEmpty ? 'Enter an ID' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context, {
                    'name': nameController.text,
                    'id': idController.text,
                  });
                }
              },
              child: Text('Add'),
            )
          ]),
        ),
      ),
    );
  }
}