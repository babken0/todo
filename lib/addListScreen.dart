import 'package:flutter/material.dart';
import 'main.dart';
import 'taskList.dart';
import 'task.dart';

class AddListScreen extends StatefulWidget {
  @override
  _AddListScreenState createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {

  var list = TaskList();

  var backgroundColor = Colors.red;
  var backgroundimage = "assets/images/i1.jpeg";
  var isBackgroundImageSet = false;
  var groupNameController = TextEditingController();
  var taskNameController = TextEditingController();



  void fetchTask({title}){
    setState(() {
      list.addTask(task: Task(title: title));
    });
  }


  void setGroupeNameCallback(text){
    setState(() {
      list.title = text;
    });
  }

  void goBack(){
    Navigator.pushReplacementNamed(context, Home.routeName);

  }

  void setColor(MaterialColor color){
    setState(() {
      print("changing");
      backgroundColor = color;
      isBackgroundImageSet = false;
    });
  }

  void setImage(String image){
    setState(() {
      backgroundimage = image;
      isBackgroundImageSet = true;
    });
  }

  void showTaskForm(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom,top: 20,left: 20,right:20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Row(
                  children: [
                    Icon(Icons.add_circle_outline),
                    Expanded(child: TextField(
                      controller: taskNameController,

                    ),),
                    IconButton(icon:Icon(Icons.arrow_upward),onPressed: (){
                      fetchTask(title: taskNameController.text);
                      Navigator.of(context).pop();
                    },),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 80,
                  child:  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding:EdgeInsets.all(5),

                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 10,),
                            Text("Hello"),
                          ],
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.all(5),

                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.notification_important),
                            SizedBox(width: 10,),
                            Text("Hello2"),
                          ],
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.all(5),

                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 10,),
                            Text("Hello3"),
                          ],
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.all(5),

                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 10,),
                            Text("Hello3"),
                          ],
                        ),
                      ),
                      Container(
                        padding:EdgeInsets.all(5),

                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 10,),
                            Text("Hello3"),
                          ],
                        ),
                      )

                    ],
                  ),
                )


              ],
            ),
          );
        });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showCreateAlertDialog(context);
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    // _showCreateAlertDialog(context);
    return Container(
      decoration: BoxDecoration(
        image:isBackgroundImageSet ? DecorationImage(image: AssetImage(backgroundimage),fit: BoxFit.cover)  : null,
      ),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(list.title == null ? "" : list.title,style: TextStyle(color: Colors.white,fontSize: 30),textAlign: TextAlign.left,),
              SizedBox(height: 20,),
              Expanded(child: ListView.builder(itemBuilder: (ctx,index){
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    tileColor: Colors.white,

                    leading: IconButton(icon:Icon( Icons.account_circle),onPressed: (){
                        setState(() {
                          list.delete(index: index);
                        });
                    },),
                    title:Text( list.tasks[index].title),
                    trailing: IconButton(icon:Icon(Icons.star_border),onPressed: (){},),
                  ),
                );
              },itemCount: list.tasks.length,)),
            ],
          ),
        ),
        backgroundColor: isBackgroundImageSet ? Colors.transparent : backgroundColor,
        appBar: appBar(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlueAccent,
          onPressed: () {
            showTaskForm(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget appBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            onPressed: () {}),
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (ctx) {
            return [
              PopupMenuItem(
                child: Text("a"),
              ),
              PopupMenuItem(
                child: Text("b"),
              ),
            ];
          },
        ),
      ],
    );
  }

  void _showCreateAlertDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertDialog(changeColor: setColor,changeImage: setImage,controller: groupNameController,backScreen: goBack,setGroupeNameCallback:setGroupeNameCallback ,);
        }).then((value) => null);
  }
}

class MyAlertDialog extends StatefulWidget {

  final Function changeColor;
  final Function changeImage;
  final TextEditingController controller;
  final Function backScreen;
  final Function setGroupeNameCallback;


  MyAlertDialog({this.changeColor,this.changeImage,this.controller,this.backScreen,this.setGroupeNameCallback});

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  var i = 1;
  var colors = [Colors.blue,Colors.grey,Colors.red,Colors.yellow,Colors.amber,Colors.pink];
  var images = [
      "assets/images/i1.jpeg",
    "assets/images/i2.jpeg",
    "assets/images/i3.jpeg",
    "assets/images/i4.jpeg",
    "assets/images/i5.jpeg",
    "assets/images/i6.jpeg",
  ];
  var isChooseColor = true;

  void toogleIsChooseColor(){
    setState(() {
     i == 1 ? isChooseColor = true : isChooseColor = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Create List"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.indigo,
                    ),
                    onPressed: (){}),
                Expanded(
                  child: TextField(controller: widget.controller,),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    i = 1;
                    toogleIsChooseColor();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: i == 1 ? Colors.indigo : Colors.white,
                      borderRadius: new BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.only(
                        bottom: 10, top: 10, left: 15, right: 15),
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Color",
                      style: TextStyle(
                        color: i == 1 ? Colors.white : Colors.indigo,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    i = 2;
                    toogleIsChooseColor();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: i == 2 ? Colors.indigo : Colors.white,
                      borderRadius: new BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.only(
                        bottom: 10, top: 10, left: 15, right: 15),
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Photo",
                      style: TextStyle(
                        color: i == 2 ? Colors.white : Colors.indigo,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            isChooseColor ? colorsListView() : imagesListView(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(onPressed: (){
                widget.backScreen();
                
              }, child: Text("Cancel")),
              FlatButton(onPressed: (){widget.setGroupeNameCallback(widget.controller.text);Navigator.of(context).pop();}, child: Text("Create List"))
            ],
            ),
          ],
        ));
  }

  Widget colorsListView() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(13),
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (
            context,
            index,
          ) {
            return GestureDetector(
              onTap: (){print("$index");widget.changeColor(colors[index]);

              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: colors[index],
              ),
            );
          },
          itemCount: colors.length,
        ),
      ),
    );
  }

  Widget imagesListView() {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(13),
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (
              context,
              index,
              ) {
            return GestureDetector(
              onTap: (){widget.changeImage(images[index]);},
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(images[index]),
              ),
            );
          },
          itemCount: images.length,
        ),
      ),
    );
  }
}
