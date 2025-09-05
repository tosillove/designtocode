import 'dart:async';

import 'package:compound_widgets/src/tab/tab_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * Represents a home tab with a label, focus ID, and an optional selection callback.
 *
 * @param textLabel The label text of the tab.
 * @param focusId The focus identifier of the tab.
 * @param onSelect The callback function to be called when the tab is selected.
 */
class HomeTab {
  final String textLabel;
  final String focusId;
  final void Function()? onSelect;

  const HomeTab(this.textLabel, this.focusId, this.onSelect);
}

/*
 * A widget that displays a list of home tabs with customizable properties.
 *
 * This widget supports various styling options and handles focus and selection states.
 */
class HomeTabWidget extends StatefulWidget {
  /*
   * Create a homeTabWidget
   *
   * @param groupLabel The label for the group of tabs.
   * @param homeTabHeight The height of the home tab.
   * @param homeTabWidth The width of the home tab.
   * @param homeTabListBorderSize The border size of the home tab list.
   * @param homeTabs The list of home tabs.
   * @param tabTitleFontSize The font size of the tab title.
   * @param tabButtonHeight The height of the tab button.
   * @param tabButtonWidth The width of the tab button.
   * @param tabButtonTextHeight The height of the tab button text.
   * @param tabButtonTextWidth The width of the tab button text.
   * @param tabButtonBorderSize The border size of the tab button.
   * @param homeTabListBgColor The background color of the home tab list.
   * @param homeTabListBgColorOpacity The opacity of the background color.
   * @param homeTabListBorderColor The border color of the home tab list.
   * @param homeTabListBorderColorOpacity The opacity of the border color.
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
  HomeTabWidget(
      {super.key,
      this.groupLabel = 'Tab_common_hometab',
      this.homeTabHeight = 108,
      this.homeTabWidth = 540,
      this.homeTabListBorderSize = 4,
      this.homeTabs = const [
        HomeTab('Always Ready', 'focus_id_always_ready', null),
        HomeTab('Home', 'focus_id_home_app', null),
        HomeTab('Discovery', 'focus_id_discovery', null),
      ],
      this.tabTitleFontSize = 56,
      this.tabButtonHeight = 96,
      this.tabButtonWidth = 528,
      this.tabButtonTextHeight = 63,
      this.tabButtonTextWidth = 480,
      this.tabButtonBorderSize = 4,
      this.homeTabListBgColor = const Color(0xff000000),
      this.homeTabListBgColorOpacity = 0.3,
      this.homeTabListBorderColor = const Color(0xffffffff),
      this.homeTabListBorderColorOpacity = 0.4,
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
      this.direction = Axis.horizontal,
      this.betweenItems = 6});

  final WTabController wTabController = WTabController();
  final String groupLabel;
  final double homeTabHeight;
  final double homeTabWidth;
  final double homeTabListBorderSize;
  final Color homeTabListBgColor;
  final double homeTabListBgColorOpacity;
  final Color homeTabListBorderColor;
  final double homeTabListBorderColorOpacity;

  final List<HomeTab> homeTabs;

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
  final Axis direction;
  final double betweenItems;

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
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
    final double horizontalPadding = (widget.homeTabWidth - widget.tabButtonWidth) / 2 - widget.homeTabListBorderSize;
    final double verticalPadding = (widget.homeTabHeight - widget.tabButtonHeight) / 2 - widget.homeTabListBorderSize;
    return WFocusableScope(
        tapByEnter: false,
        focusOnTap: false,
        focusOnHover: false,
        autoFocus: false,
        onFocusChange: (hasFocus) {
          this.hasFocus = hasFocus;
        },
        child: Container(
          alignment: Alignment.center,
          width: widget.direction == Axis.horizontal
              ? widget.homeTabWidth * widget.homeTabs.length
              : widget.homeTabWidth + widget.betweenItems*2,
          height: widget.direction == Axis.horizontal
              ? widget.homeTabHeight + widget.betweenItems*2
              : widget.homeTabHeight * widget.homeTabs.length,
          child: Container(
            height: widget.direction == Axis.horizontal
                ? widget.homeTabHeight
                : widget.homeTabHeight * widget.homeTabs.length,
            width: widget.direction == Axis.horizontal
                ? widget.homeTabWidth * widget.homeTabs.length
                : widget.homeTabWidth,
            padding: EdgeInsetsDirectional.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            decoration: BoxDecoration(
              color: widget.homeTabListBgColor.withOpacity(widget.homeTabListBgColorOpacity),
              border: widget.homeTabListBorderSize == 0
                  ? null
                  : Border.all(
                      color: widget.homeTabListBorderColor.withOpacity(widget.homeTabListBorderColorOpacity),
                      width: widget.homeTabListBorderSize),
              borderRadius: BorderRadius.circular(30),
            ),
            child: FocusScrollConfig(
              alignFocusedElement: AlignFocusedElement.neutral,
              child: WTabs(
                initialTabIndex: widget.initialIndex,
                wTabController: widget.wTabController,
                itemCount: widget.homeTabs.length,
                direction: widget.direction,
                itemLabel: (index) {
                  final model = widget.homeTabs[index];
                  return model.textLabel;
                },
                itemFocusNodeId: (index) {
                  final model = widget.homeTabs[index];
                  return model.focusId;
                },
                groupLabel: widget.groupLabel,
                itemBuilder: (index, isHover, isSelected) {
                  final model = widget.homeTabs[index];
                  return ItemTabWidget(
                      index: index,
                      itemCount: widget.homeTabs.length,
                      hovered: isHover,
                      selected: isSelected,
                      title: model.textLabel,
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
                      semanticLabel: model.textLabel,
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
                    _onFocusItemChange(list: widget.homeTabs, index: index, value: value);
                  } else {
                    _timer = Timer(const Duration(milliseconds: 500), () {
                      _onFocusItemChange(list: widget.homeTabs, index: index, value: value);
                    });
                  }
                },
              ),
            ),
          ),
        ));
  }
  /*
   * Handles the focus item change event.
   *
   * @param list The list of home tabs.
   * @param index The index of the focused item.
   * @param value The focus state of the item.
   */
  void _onFocusItemChange({required List<HomeTab> list, required int index, required bool value}) {
    debugPrint('onFocusItemChange index:$index, value:$value');
    if (prevIndex != index) {
      if (_timer != null) {
        _timer?.cancel();
        _timer = null;
      }
      _timer = Timer(const Duration(milliseconds: 500), () {
        list[index].onSelect?.call();
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
