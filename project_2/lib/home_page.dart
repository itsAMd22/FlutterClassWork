import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage 64B"),
        backgroundColor: const Color.fromARGB(255, 225, 87, 23),
        foregroundColor: Colors.white,
        // leading: Icon(Icons.home),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Arif"),
              accountEmail: Text("moarif22@gmail.com"),
            ),

            ListTile(
              title: Text("Homepage"),
              onTap: (){},
              leading: Icon(Icons.home),
              hoverColor: Colors.lime,
            ),

            Divider(), 

            ListTile(
              title: Text("Settings"),
              onTap: (){},
              leading: Icon(Icons.settings),
              hoverColor: Colors.lime,
            ),


            Divider(),

            Spacer(), 

            ListTile(
              leading: Icon(Icons.person),
              trailing: IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.logout),
              ),
              title: InkWell(
                child: Text("Profile"), 
                onTap: (){},
                hoverColor: Colors.lime,
              ),
            ),
          ],
        ),   
      ),
      // endDrawer: Drawer(),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: const Color.fromARGB(255, 225, 87, 23),
        foregroundColor: Colors.white,
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
      
      body: Row(
        children: [
          TextButton(
            onPressed: (){}, 
            style: TextButton.styleFrom(
              side: BorderSide(),
              backgroundColor: const Color.fromARGB(255, 178, 208, 234),
              foregroundColor: Colors.black,
              shadowColor: Colors.black,
              elevation: 10,
            ),
            child: Text("Blue")
          ),
          ElevatedButton(onPressed: (){}, child: Text("Pink")),
          OutlinedButton(onPressed: (){}, child: Text("Black")),
        ],
      ),
      
    );
  }
}