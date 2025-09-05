import 'dart:async';

import 'package:compound_widgets/src/tab/tab_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * A widget that displays a list of tabs with customizable properties.
 *
 * This widget supports various styling options and handles focus and selection states.
 */
class GenericTabWidget extends StatefulWidget {
  /*
   * Create a GenericTabWidget
   *
   * @param groupLabel The label for the group of tabs.
   * @param genericTabHeight The height of the tab.
   * @param genericTabWidth The width of the tab.
   * @param genericTabListBorderSize The border size of the tab list.
   * @param genericTabs The list of tabs.
   * @param tabTitleFontSize The font size of the tab title.
   * @param tabButtonHeight The height of the tab button.
   * @param tabButtonWidth The width of the tab button.
   * @param tabButtonTextHeight The height of the tab button text.
   * @param tabButtonTextWidth The width of the tab button text.
   * @param tabButtonBorderSize The border size of the tab button.
   * @param genericTabListBgColor The background color of the tab list.
   * @param genericTabListBgColorOpacity The opacity of the background color.
   * @param genericTabListBorderColor The border color of the tab list.
   * @param genericTabListBorderColorOpacity The opacity of the border color.
   * @param tabButtonFontColor The font color of the tab button text.
   * @param tabButtonBorderColor The border color of the tab button.
   * @param tabButtonBgColor The background color of the tab button.
   * @param tabButtonHoveredBgColor The background color of the tab button when hovered.
   * @param tabButtonHoveredBgColorOpacity The opacity of the background color when hovered.
   * @param tabButtonHoveredBorderColor The border color of the tab button when hovered.
   * @param tabButtonHoveredFontColor The font color of the tab button text when hovered.
   * @param tabButtonSelectedFontColor The font color of the tab button text when selected.
   * @param tabButtonSelectedBorderColor The border color of the tab button when selected.
   * @param tabButtonSelectedBgColor The background color of the tab button when selected.
   */
  GenericTabWidget(
      {super.key,
      this.direction = Axis.horizontal,
      this.contentWidth = 3840.0, //horizontal mode
      this.contentHeight = 1584.0, //horizontal mode: 1968 - 288 - 96;,
      this.groupLabel = 'Tab_common_tab',
      this.genericTabHeight = 108,
      this.genericTabWidth = 540,
      this.genericTabListBorderSize = 4,
      this.genericTabs = const [
        'Always Ready',
        'Home',
        'Discovery',
      ],
      this.children = const [],
      this.tabTitleFontSize = 56,
      this.tabButtonHeight = 96,
      this.tabButtonWidth = 528,
      this.tabButtonTextHeight = 63,
      this.tabButtonTextWidth = 480,
      this.tabButtonBorderSize = 4,
      this.genericTabListBgColor = const Color(0xff000000),
      this.genericTabListBgColorOpacity = 0.3,
      this.genericTabListBorderColor = const Color(0xffffffff),
      this.genericTabListBorderColorOpacity = 0.4,
      this.tabButtonFontColor = Colors.white,
      this.tabButtonBorderColor = Colors.transparent,
      this.tabButtonBgColor = Colors.transparent,
      this.tabButtonHoveredBgColor = const Color(0xffffffff),
      this.tabButtonHoveredBgColorOpacity = 0.9,
      this.tabButtonHoveredBorderColor = const Color(0xffffffff),
      this.tabButtonHoveredFontColor = const Color(0xff323232),
      this.tabButtonSelectedFontColor = Colors.white,
      this.tabButtonSelectedBorderColor = Colors.white,
      this.tabButtonSelectedBgColor = Colors.transparent,
      this.initialIndex = 0,
      this.betweenItems = 6});

  final Axis direction;

  final double contentWidth;
  final double contentHeight;

  final WTabController wTabController = WTabController();
  final String groupLabel;
  final double genericTabHeight;
  final double genericTabWidth;
  final double genericTabListBorderSize;
  final Color genericTabListBgColor;
  final double genericTabListBgColorOpacity;
  final Color genericTabListBorderColor;
  final double genericTabListBorderColorOpacity;

  final List<String> genericTabs;
  final List<Widget> children;
  final double tabTitleFontSize;

  final double tabButtonHeight;
  final double tabButtonWidth;
  final double tabButtonTextHeight;
  final double tabButtonTextWidth;
  final double tabButtonBorderSize;

  final Color tabButtonFontColor;
  final Color tabButtonBorderColor;
  final Color tabButtonBgColor;

  final Color tabButtonHoveredBgColor;
  final double tabButtonHoveredBgColorOpacity;
  final Color tabButtonHoveredBorderColor;
  final Color tabButtonHoveredFontColor;

  final Color tabButtonSelectedBgColor;
  final Color tabButtonSelectedBorderColor;
  final Color tabButtonSelectedFontColor;

  final int initialIndex;
  final double betweenItems;

  @override
  State<GenericTabWidget> createState() => _GenericTabWidgetState();
}

