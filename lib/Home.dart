import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KU Connect'),),
      backgroundColor: Colors.redAccent[100],

      drawer: Drawer(
        child: Column(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: Text('Ayush'),
              accountEmail: Text('ayush10059@gmail.com'),
            ),

            ListTile(
              leading: Icon(Icons.announcement),
              title: Text('Recent'),
              trailing: Chip(
                label:
                Text('1',),
                backgroundColor: Colors.redAccent[100],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/recent');
              },
            ),

            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Routine'),
              onTap: () {
                Navigator.pushNamed(context, '/routine');
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),

            Divider(),

            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(Icons.assignment_ind),
                  title: Text('About us'),
                ),
              ),
            )
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

        ],
      ),
    );
  }
}

