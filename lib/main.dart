import 'package:flutter/material.dart';
import './dayScreen.dart';
import './addListScreen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        Home.routeName:(ctx)=>Home(),
      },
    );
  }
}

class Home extends StatefulWidget {

  static final routeName = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var flag = true;
  void toogleFlag() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(toogleFlag, flag),
      bottomNavigationBar: flag ? _bottomBar() : null,
      body: flag ? _actionsList() : settingsList(),
    );
  }

  Widget _actionsList() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.wb_sunny_outlined),
          title: Text("My Day"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return dayScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.star_border,color: Colors.purple,),
          title: Text("Important"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return dayScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.calendar_today,color: Colors.blueGrey,),
          title: Text("Planned"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return dayScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person_outline,color: Colors.green,),
          title: Text("Assigned to you"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return dayScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.home_outlined),
          title: Text("Tasks"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return dayScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget settingsList() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Add profile"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return dayScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Control profiles"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return dayScreen();
                  },
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Setting"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return dayScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _appBar(toogleFlag, bool flag) {
    var appBarElements = [
      CircleAvatar(
        backgroundColor: Colors.blue[220],
        radius: flag ? 16 : 32,
        child: Text("BB"),
      ),
      flag
          ? SizedBox(
        width: 10,
      )
          : SizedBox(
        height: 15,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "Babken Boyakhchyan",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(flag ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
            ],
          ),
          Text("babkenboyaxchyan@gmail.com")
        ],
      )
    ];
    return PreferredSize(
      child: GestureDetector(
        onTap: () {
          toogleFlag();
          print("appbar");
        },
        child: Container(
          color: Colors.grey,
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: MediaQuery.of(context).padding.top + 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              flag
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: appBarElements,
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: appBarElements,
              ),
              flag
                  ? IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.blue[200],
                ),
                onPressed: () {

                },
              )
                  : IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.blue[200],
                ),
                onPressed: () {
                  toogleFlag();
                },
              )
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(200),
    );
  }

  Widget _bottomBar() {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return AddListScreen();
                }));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.blue[200],
                    size: 35,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Create List",
                    style: TextStyle(
                        color: Colors.blue[200],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                return showDialog(context: context,builder: (ctx)=>AlertDialog(
                  title: Text("Create group"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(),
                      Row(mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(onPressed: (){ },child: Text("Cancel")),
                          FlatButton(onPressed: (){},child: Text("Create Group"))
                        ],

                      ),
                    ],
                  ),
                ));
              },
              child: Icon(
                Icons.add_box,
                color: Colors.blue[220],
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );

  }
}













