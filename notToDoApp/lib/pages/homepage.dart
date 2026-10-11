import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:not_to_do_app/database/to_do_db.dart';
import 'package:not_to_do_app/util/dialogbox.dart';
import 'package:not_to_do_app/util/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // Initialize default data on first run, otherwise load existing data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Toggle task completion status
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Save new task
  void saveNewTask() {
    if (_controller.text.trim().isEmpty) return; // Prevent empty tasks
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Complete Delete Function
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // Open task creation dialog
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 107, 106, 99),
        title: const Center(
          child: Text(
            "not_to_DO_list",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),

      //drawer
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 198, 173, 83),
        child: ListView(
          children: [
            // 1
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 74, 73, 66),
              ),
              
              currentAccountPicture: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32, color: Colors.grey),
                ),
              ),
              
              accountName: const Text(
                "Mohammed Arif",
                style: TextStyle(color: Color.fromARGB(255, 248, 246, 246), fontWeight: FontWeight.bold, fontSize: 16),
              ),
              
              accountEmail: const Text("mo.arif.2205@gmail.com\nCSE 64B"),
            ),
            
            // 2
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black,),
              title: const Text('Profile', style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const Divider(),

            // 3
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black,),
              title: const Text('Settings', style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      
      //body - list of tasks
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFucntion: (context) => deleteTask(index),
          );
        },
      ),
      

      //add task button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: const Color.fromARGB(255, 255, 146, 91),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}