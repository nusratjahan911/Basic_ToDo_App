import 'package:flutter/material.dart';
import 'package:simple_todo_project/add_new_page.dart';
import 'package:simple_todo_project/todo_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todoslist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("🌟 Daily Planner 🌟",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
      ),



      
      body: ListView.separated(
        itemCount: todoslist.length,
          itemBuilder:(context, index){
          Todo todos = todoslist[index];
          return ListTile(
            ///for delete list
            onTap: (){
              todoslist.removeAt(index);
              setState(() {});
            },

            title: Text(todos.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todos.description,style: TextStyle(fontSize: 20),),
                SizedBox(width: 40),
                Text("Created date: ${todos.createdDate}"),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, // important to keep trailing compact
              children: [
                Text(todos.status),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    todoslist.removeAt(index);
                    setState(() {});
                  },
                ),
              ],
            ),
          );

          },
        separatorBuilder: (context,index){
          return Divider(
            indent: 15,
          );
        },

      ),
      ///Button
      floatingActionButton: FloatingActionButton.extended(onPressed: () async {
         Todo? todos = await Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewPage()));

        if(todos != null){
          todoslist.add(todos);
          setState(() {});
        }
      },
        icon: Icon(Icons.add),
        label: Text('Add Todo'),
      ),


    );
  }
}



