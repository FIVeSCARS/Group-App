import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Group App",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Group App"),
        ),
        body: getListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget getListView() {
    return Container(
      width: 380,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40)),
      child: Column(
        children: <Widget>[

          TextField(
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

        ],
      )
  );
}

