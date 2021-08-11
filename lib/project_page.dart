import 'package:flutter/material.dart';
import 'package:portFolio/responsive.dart';

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text('Receipt Manager - Flutter Redux App', style: TextStyle(color: Color(0xFFFFD700)),),
                        subtitle: Text('I completed my OneDay UI build app, its backend is done using FireStore\n'
                                        "This is my first full app with FireStore and learnt pagination, searching\n"
                                        'duplicate data management, image db management ... ',
                                        style: TextStyle(color:Colors.white),),
                      )
                  ],
                )),
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.card_membership, color: Color(0xFFFFD700),),
                        title: Text('Data Analysis with Python', style: TextStyle(color: Color(0xFFFFD700)),),
                        subtitle: Text('Coursera', style: TextStyle(color:Colors.white), ),
                      ),
                      ListTile(
                        leading: Icon(Icons.card_membership, color: Color(0xFFFFD700),),
                        title: Text('Database SQL for Data Science', style: TextStyle(color: Color(0xFFFFD700)),),
                        subtitle: Text('Coursera', style: TextStyle(color:Colors.white), ),
                      ),
                      ListTile(
                        leading: Icon(Icons.card_membership, color: Color(0xFFFFD700),),
                        title: Text('Data Visualization with Python', style: TextStyle(color: Color(0xFFFFD700)),),
                        subtitle: Text('Coursera', style: TextStyle(color:Colors.white), ),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
    );
  }
}
