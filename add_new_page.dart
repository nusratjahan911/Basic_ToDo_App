import 'package:flutter/material.dart';
import 'package:simple_todo_project/todo_class.dart';

import 'home_page.dart';
class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New Task ✨",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 700,
          decoration: BoxDecoration(
            color: Colors.orange.shade200,
            borderRadius: BorderRadius.circular(25),

          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///Add title
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: "Title",
                          labelText: "Title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          )
                        ),
                      validator: (String? value){
                          if(value?.trim().isEmpty ?? true){
                            return "Enter a valid title";
                          }
                          return null;
                      },
                      ),
                    SizedBox(height: 15),

                    ///add description
                    TextFormField(
                      textInputAction: TextInputAction.next,
                        controller: _desController,
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            )
                        ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return "Enter description";
                        }
                        return null;
                      },
                      ),

                    SizedBox(height: 40),

                    ///submit button
                    ElevatedButton( onPressed: (){
                      if(_formkey.currentState!.validate() == false){
                        return;
                      }
                      Todo todos = Todo(
                        title: _titleController.text.trim(),
                        description: _desController.text.trim(),
                        status: "Pending",
                        createdDate: DateTime.now(),
                      );
                      Navigator.pop(context,todos);
                    },
                        child: Text("Add Task",style: TextStyle(fontSize: 20),))

                  ],

            )),
          ),
        ),
      ),
    );
  }
}
