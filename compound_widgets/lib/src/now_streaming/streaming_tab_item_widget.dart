import 'package:flutter/material.dart';
import 'package:plover/plover.dart';
/*
 * A widget that displays a streaming item tab with customizable properties.
 *
 * This widget is designed to show a tab item with a title and various styling options.
 * It supports hover and selection states with different styles for each state.
 */
class StreaimngItemTabWidget extends StatelessWidget {
  /*
  * Create a StreaimngItemTabWidget
  *
  * @param index The index of the tab item.
  * @param itemCount The total number of tab items.
  * @param hovered Indicates whether the tab item is hovered.
  * @param selected Indicates whether the tab item is selected.
  * @param title The title text to be displayed on the tab item.
  * @param fontSize The font size of the title text.
  * @param tabButtonHeight The height of the tab button.
  * @param tabButtonWidth The width of the tab button.
  * @param streamingTabWidth The width of the streaming tab.
  * @param tabButtonTextHeight The height of the tab button text.
  * @param tabButtonTextWidth The width of the tab button text.
  * @param tabButtonBgColor The background color of the tab button.
  * @param tabButtonBorderSize The border size of the tab button.
  * @param tabButtonBorderColor The border color of the tab button.
  * @param tabButtonFontColor The font color of the tab button text.
  * @param tabButtonHoveredBgColor The background color of the tab button when hovered.
  * @param tabButtonHoveredBgColorOpacity The opacity of the background color when hovered.
  * @param tabButtonHoveredBorderColor The border color of the tab button when hovered.
  * @param tabButtonHoveredFontColor The font color of the tab button text when hovered.
  * @param tabButtonSelectedBgColor The background color of the tab button when selected.
  * @param tabButtonSelectedBorderColor The border color of the tab button when selected.
  * @param tabButtonSelectedFontColor The font color of the tab button text when selected.
  * @param hoveredTabButtonRadius The border radius of the tab button when hovered.
  */
  const StreaimngItemTabWidget(
      {super.key,
      required this.index,
      required this.itemCount,
      required this.hovered,
      required this.selected,
      required this.title,
      this.fontSize = 48,
      this.tabButtonHeight = 90,
      this.tabButtonWidth = 558,
      this.streamingTabWidth = 588,
      this.tabButtonTextHeight = 57,
      this.tabButtonTextWidth = 504,
      this.tabButtonBgColor = Colors.transparent,
      this.tabButtonBorderSize = 4,
      this.tabButtonBorderColor = Colors.transparent,
      this.tabButtonFontColor = const Color(0xffE6E6E6),
      this.tabButtonHoveredBgColor = const Color(0xffE6E6E6),
      this.tabButtonHoveredBgColorOpacity = 1.0,
      this.tabButtonHoveredBorderColor = Colors.transparent,
      this.tabButtonHoveredFontColor = const Color(0xff4C5059),
      this.tabButtonSelectedBgColor = Colors.transparent,
      this.tabButtonSelectedBorderColor = const Color(0xffAAAAAA),
      this.tabButtonSelectedFontColor = const Color(0xffE6E6E6),
      this.hoveredTabButtonRadius = 18,
      this.semanticLabel = ''});

  final int index;
  final int itemCount;
  final bool hovered;
  final bool selected;
  final String title;

  final double fontSize;
  final double tabButtonHeight;
  final double tabButtonWidth;
  final double streamingTabWidth;
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

  final double hoveredTabButtonRadius;

  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    double horizontalMargin = (streamingTabWidth - tabButtonWidth) / 2;
    return Semantics(
        label: semanticLabel,
        child: UnconstrainedBox(
          child: Container(
              width: tabButtonWidth,
              height: tabButtonHeight,
              margin: EdgeInsets.fromLTRB(horizontalMargin, 0, horizontalMargin, 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: hovered
                    ? tabButtonHoveredBgColor.withOpacity(tabButtonHoveredBgColorOpacity)
                    : (selected ? tabButtonSelectedBgColor : tabButtonBgColor),
                borderRadius: (hovered || selected) ? BorderRadius.circular(hoveredTabButtonRadius) : null,
                border: Border.all(
                  width: tabButtonBorderSize,
                  color: hovered
                      ? tabButtonHoveredBorderColor
                      : (selected ? tabButtonSelectedBorderColor : tabButtonBorderColor),
                ),
                boxShadow: [
                  (hovered || selected)
                      ? BoxShadow(
                          color: const Color(0xff000000).withOpacity(0.3),
                          blurRadius: 24,
                          spreadRadius: 0.0,
                          offset: const Offset(0, 40),
                        )
                      : const BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 40),
                        )
                ],
              ),
              child: SizedBox(
                width: tabButtonTextWidth,
                height: tabButtonTextHeight,
                child: WMarquee(
                  text: title,
                  style: _styleTitle(hovered, selected, tabButtonFontColor, tabButtonSelectedFontColor, fontSize),
                  focused: hovered,
                  hoverStyle: _styleTitle(true, selected, tabButtonFontColor, tabButtonSelectedFontColor, fontSize),
                ),
              )),
        ));
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
