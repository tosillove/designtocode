import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * A widget that displays an item tab with customizable properties.
 *
 * This widget supports various styling options and handles hover and selection states.
 */
class ItemTabWidget extends StatelessWidget {
  /*
   * Create a ItemTabWidget
   *
   * @param index The index of the tab item.
   * @param itemCount The total number of tab items.
   * @param hovered Indicates whether the tab item is hovered.
   * @param selected Indicates whether the tab item is selected.
   * @param title The title text to be displayed on the tab item.
   * @param fontSize The font size of the title text.
   * @param tabButtonHeight The height of the tab button.
   * @param tabButtonWidth The width of the tab button.
   * @param tabButtonTextHeight The height of the tab button text.
   * @param tabButtonTextWidth The width of the tab button text.
   * @param tabButtonBgColor The background color of the tab button.
   * @param tabButtonBorderSize The border size of the tab button.
   * @param tabButtonBorderColor The border color of the tab button.
   * @param tabButtonFontColor The font color of the tab button text.
   * @param tabButtonHoveredBgColor The background color of the tab button when hovered.
   * @param tabButtonHoveredBorderColor The border color of the tab button when hovered.
   * @param tabButtonHoveredFontColor The font color of the tab button text when hovered.
   * @param tabButtonSelectedBgColor The background color of the tab button when selected.
   * @param tabButtonSelectedBorderColor The border color of the tab button when selected.
   * @param tabButtonSelectedFontColor The font color of the tab button text when selected.
   */
  const ItemTabWidget(
      {super.key,
      required this.index,
      required this.itemCount,
      required this.hovered,
      required this.selected,
      required this.title,
      this.fontSize = 54,
      this.tabButtonHeight = 96,
      this.tabButtonWidth = 528,
      this.tabButtonTextHeight = 63,
      this.tabButtonTextWidth = 480,
      this.tabButtonBgColor = Colors.transparent,
      this.tabButtonBorderSize = 4,
      this.tabButtonBorderColor = Colors.transparent,
      this.tabButtonFontColor = Colors.white,
      this.tabButtonHoveredBgColor = const Color(0xffffffff),
      this.tabButtonHoveredBgColorOpacity = 0.9,
      this.tabButtonHoveredBorderColor = const Color(0xffffffff),
      this.tabButtonHoveredFontColor = const Color(0xff323232),
      this.tabButtonSelectedBgColor = Colors.transparent,
      this.tabButtonSelectedBorderColor = Colors.white,
      this.tabButtonSelectedFontColor = Colors.white,
      this.semanticLabel = '',
      this.direction = Axis.horizontal,
      this.betweenItems = 6});

  final int index;
  final int itemCount;
  final bool hovered;
  final bool selected;
  final String title;

  final double fontSize;
  final double tabButtonHeight;
  final double tabButtonWidth;
  final double tabButtonTextHeight;
  final double tabButtonTextWidth;
  final Color tabButtonBgColor;
  final double tabButtonBorderSize;
  final Color tabButtonBorderColor;
  final Color tabButtonFontColor;

  final Color tabButtonHoveredBgColor;
  final double tabButtonHoveredBgColorOpacity;
  final Color tabButtonHoveredBorderColor;
  final Color tabButtonHoveredFontColor;

  final Color tabButtonSelectedBgColor;
  final Color tabButtonSelectedBorderColor;
  final Color tabButtonSelectedFontColor;

  final String semanticLabel;
  final Axis direction;
  final double betweenItems;

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: semanticLabel,
        child: UnconstrainedBox(
          child: Container(
              width: tabButtonWidth,
              height: tabButtonHeight,
              margin: getMargin(direction, index, betweenItems),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: hovered
                    ? tabButtonHoveredBgColor.withOpacity(tabButtonHoveredBgColorOpacity)
                    : (selected ? tabButtonSelectedBgColor : tabButtonBgColor),
                borderRadius: BorderRadius.circular(24),
                border: tabButtonBorderSize == 0
                    ? null
                    : Border.all(
                        width: tabButtonBorderSize,
                        color: hovered
                            ? tabButtonHoveredBorderColor
                            : (selected ? tabButtonSelectedBorderColor : tabButtonBorderColor),
                      ),
                boxShadow: [
                  selected
                      ? BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.3),
                          blurRadius: 24,
                          spreadRadius: 0.0,
                          offset: const Offset(0, 40),
                        )
                      : direction == Axis.vertical
                          ? BoxShadow(
                              color: const Color(0xff000000).withOpacity(0.1),
                              blurRadius: 24,
                              spreadRadius: 0.0,
                              offset: const Offset(2, 10),
                            )
                          : const BoxShadow(
                              color: Colors.transparent,
                              blurRadius: 0,
                              spreadRadius: 0.0,
                              offset: Offset(0, 0),
                            )
                ],
              ),
              child: SizedBox(
                width: tabButtonTextWidth,
                height: direction == Axis.vertical
                    ? title.contains(' ')
                        ? tabButtonTextHeight
                        : tabButtonTextHeight/2
                    : tabButtonHeight,
                child: direction == Axis.vertical
                    ? Text(
                        title,
                        textAlign: TextAlign.center,
                        style: _styleTitle(hovered, selected, tabButtonFontColor, tabButtonSelectedFontColor, fontSize),
                      )
                    : WMarquee(
                        text: title,
                        style: _styleTitle(hovered, selected, tabButtonFontColor, tabButtonSelectedFontColor, fontSize),
                        focused: hovered,
                        hoverStyle:
                            _styleTitle(true, selected, tabButtonFontColor, tabButtonSelectedFontColor, fontSize),
                      ),
              )),
        ));
  }

  EdgeInsets getMargin(Axis direction, int index, double betweenItems) {
    EdgeInsets margin = const EdgeInsets.all(0);

    if (direction == Axis.horizontal) {
      margin = index == 0
          ? EdgeInsets.fromLTRB(0, 0, betweenItems, 0)
          : index == itemCount - 1
              ? EdgeInsets.fromLTRB(betweenItems, 0, 0, 0)
              : EdgeInsets.fromLTRB(betweenItems, 0, betweenItems, 0);
    } else {
      margin = index == 0
          ? EdgeInsets.fromLTRB(0, 0, 0, betweenItems)
          : index == itemCount - 1
              ? EdgeInsets.fromLTRB(0, betweenItems, 0, 0)
              : EdgeInsets.fromLTRB(0, betweenItems, 0, betweenItems);
    }
    return margin;
  }

  /*
   * Returns the text style for the title based on the hover and selection states.
   *
   * @param isHovered Indicates whether the tab item is hovered.
   * @param isSelected Indicates whether the tab item is selected.
   * @param tabButtonFontColor The font color of the tab button text.
   * @param tabButtonSelectedFontColor The font color of the tab button text when selected.
   * @param fontSize The font size of the title text.
   * @return The text style for the title.
   */
  TextStyle _styleTitle(
      bool isHovered, bool isSelected, Color tabButtonFontColor, Color tabButtonSelectedFontColor, double fontSize) {
    Color color = tabButtonFontColor;
    if (isHovered) {
      color = tabButtonHoveredFontColor;
    } else if (isSelected) {
      color = tabButtonSelectedFontColor;
    }
    return WFont.instance.semiBold.copyWith(fontSize: fontSize, color: color);
  }
}
