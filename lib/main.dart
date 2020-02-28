import 'package:flutter/material.dart';
import 'pageTwo.dart';
import 'splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CET Group App",
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<HomePage> {
  List<String> groups = [];
  final controller = TextEditingController();

  Widget build(context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text("CET Group Appe"),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: Text(
                  "CET Students Manager",
                  style: TextStyle(fontSize: 24),
                ),
                subtitle: Text("CET APP"),
              ),
              new ListTile(
                leading: Icon(Icons.group),
                title: Text("Groups"),
              ),
              new ListTile(
                leading: Icon(Icons.notifications_active),
                title: Text("Notifications"),
              ),
              new ListTile(
                leading: Icon(Icons.announcement),
                title: Text("About App"),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: onPressed,
          child: Icon(Icons.add),
        ),
        body: groups.isEmpty
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'No Groups Yet',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text('Please add your groups now')
                    ]),
              )
            : ListView(
                children: [
                  ...groups.map(
                    (group) => Card(
                      elevation: 3,
                      child: Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            color: Colors.red,
                            child: Icon(Icons.delete_sweep),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              groups.clear();
                            });
                          },
                          child: ListTile(
                            title: Text(group),
                            trailing: Icon(Icons.web),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondPage())),
                          )),
                    ),
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
            color: Colors.deepPurpleAccent,
            onPressed: () {
              setState(() => groups.add(controller.text));
              controller.clear();
              Navigator.of(context).maybePop();
            },
          ),
          RaisedButton(
            child: Text("Exit"),
            color: Colors.deepPurpleAccent,
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
