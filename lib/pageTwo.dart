import 'package:flutter/material.dart';
import 'thirdPage.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> groups = [];
  final controller = TextEditingController();

  Widget build(context) => Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
              onTap: () {},
              child: Center(
                  child: Text(
                    'Edit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )))
        ],
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Students Page"),
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
                'No Students Yet',
                style: TextStyle(fontSize: 25),
              ),
              Text('Please add your Students now')
            ]),
      )
          : GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 8.0 / 10.0,
          crossAxisCount: 2,
        ),
        children: [
          ...groups.map(
                (group) => Card(
                elevation: 7,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThirdPage())),
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/03.png'),
                          Text(
                            group,
                            style: TextStyle(fontSize: 25.0),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ));

  void onPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Insert Students"),
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
              hintText: "Student Name",
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