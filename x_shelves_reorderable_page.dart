// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import '/mock/mock_compound_content.dart';
import '/providers/shelves_content_provider.dart';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class XShelvesReorderablePage extends StatefulWidget {
  const XShelvesReorderablePage({super.key});

  @override
  State<StatefulWidget> createState() => XShelvesReorderablePageState();
}

class XShelvesReorderablePageState extends State<XShelvesReorderablePage> {
  late final ReorderableController _controller;
  late final WFocusScopeNode _focusScopeNode;
  late final WFocusScopeNode _cardDisplayFocusScope;
  late final ScrollController _scrollControllerDisplay;
  late final PopupMenuController _popupController;
  late final WFocusNode _itemDragingNode;

  @override
  void initState() {
    super.initState();
    _controller = ReorderableController();
    _focusScopeNode = WFocusScopeNode();
    _cardDisplayFocusScope = WFocusScopeNode();
    _scrollControllerDisplay = ScrollController();
    _popupController = PopupMenuController();
    _itemDragingNode = WFocusNode(useStraightOnlyMode: true);
  }

  @override
  void dispose() {
    _focusScopeNode.dispose();
    _cardDisplayFocusScope.dispose();
    _scrollControllerDisplay.dispose();

    _itemDragingNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusRootScope(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 3840.0,
                      height: 2160.0,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: const Color(0xFF000000),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ReorderableEditVerticalView(
                              animatedScale: 1.2,
                              animDuration: 500,
                              autofocus: false,
                              autoSelectedIndex: null, // 0,
                              cacheExtent: 0.0,
                              childMargin: 72.0,
                              clipBehavior: Clip.none,
                              controller: _controller,
                              context: context,
                              delayAutoScroll: 500,
                              draggedItemBuilder: (context, index, current) {
                                return Stack(
                                  children: [
                                    Container(
                                      key: ValueKey("shelf_item_$index"),
                                      height: 120.0,
                                      width: 720.0,
                                      alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE6E6E6),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 48),
                                      child: Semantics(
                                          excludeSemantics: true,
                                          child: WMarquee(
                                            text: ShelvesContentProvider.children.map((e) => e.key).toList()[index],
                                            isLtoR: true,
                                            style: WFont.instance.semiBold.copyWith(
                                              fontSize: 60,
                                              color: Color(0xFF4C5059),
                                            ),
                                            hoverStyle: WFont.instance.semiBold.copyWith(
                                              fontSize: 60,
                                              color: Color(0xFF4C5059),
                                            ),
                                          )),
                                    ),
                                    if (current < ShelvesContentProvider.children.length)
                                      Positioned.fill(
                                        child: Align(
                                          alignment: AlignmentDirectional.bottomEnd,
                                          child: Transform.translate(
                                            offset: Offset(-50, 100),
                                            child: Image.asset('assets/compound_images/main/arrow_scroll_down_n.png'),
                                          ),
                                        ),
                                      ),
                                    if (current != 0)
                                      Positioned.fill(
                                        child: Align(
                                          alignment: AlignmentDirectional.bottomEnd,
                                          child: Transform.translate(
                                            offset: Offset(-50, -120),
                                            child: Image.asset('assets/compound_images/main/arrow_scroll_up_n.png'),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                              enableAnimation: true,
                              extendedDxSide: 50.0,
                              focusOnHover: true,
                              focusScopeNode: _cardDisplayFocusScope,
                              groupLabel: '''''',
                              height: 1100.0,
                              initialScrollOffset: 60.0,
                              isFocusRing: false,
                              isRtl: false,
                              itemBuilder: (context, index, isFocus) {
                                return Container(
                                  key: ValueKey("shelf_item_$index"),
                                  height: 120.0,
                                  width: 720.0,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Color(isFocus ? 0xFFE6E6E6 : 0xFF7D848C),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 48),
                                  child: Semantics(
                                      excludeSemantics: true,
                                      child: WMarquee(
                                        text: ShelvesContentProvider.children.map((e) => e.key).toList()[index],
                                        isLtoR: true,
                                        focused: isFocus,
                                        style: WFont.instance.semiBold.copyWith(
                                          fontSize: 60,
                                          color: Color(isFocus ? 0xFF4C5059 : 0xFFE6E6E6),
                                        ),
                                        hoverStyle: WFont.instance.semiBold.copyWith(
                                          fontSize: 60,
                                          color: Color(isFocus ? 0xFF4C5059 : 0xFFE6E6E6),
                                        ),
                                      )),
                                );
                              },
                              itemCount: ShelvesContentProvider.children.length,
                              itemDraggingFocusNode: _itemDragingNode,
                              itemFitMargin: 108.0,
                              itemHeight: 120.0,
                              itemTopKey: (index) {
                                return 'shelfEditPage_$index';
                              },
                              itemRightBuilder: (context, index) {
                                return Row(
                                  children: [
                                    const SizedBox(width: 30),
                                    Image.asset(
                                      'assets/compound_images/reorderableedit/ic_edit_arrow_right_n.png',
                                    ),
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: Text(
                                        'Move',
                                        style: WFont.instance.regular.copyWith(fontSize: 60, color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              itemWidth: 720.0,
                              marginDraggingItem: 180.0,
                              onFocusChange: (hasFocus) {
                                if (hasFocus) {
                                  _controller.stopReorder();
                                }
                              },
                              onReorder: (oldIndex, newIndex) {
                                setState(() {
                                  final item = ShelvesContentProvider.children[oldIndex];
                                  ShelvesContentProvider.children.removeAt(oldIndex);
                                  ShelvesContentProvider.children.insert(newIndex, item);
                                });
                              },
                              popupMenuController: _popupController,
                              scrollController: _scrollControllerDisplay,
                              scrollZone: 60.0,
                              shouldScaleFirstAndLastItemFromEdge: false,
                              typeVoiceItemTop: VCIntent.delete,
                              width: 1194.0,
                              widthItemRight: 444.0,
                            ),
                            Container(
                              height: 100.0,
                            ),
                            Container(
                                width: 3840.0,
                                height: 300.0,
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Button(
                                        autoFocus: false,
                                        backgroundOpacity: ButtonBackgroundOpacity.opaque,
                                        buttonColor: Color(0xFF7D848C),
                                        customIconSize: 60.0,
                                        customSize: null,
                                        disabled: false,
                                        enableAnimation: true,
                                        enableVoiceControl: false,
                                        focusOnHover: false,
                                        groupLabel: '''groupLabel''',
                                        icon: null,
                                        iconFlip: IconFlip.auto,
                                        iconPosition: IconPosition.before,
                                        id: '''''',
                                        interactionTextStyle: const TextStyle(
                                            fontFamily: null,
                                            fontSize: 72.0,
                                            height: 1.0,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFFFFFFF)),
                                        minWidth: true,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        selected: false,
                                        semanticsLabel: '''semanticsLabel''',
                                        semanticButton: false,
                                        size: ButtonSize.large,
                                        text: '''Close''',
                                        textStyle: const TextStyle(
                                            fontFamily: null,
                                            fontSize: 72.0,
                                            height: 1.0,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFFFFFFF)),
                                        tooltipType: WTooltipType.balloon,
                                      )
                                    ]))
                          ]))
                ],
              ),
            )));
  }
}
