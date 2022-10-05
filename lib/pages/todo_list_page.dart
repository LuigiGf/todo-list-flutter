import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add new task',
                        hintText: 'Ex: study Flutter.',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = todoController.text;
                      setState(() {
                        todos.add(text);
                      });
                      todoController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00d7f3),
                        padding: const EdgeInsets.all(19)),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (String todo in todos)
                      ListTile(
                        title: Text(todo),
                        subtitle: const Text('20/10/2020'),
                        leading: const Icon(Icons.save, size: 30),
                        onTap: () {
                          print('tarefa: $todo');
                        },
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'You have 0 tasks pendents',
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00d7f3),
                        padding: const EdgeInsets.all(19)),
                    child: const Text('Clear all'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
