import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';

//ПЕРЕПИСАТИ ТРЕБА ЦЕ ВСЕ!!!!!!!!!!!!!!!!!!!

class ForgotP extends StatefulWidget {
  @override
  _ForgotPState createState() => _ForgotPState();
}

class _ForgotPState extends State {
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
    child: Row(
      children: [
        Icon(
          Icons.mail_outline,
          size: 40,
          color: Colors.white,
        ),
        Padding(padding: EdgeInsets.only(left: 5)),
        Text(
          'verhovyna08@gmail.com',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
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

    //Orange
    Path orangeWave = Path();
    orangeWave.lineTo(sw, 0);
    orangeWave.lineTo(sw, sh * 0.65);
    orangeWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.5, sh * 0.4, sw * 0.2, sh);
    orangeWave.lineTo(0, sh);
    orangeWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(orangeWave, paint);

    //grey
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(sw * 0.9, sh * 0.2, sw * 0.25, sh * 0.35, 0, sh * 0.2);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
