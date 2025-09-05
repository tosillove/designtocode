import 'package:flutter/material.dart';

/*
 * DotWidget class: A widget that draws a dot indicating a selected state.
 *
 * @param key The unique key for the widget
 * @param selected Whether the dot is in a selected state (default: true)
 * @param strokeWidth The width of the dot's border (default: 2)
 * @param ovalSelectedFillsColor The fill color of the dot when selected (default: Colors.white)
 * @param ovalSelectedBordersColor The border color of the dot when selected (default: Colors.black)
 * @param ovalOverLayColor The overlay color of the dot when not selected (default: Color(0xff8E8E8E))
 */
class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    this.selected = true,
    this.strokeWidth = 2,
    this.ovalSelectedFillsColor = Colors.white,
    this.ovalSelectedBordersColor = Colors.black,
    this.ovalOverLayColor = const Color(0xff8E8E8E),
  });

  final bool selected;
  final double strokeWidth;
  final Color ovalSelectedFillsColor;
  final Color ovalSelectedBordersColor;
  final Color ovalOverLayColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DotPainter(
                selected: selected,
                strokeWidth: strokeWidth,
                ovalSelectedFillsColor: ovalSelectedFillsColor,
                ovalSelectedBordersColor: ovalSelectedBordersColor,
                ovalOverLayColor: ovalOverLayColor
                ),
    );
  }
}

/*
 * DotPainter class: A CustomPainter that draws the dot for DotWidget.
 *
 * @param selected Whether the dot is in a selected state (default: true)
 * @param strokeWidth The width of the dot's border (default: 2)
 * @param ovalSelectedFillsColor The fill color of the dot when selected (default: Colors.white)
 * @param ovalSelectedBordersColor The border color of the dot when selected (default: Colors.black)
 * @param ovalOverLayColor The overlay color of the dot when not selected (default: Color(0xff8E8E8E))
 */
class DotPainter extends CustomPainter {
  DotPainter({
    this.selected = true,
    this.strokeWidth = 2,
    this.ovalSelectedFillsColor = Colors.white,
    this.ovalSelectedBordersColor = Colors.black,
    this.ovalOverLayColor = const Color(0xff8E8E8E),
  });

  final bool selected;
  final double strokeWidth;
  final Color ovalSelectedFillsColor;
  final Color ovalSelectedBordersColor;
  final Color ovalOverLayColor;

  /*
   * Paints the dot.
   *
   * @param canvas The canvas on which to draw the dot
   * @param size The size of the dot
   */
  @override
  void paint(Canvas canvas, Size size) {
    var paintCenter = Paint()
      ..color = selected ? ovalSelectedFillsColor : Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.fill;
    var paintStoke = Paint()
      ..color = ovalSelectedBordersColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paintOverLay = Paint()
      ..color = ovalOverLayColor.withOpacity(0.6)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    double radius =
        (size.width <= size.height ? size.width / 2 : size.height / 2) -
            strokeWidth;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paintCenter);
    selected
        ? canvas.drawCircle(center, radius + strokeWidth, paintStoke)
        : canvas.drawCircle(center, radius + strokeWidth, paintOverLay);
  }

  /*
   * Determines whether the dot needs to be repainted.
   *
   * @param oldDelegate The previous DotPainter instance
   * @return true if the dot needs to be repainted, false otherwise
   */
  @override
  bool shouldRepaint(covariant DotPainter oldDelegate) {
    return (oldDelegate.selected != selected) ||
        (oldDelegate.strokeWidth != strokeWidth);
  }
}
