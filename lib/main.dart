import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo List', home: TodoListState());
  }
}

class TodoListState extends StatefulWidget {
  @override
  _TodoListStateState createState() => _TodoListStateState();
}

class _TodoListStateState extends State<TodoListState> {
  List<String> _todoItems = [];

  void _addItem(String task) {
    if (task.length > 0) {
      setState(() {
        _todoItems.add(task);
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Mark "${_todoItems[index]}" as done?'),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(), child: Text('Cancel')
              ),
              FlatButton(onPressed: () {
                _removeItem(index);
                Navigator.of(context).pop();
              }, child: new Text('MARK AS DONE'))
            ],
          );
        });
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new ListTile(
        title: new Text(todoText),
        onTap: () => _promptRemoveTodoItem(index)
    );
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if(index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text('Add a new task'),
        ),
        body: TextField(
          autofocus: true,
          onSubmitted: (val) {
            _addItem(val);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              hintText: 'Enter something todo ...',
              contentPadding: const EdgeInsets.all(16)),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Application'),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushAddTodoScreen,
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}