class _GenericTabWidgetState extends State<GenericTabWidget> {
  late int currentTabIndex = widget.initialIndex;
  int? prevIndex;
  bool hasFocus = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = (widget.genericTabWidth - widget.tabButtonWidth) / 2 - widget.genericTabListBorderSize;
    final double verticalPadding = (widget.genericTabHeight - widget.tabButtonHeight) / 2 - widget.genericTabListBorderSize;
    final tabsContainer = Container(
      alignment: Alignment.center,
      width: widget.direction == Axis.horizontal
          ? widget.genericTabWidth * widget.genericTabs.length
          : widget.genericTabWidth + widget.betweenItems * 2,
      height: widget.direction == Axis.horizontal
          ? widget.genericTabHeight + widget.betweenItems * 2
          : widget.genericTabHeight * widget.genericTabs.length,
      child: Container(
        height: widget.direction == Axis.horizontal
            ? widget.genericTabHeight
            : widget.genericTabHeight * widget.genericTabs.length,
        width: widget.direction == Axis.horizontal
            ? widget.genericTabWidth * widget.genericTabs.length
            : widget.genericTabWidth,
        padding: EdgeInsetsDirectional.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: widget.genericTabListBgColor.withOpacity(widget.genericTabListBgColorOpacity),
          border: widget.genericTabListBorderSize == 0
              ? null
              : Border.all(
                  color: widget.genericTabListBorderColor.withOpacity(widget.genericTabListBorderColorOpacity),
                  width: widget.genericTabListBorderSize),
          borderRadius: BorderRadius.circular(30),
        ),
        child: FocusScrollConfig(
          alignFocusedElement: AlignFocusedElement.neutral,
          child: WTabs(
            initialTabIndex: widget.initialIndex,
            wTabController: widget.wTabController,
            itemCount: widget.genericTabs.length,
            direction: widget.direction,
            itemLabel: (index) {
              return widget.genericTabs[index];
            },
            itemFocusNodeId: (index) {
              return 'focus_id${widget.genericTabs[index].replaceAll(RegExp(r'\s+'), '_')}';
            },
            groupLabel: widget.groupLabel,
            itemBuilder: (index, isHover, isSelected) {
              return ItemTabWidget(
                index: index,
                itemCount: widget.genericTabs.length,
                hovered: isHover,
                selected: isSelected,
                title: widget.genericTabs[index],
                fontSize: widget.tabTitleFontSize,
                tabButtonHeight: widget.tabButtonHeight,
                tabButtonWidth: widget.tabButtonWidth,
                tabButtonTextHeight: widget.tabButtonTextHeight,
                tabButtonTextWidth: widget.tabButtonTextWidth,
                tabButtonBorderSize: widget.tabButtonBorderSize,
                tabButtonFontColor: widget.tabButtonFontColor,
                tabButtonBorderColor: widget.tabButtonBorderColor,
                tabButtonBgColor: widget.tabButtonBgColor,
                tabButtonHoveredBgColor: widget.tabButtonHoveredBgColor,
                tabButtonHoveredBgColorOpacity: widget.tabButtonHoveredBgColorOpacity,
                tabButtonHoveredBorderColor: widget.tabButtonHoveredBorderColor,
                tabButtonHoveredFontColor: widget.tabButtonHoveredFontColor,
                tabButtonSelectedBgColor: widget.tabButtonSelectedBgColor,
                tabButtonSelectedBorderColor: widget.tabButtonSelectedBorderColor,
                tabButtonSelectedFontColor: widget.tabButtonSelectedFontColor,
                semanticLabel: widget.genericTabs[index],
                direction: widget.direction,
                betweenItems: widget.betweenItems,
              );
            },
            onFocusItemChange: (value, isSelected, index) {
              if (_timer != null) {
                _timer?.cancel();
                _timer = null;
              }
              if (hasFocus) {
                _onFocusItemChange(list: widget.genericTabs, index: index, value: value);
              } else {
                _timer = Timer(const Duration(milliseconds: 500), () {
                  _onFocusItemChange(list: widget.genericTabs, index: index, value: value);
                });
              }
            },
          ),
        ),
      ),
    );
    return WFocusableScope(
        tapByEnter: false,
        focusOnTap: false,
        focusOnHover: false,
        autoFocus: false,
        onFocusChange: (hasFocus) {
          this.hasFocus = hasFocus;
        },
        child: widget.direction == Axis.vertical
            ? Row(
                children: [
                  tabsContainer,
                  widget.children.isEmpty
                      ? const SizedBox.shrink()
                      : SizedBox(
                          width: widget.contentWidth,
                          height: widget.contentHeight,
                          child: widget.children.length > currentTabIndex ? widget.children[currentTabIndex] : null,
                        )
                ],
              )
            : Column(
                children: [
                  tabsContainer,
                  widget.children.isEmpty
                      ? const SizedBox.shrink()
                      : SizedBox(
                          width: widget.contentWidth,
                          height: widget.contentHeight,
                          child: widget.children.length > currentTabIndex ? widget.children[currentTabIndex] : null,
                        )
                ],
              ));
  }

  /*
   * Handles the focus item change event.
   *
   * @param list The list of tabs.
   * @param index The index of the focused item.
   * @param value The focus state of the item.
   */
  void _onFocusItemChange({required List<String> list, required int index, required bool value}) {
    debugPrint('onFocusItemChange index:$index, value:$value');
    if (prevIndex != index) {
      if (_timer != null) {
        _timer?.cancel();
        _timer = null;
      }
      _timer = Timer(const Duration(milliseconds: 500), () {
        setState(() {
          currentTabIndex = index;
        });
        widget.wTabController.changeTab(index, index);
      });
    }
    if (value) {
      widget.wTabController.changeTab(index, null);
      prevIndex = index;
    } else {
      widget.wTabController.exitTab(index);
    }
  }
}
