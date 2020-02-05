import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Group App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> groups = [];
  final controller = TextEditingController();

  Widget build(context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Groups Page"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          child: Icon(Icons.add),
        ),
        body: groups.isEmpty
            ? Center(child: Text('No groups'))
            : ListView(
                children: [
                  ...groups.map(
                    (group) => Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(group),
                          trailing: Icon(Icons.web),
                          onTap:  () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondPage() )),
                        )),
                  )
                ],
              ),
      );



  void onPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Insert group"),
        content: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              suffixIcon: Icon(Icons.group),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Group Name",
            ),
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text("Insert"),
            color: Colors.green,
            onPressed: () {
              setState(() => groups.add(controller.text));
              controller.clear();
              Navigator.of(context).maybePop();
            },
          ),
          RaisedButton(
            child: Text("Exit"),
            color: Colors.green,
            onPressed: () {
              controller.clear();
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
    );
  }
}
//

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> groups = [];
  final controller = TextEditingController();

  Widget build(context) =>
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Members Page"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          child: Icon(Icons.add),
        ),
        body: groups.isEmpty
            ? Center(child: Text('No Members'))
            : ListView(
          children: [
            ...groups.map(
                  (group) =>
                  Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(group),
                        trailing: Icon(Icons.web),
                        onLongPress: null,
                      )),
            )
          ],
        ),
      );
  void onPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Insert Members"),
        content: Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              suffixIcon: Icon(Icons.group),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Group Name",
            ),
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text("Insert"),
            color: Colors.green,
            onPressed: () {
              setState(() => groups.add(controller.text));
              controller.clear();
              Navigator.of(context).maybePop();
            },
          ),
          RaisedButton(
            child: Text("Exit"),
            color: Colors.green,
            onPressed: () {
              controller.clear();
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
    );
  }
}