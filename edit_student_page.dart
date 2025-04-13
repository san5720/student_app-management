import 'package:flutter/material.dart';

class EditStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> student =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final nameController = TextEditingController(text: student['name']);
    final idController = TextEditingController(text: student['id']);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: Text('Edit Student')),
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
              child: Text('Save Changes'),
            )
          ]),
        ),
      ),
    );
  }
}
