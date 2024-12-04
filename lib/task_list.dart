import 'package:flutter/material.dart';
import 'task_form.dart'; 
import 'task_details.dart'; 

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Map<String, String>> tasks = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 79, 74, 88),
        elevation: 6,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                title: Text(
                  tasks[index]['titre'] ?? 'Titre non disponible',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  tasks[index]['description'] ?? 'Description non disponible',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailsPage(task: tasks[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter, // Aligne le bouton en bas au centre
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0), // Optionnel : pour ajouter de l'espace du bas
          child: FloatingActionButton(
            onPressed: () async {
              final newTask = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskFormPage()),
              );
              if (newTask != null) {
                setState(() {
                  tasks.add(newTask); 
                });
              }
            },
            child: Icon(Icons.add),
            backgroundColor: const Color.fromARGB(255, 66, 63, 71),
          ),
        ),
      ),
    );
  }
}
