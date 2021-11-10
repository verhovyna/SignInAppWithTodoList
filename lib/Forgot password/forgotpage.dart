import 'package:flutter/material.dart';
import 'package:signin_app_with_todolist/Forgot password/forgotpage2.dart';
import 'package:signin_app_with_todolist/main.dart';
import 'package:flutter/cupertino.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 45.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignUp(context),
                  _getBottomRow(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader() {
  return Expanded(
    flex: 3,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text('Forgot            Password',
          style: TextStyle(color: Colors.white, fontSize: 35)),
    ),
  );
}

_getInputs() {
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: 'Enter your name',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: 'Enter a phone number or email',
            labelStyle: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    ),
  );
}

_getSignUp(context) {
  return Expanded(
    flex: 2,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
              side: BorderSide(color: Colors.grey.shade600)),
          color: Colors.grey.shade100,
          textColor: Colors.grey.shade800,
          padding: EdgeInsets.all(10.0),
          //splashColor: Colors.grey.shade300,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ForgotP()));
          },
          child: Text(
            "Next".toUpperCase(),
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
  );
}

_getBottomRow(context) {
  return Expanded(
    flex: 1,
    child: Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    ),
  );
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    //Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh);
    blueWave.cubicTo(sw, sh, sw, sh, sw, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    //Grey
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.57);
    greyWave.cubicTo(sw * 0.2, sh * 0.7, sw * 0.6, sh * 0.8, sw * 0.55, sh);
    greyWave.lineTo(0, sh);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);

    //Yellow
    Path yellowWave = Path();
    yellowWave.lineTo(sw, 0);
    yellowWave.lineTo(sw, sh * 0.3);
    yellowWave.cubicTo(sw * 0.5, sh * 0.45, sw * 0.4, sh * 0.35, 0, sh * 0.3);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
