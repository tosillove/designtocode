import 'package:flutter/material.dart';
import 'dot_widget.dart';

/*
 * IndicatorWidget class: A widget that displays a series of dots indicating a selection state.
 * This widget is useful for indicating the current position in a set of items, such as a page indicator.
 */
class IndicatorWidget extends StatelessWidget {
  /*
   * Creates an instance of IndicatorWidget.
   *
   * @param total The total number of dots to display (default: 5)
   * @param selectedIndex The index of the currently selected dot (default: 1)
   * @param width The width of each dot (default: 24)
   * @param height The height of each dot (default: 24)
   * @param strokeWidth The width of the dot's border (default: 2)
   * @param ovalSelectedFillsColor The fill color of the dot when selected (default: Colors.white)
   * @param ovalSelectedBordersColor The border color of the dot when selected (default: Colors.black)
   * @param ovalOverLayColor The overlay color of the dot when not selected (default: Color(0xff8E8E8E))
   */
  const IndicatorWidget({
    super.key,
    this.total = 5,
    this.selectedIndex = 1,
    this.width = 24,
    this.height = 24,
    this.strokeWidth = 2,
    this.ovalSelectedFillsColor = Colors.white,
    this.ovalSelectedBordersColor = Colors.black,
    this.ovalOverLayColor = const Color(0xff8E8E8E),
  });

  final int total;
  final int selectedIndex;
  final double width;
  final double height;
  final double strokeWidth;
  final Color ovalSelectedFillsColor;
  final Color ovalSelectedBordersColor;
  final Color ovalOverLayColor;

  @override
  Widget build(BuildContext context) {
    var listDot = <Widget>[];
    for (int i = 0; i < total; i++) {
      listDot.add(SizedBox(
          height: height,
          width: width,
          child: DotWidget(
                  selected: i == selectedIndex,
                  strokeWidth: strokeWidth,
                  ovalSelectedFillsColor: ovalSelectedFillsColor,
                  ovalSelectedBordersColor: ovalSelectedBordersColor,
                  ovalOverLayColor: ovalOverLayColor,
                )
              )
            );
    }
    return Wrap(
      spacing: 12,
      children: listDot,
    );
  }
}