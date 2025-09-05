import 'dart:async';
import 'package:compound_widgets/src/now_streaming/streaming_tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * Represents a streaming tab with a label, ID, focus ID, and an optional selection callback.
 *
 * @param textLabel The label text of the tab.
 * @param id The unique identifier of the tab.
 * @param focusId The focus identifier of the tab.
 * @param onSelect The callback function to be called when the tab is selected.
 */
class StreamingTab {
  final String textLabel;
  final String id;
  final String focusId;
  final void Function(String id)? onSelect;

  const StreamingTab(this.textLabel, this.id, this.focusId, this.onSelect);
}

/*
 * A widget that displays a list of streaming tabs with customizable properties.
 *
 * This widget supports various styling options and handles focus and selection states.
 *
 */
class StreamingTabWidget extends StatefulWidget {
  /*
   * Create a StreamingTabWidget
   *
   * @param groupLabel The label for the group of tabs.
   * @param streamingTabHeight The height of the streaming tab.
   * @param streamingTabWidth The width of the streaming tab.
   * @param streamingTabListWidth The width of the streaming tab list.
   * @param streamingTabListStartMargin The start margin of the streaming tab list.
   * @param streamingTabs The list of streaming tabs.
   * @param tabTitleFontSize The font size of the tab title.
   * @param tabButtonHeight The height of the tab button.
   * @param tabButtonWidth The width of the tab button.
   * @param tabButtonTextHeight The height of the tab button text.
   * @param tabButtonTextWidth The width of the tab button text.
   * @param tabButtonBorderSize The border size of the tab button.
   * @param streamingTabListBgColor The background color of the streaming tab list.
   * @param streamingTabListBgColorOpacity The opacity of the background color.
   * @param streamingTabListBorderColor The border color of the streaming tab list.
   * @param streamingTabListBorderColorOpacity The opacity of the border color.
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
   * @param hoveredTabButtonRadius The border radius of the tab button when hovered.
   */
  StreamingTabWidget(
      {super.key,
      this.groupLabel = 'Tab_streaming',
      this.streamingTabHeight = 120,
      this.streamingTabWidth = 588,
      this.streamingTabListWidth = 2688,
      this.streamingTabListStartMargin = 42,
      this.streamingTabs = const [
        StreamingTab('YouTube', 'youtube', 'focus_id_1', null),
        StreamingTab('Netflix', 'netflix','focus_id_2', null),
        StreamingTab('prime video', 'prime.video', 'focus_id_3', null),
        StreamingTab('hulu', 'hulu', 'focus_id_4', null),
        StreamingTab('Disney', 'disney', 'focus_id_5', null),
      ],
      this.tabTitleFontSize = 48,
      this.tabButtonHeight = 90,
      this.tabButtonWidth = 558,
      this.tabButtonTextHeight = 57,
      this.tabButtonTextWidth = 504,
      this.tabButtonBorderSize = 4,
      this.streamingTabListBgColor = const Color(0xff2D3136),
      this.streamingTabListBgColorOpacity = 1.0,
      this.streamingTabListBorderColor = const Color(0xffAAAAAA),
      this.streamingTabListBorderColorOpacity = 1.0,
      this.tabButtonFontColor = const Color(0xffE6E6E6),
      this.tabButtonBorderColor = Colors.transparent,
      this.tabButtonBgColor = Colors.transparent,
      this.tabButtonHoveredBgColor = const Color(0xffE6E6E6),
      this.tabButtonHoveredBgColorOpacity = 1.0,
      this.tabButtonHoveredBorderColor = Colors.transparent,
      this.tabButtonHoveredFontColor = const Color(0xff4C5059),
      this.tabButtonSelectedFontColor = const Color(0xffE6E6E6),
      this.tabButtonSelectedBorderColor = const Color(0xffAAAAAA),
      this.tabButtonSelectedBgColor = Colors.transparent,
      this.hoveredTabButtonRadius = 18});

  final WTabController wTabController = WTabController();
  final String groupLabel;
  final double streamingTabHeight;
  final double streamingTabWidth;
  final double streamingTabListWidth;
  final double streamingTabListStartMargin;
  final Color streamingTabListBgColor;
  final double streamingTabListBgColorOpacity;
  final Color streamingTabListBorderColor;
  final double streamingTabListBorderColorOpacity;

  final List<StreamingTab> streamingTabs;

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

  final double hoveredTabButtonRadius;

  @override
  State<StreamingTabWidget> createState() => _StreamingTabWidgetState();
}

class _StreamingTabWidgetState extends State<StreamingTabWidget> {
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
    final double horizontalPadding = widget.streamingTabListStartMargin;
    final double verticalPadding = (widget.streamingTabHeight - widget.tabButtonHeight) / 2;

    return WFocusableScope(
      tapByEnter: false,
      focusOnTap: false,
      focusOnHover: false,
      autoFocus: false,
      onFocusChange: (hasFocus) {
        this.hasFocus = hasFocus;
      },
      child: Container(
        height: widget.streamingTabHeight,
        width: widget.streamingTabListWidth,
        padding: EdgeInsetsDirectional.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: widget.streamingTabListBgColor.withOpacity(widget.streamingTabListBgColorOpacity),
        ),
        child: FocusScrollConfig(
          alignFocusedElement: AlignFocusedElement.neutral,
          child: WTabs(
            wTabController: widget.wTabController,
            itemCount: widget.streamingTabs.length,
            direction: Axis.horizontal,
            itemLabel: (index) {
              final model = widget.streamingTabs[index];
              return model.textLabel;
            },
            itemFocusNodeId: (index) {
              final model = widget.streamingTabs[index];
              return model.focusId;
            },
            groupLabel: widget.groupLabel,
            itemBuilder: (index, isHover, isSelected) {
              final model = widget.streamingTabs[index];
              return StreaimngItemTabWidget(
                  index: index,
                  itemCount: widget.streamingTabs.length,
                  hovered: isHover,
                  selected: isSelected,
                  title: model.textLabel,
                  fontSize: widget.tabTitleFontSize,
                  tabButtonHeight: widget.tabButtonHeight,
                  streamingTabWidth: widget.streamingTabWidth,
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
                  hoveredTabButtonRadius: widget.hoveredTabButtonRadius,
                  semanticLabel:  model.textLabel);
            },
            onFocusItemChange: (value, isSelected, index) {
              if (_timer != null) {
                _timer?.cancel();
                _timer = null;
              }
              if (hasFocus) {
                _onFocusItemChange(list: widget.streamingTabs, index: index, value: value);
              } else {
                _timer = Timer(const Duration(milliseconds: 500), () {
                  _onFocusItemChange(list: widget.streamingTabs, index: index, value: value);
                });
              }
            },
          ),
        ),
      ),
    );
  }

  /*
   * Handles the focus item change event.
   *
   * @param list The list of streaming tabs.
   * @param index The index of the focused item.
   * @param value The focus state of the item.
   */
  void _onFocusItemChange({required List<StreamingTab> list, required int index, required bool value}) {
    debugPrint('onFocusItemChange index:$index, value:$value');
    if (prevIndex != index) {
      if (_timer != null) {
        _timer?.cancel();
        _timer = null;
      }
      _timer = Timer(const Duration(milliseconds: 500), () {
        list[index].onSelect?.call(widget.streamingTabs[index].id);
        //debugPrint('callback value:${widget.streamingTabs[index].id}');
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
