import 'package:flutter/material.dart';

class DashbordCutompainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //create all value here
    final Size(:width, :height) = size;
    double cornerLength = 9;

    //topLeft value
    final pointOne = Offset(0, cornerLength);
    final pointTwo = Offset(0, 0);
    final pointOneLeft = Offset.zero;
    final pointTwoleft = Offset(cornerLength, 0);

    //topRightLine
    final pointRightOne = Offset(width - cornerLength, 0);
    final pointRightTwo = Offset(width, 0);
    final one = Offset(width, 0);
    final two = Offset(width, cornerLength);

    //bottom left line
    final bottomLeftOne = Offset(0, height - cornerLength);
    final bottomLeftTwo = Offset(0, height);
    final leftOne = Offset(0, height);
    final leftTwo = Offset(cornerLength, height);

    //bottom right line
    final bottomRightone = Offset(width - cornerLength, height);
    final bottomRightTwo = Offset(width, height);
    final rightOne = Offset(width, height - cornerLength);
    final rightTwo = Offset(width, height);

    //create paint here
    final paint = Paint()
      ..color = Colors.black45
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    //draw diagram here
    //drawtop leftLine
    canvas.drawLine(pointOne, pointTwo, paint);
    canvas.drawLine(pointOneLeft, pointTwoleft, paint);

    //drawtop RightLine
    canvas.drawLine(pointRightOne, pointRightTwo, paint);
    canvas.drawLine(one, two, paint);

    //draw bottom lef line
    canvas.drawLine(bottomLeftOne, bottomLeftTwo, paint);
    canvas.drawLine(leftOne, leftTwo, paint);

    //draw bootom right line
    canvas.drawLine(bottomRightone, bottomRightTwo, paint);
    canvas.drawLine(rightOne, rightTwo, paint);
  }

  @override
  bool shouldRepaint(DashbordCutompainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DashbordCutompainter oldDelegate) => false;
}
