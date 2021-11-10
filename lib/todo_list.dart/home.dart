import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' show ImageFilter;

import 'package:signin_app_with_todolist/Forgot password/forgotpage2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userTodo;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll([
      'Call Martin at the conference',
      'Go to the movies with Lucy',
      'Take the clothes to the laundry',
      'Go to gym',
      'Go for a walk with Daniel'
    ]);
  }

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          backgroundColor: Colors.grey.shade800,
          appBar: AppBar(
            backgroundColor: Colors.orange.shade300,
            title: Text('Menu'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text('Andrew Kosheliuk',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/photo.png'),
                    radius: 60,
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 25,
                        color: Colors.white,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        'verhovyna08@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        title: Text('Morning Routine'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: _menuOpen,
          )
        ],
      ),
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          alignment: Alignment(0.8, 0.87),
          children: <Widget>[
            ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    key: Key(todoList[index]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: Colors.grey.shade800)),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.grey.shade800)),
                        tileColor: Colors.grey.shade100,
                        title: Text(todoList[index]),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_sweep_rounded,
                            color: Colors.grey.shade800,
                          ),
                          onPressed: () {
                            setState(() {
                              todoList.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      //if(direction == DismissDirection.endToStart)
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  );
                }),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
              ),
              color: Colors.orange.shade300,
              textColor: Colors.white,
              padding: EdgeInsets.all(10.0),
              splashColor: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: AlertDialog(
                            backgroundColor: Colors.grey.shade100,
                            title: Text('Write your task'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Colors.grey.shade100)),
                            content: TextField(
                              onChanged: (String value) {
                                _userTodo = value;
                              },
                            ),
                            actions: [
                              FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      side: BorderSide(
                                          color: Colors.grey.shade100)),
                                  color: Colors.orange.shade300,
                                  textColor: Colors.white,
                                  padding: EdgeInsets.all(10.0),
                                  splashColor: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      todoList.add(_userTodo);
                                    });

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Add Task')),
                            ],
                          ));
                    });
              },
              child: Icon(
                Icons.add,
                color: Colors.grey.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade800;
    canvas.drawPath(mainBackground, paint);

    //Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.8, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.grey.shade100;
    canvas.drawPath(blueWave, paint);

    //Grey
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.9, sh * 0.16, sw * 0.58, sh * 0.3, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.62, sh * 0.62, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(greyWave, paint);

    // //Yellow
    // Path yellowWave = Path();
    // yellowWave.lineTo(sw * 0.7, 0);
    // yellowWave.cubicTo(
    //     sw * 0.8, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    // yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    // yellowWave.close();
    // paint.color = Colors.orange.shade300;
    // canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
