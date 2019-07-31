import 'package:flutter/material.dart';
import 'dart:math'   as math;
class MathHelper {
  static Offset getCurrentPosition(GlobalKey key) {
    RenderBox targetRenderBox = key.currentContext.findRenderObject();
    Offset pos = targetRenderBox.localToGlobal(Offset(0, 0));
    return pos;
  }


static Offset getVector(Offset from,Offset to)
{
  double  x = to.dx - from.dx;
  double y = to.dy - from.dy;
  return Offset(x<0?-1:1,y<0?-1:1);
}
  static double getAngleBet2Points(Offset from, Offset to) {
    double y2_y1 = to.dy - from.dy;
    double x2_x1 = to.dx - from.dx;
    return  math.atan2(y2_y1, x2_x1);
  }

  static double getDistanceBet2Points(Offset from, Offset to)
  {
    double x2_x1 = to.dx - from.dx;
    double y2_y1 = to.dy - from.dy;
    double sqr_x2_x1 = x2_x1 * x2_x1;
    double sqr_y2_y1 = y2_y1 * y2_y1;

   return math.sqrt( sqr_x2_x1 + sqr_y2_y1);
  }
}
