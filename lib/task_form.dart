import 'package:flutter/material.dart';

class TaskFormPage extends StatefulWidget {
  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _taskData = {
    'title': '',
    'description': '',
    'startDate': '',
    'endDate': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vueillez entrer un titre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _taskData['title'] = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 's ils vous plait enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _taskData['description'] = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'DateDebut'),
                onSaved: (value) {
                  _taskData['startDate'] = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'DateFin'),
                onSaved: (value) {
                  _taskData['endDate'] = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, _taskData); 
                  }
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
