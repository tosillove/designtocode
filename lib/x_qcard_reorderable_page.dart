// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import '/providers/qcard_content_provider.dart';
import 'dart:convert';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plover/plover.dart';

class XQcardReorderablePage extends StatefulWidget {
  const XQcardReorderablePage({super.key});

  @override
  State<StatefulWidget> createState() => XQcardReorderablePageState();
}

class XQcardReorderablePageState extends State<XQcardReorderablePage> {
  late final ReorderableEditController _topController;
  late final ReorderableController _topReorderableController;
  late final WFocusScopeNode _topFocusScopeNode;
  late final WFocusScopeNode _topCardDisplayFocusScope;
  late final ScrollController _topScrollControllerDisplay;
  late final PopupMenuController _topPopupController;
  late final WFocusNode _topItemDragingNode;

  @override
  void initState() {
    super.initState();
    _topController = ReorderableEditController();
    _topReorderableController = ReorderableController();
    _topFocusScopeNode = WFocusScopeNode();
    _topCardDisplayFocusScope = WFocusScopeNode();
    _topScrollControllerDisplay = ScrollController();
    _topPopupController = PopupMenuController();
    _topItemDragingNode = WFocusNode(useStraightOnlyMode: true);
  }

  @override
  void dispose() {
    _topFocusScopeNode.dispose();
    _topCardDisplayFocusScope.dispose();
    _topScrollControllerDisplay.dispose();

    _topItemDragingNode.dispose();
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
                      padding: EdgeInsets.only(
                        left: 0.0,
                        top: 250.0,
                        right: 0.0,
                        bottom: 250.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF000000),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: 3720.0,
                                height: 600.0,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0x7F979797),
                                    width: 6,
                                  ),
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                child: SizedBox(
                                    child: Stack(children: [
                                  Positioned(
                                      left: 1680.0,
                                      top: 100.0,
                                      child: Container(
                                          width: 1680.0,
                                          height: 400.0,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                    width: 1680.0,
                                                    height: 400.0,
                                                    child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          const Text(
                                                            '''To change the layout by moving cards,''',
                                                            style: const TextStyle(
                                                                fontFamily: '''LG Smart UI''',
                                                                fontSize: 60.0,
                                                                height: null,
                                                                fontWeight: FontWeight.w400,
                                                                color: Color(0xFFABAEB3)),
                                                          ),
                                                          Container(
                                                            height: 12.0,
                                                          ),
                                                          Container(
                                                              width: 1680.0,
                                                              height: 200.0,
                                                              padding: EdgeInsets.only(
                                                                left: 60.0,
                                                                top: 0.0,
                                                                right: 0.0,
                                                                bottom: 0.0,
                                                              ),
                                                              child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    const Text(
                                                                      '''1. Select a card and move it to the desired place.''',
                                                                      style: const TextStyle(
                                                                          fontFamily: '''LG Smart UI''',
                                                                          fontSize: 60.0,
                                                                          height: null,
                                                                          fontWeight: FontWeight.w400,
                                                                          color: Color(0xFFABAEB3)),
                                                                    ),
                                                                    Container(
                                                                      height: 12.0,
                                                                    ),
                                                                    const Text(
                                                                      '''2. Press the [OK] button on your remote.''',
                                                                      style: const TextStyle(
                                                                          fontFamily: '''LG Smart UI''',
                                                                          fontSize: 60.0,
                                                                          height: null,
                                                                          fontWeight: FontWeight.w400,
                                                                          color: Color(0xFFABAEB3)),
                                                                    )
                                                                  ])),
                                                          Container(
                                                            height: 12.0,
                                                          ),
                                                          Container(
                                                              width: 1680.0,
                                                              height: 70.0,
                                                              child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    const Text(
                                                                      '''To hide cards, select the''',
                                                                      style: const TextStyle(
                                                                          fontFamily: '''LG Smart UI''',
                                                                          fontSize: 60.0,
                                                                          height: null,
                                                                          fontWeight: FontWeight.w400,
                                                                          color: Color(0xFFABAEB3)),
                                                                    ),
                                                                    Container(
                                                                      width: 12.0,
                                                                    ),
                                                                    SvgPicture.asset(
                                                                        'assets/generated_drawables/ic_button_icon.svg'),
                                                                    Container(
                                                                      width: 12.0,
                                                                    ),
                                                                    const Text(
                                                                      '''button over the card.''',
                                                                      style: const TextStyle(
                                                                          fontFamily: '''LG Smart UI''',
                                                                          fontSize: 60.0,
                                                                          height: null,
                                                                          fontWeight: FontWeight.w400,
                                                                          color: Color(0xFFABAEB3)),
                                                                    )
                                                                  ]))
                                                        ]))
                                              ]))),
                                  Positioned(
                                      left: 491.0,
                                      top: 125.0,
                                      child: Image.asset('assets/generated_drawables/image 1.png',
                                          width: 1008.0, height: 420.0))
                                ]))),
                            Container(
                              height: 100.0,
                            ),
                            Container(
                                width: 3840.0,
                                height: 600.0,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4.0,
                                      blurStyle: BlurStyle.normal,
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 0.0,
                                    )
                                  ],
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FocusScope(
                                          node: _topFocusScopeNode,
                                          child: ReorderableEditHorizontalView(
                                            alignFocusedElement: AlignFocusedElement.neutral,
                                            alignFocusedElementDeltaPixel: 0.0,
                                            animatedScale: 1.2,
                                            animDuration: 500,
                                            autofocus: false,
                                            autoSelectedIndex: null, // 0,
                                            cacheExtent: 0.0,
                                            childMargin: 72.0,
                                            clipBehavior: Clip.none,
                                            controller: _topController,
                                            context: context,
                                            delayAutoScroll: 500,
                                            draggedItemBuilder: (context, i, j) {
                                              return SizedBox(
                                                width: 480.0 + 216,
                                                height: 270.0 + 108,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topCenter,
                                                      child: QCardContentProvider.children[i],
                                                    ),
                                                    Positioned(
                                                      bottom: 138,
                                                      child: SizedBox(
                                                        width: 78,
                                                        height: 78,
                                                        child: Image.asset(
                                                          'assets/compound_images/reorderableedit/ic_edit_arrow_left_n.png',
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      bottom: 138,
                                                      child: SizedBox(
                                                        width: 78,
                                                        height: 78,
                                                        child: Image.asset(
                                                          'assets/compound_images/reorderableedit/ic_edit_arrow_right_n.png',
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      left: 480.0 / 2 + 69,
                                                      child: SizedBox(
                                                        width: 78,
                                                        height: 78,
                                                        child: GestureDetector(
                                                          onTap: () {},
                                                          child: Image.asset(
                                                            'assets/compound_images/reorderableedit/ic_edit_arrow_bottom_n.png',
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            enableAnimation: true,
                                            extendedDxSide: 50.0,
                                            focusOnHover: true,
                                            focusScopeNode: _topCardDisplayFocusScope,
                                            groupLabel: '''''',
                                            initialScrollOffset: 60.0,
                                            isFocusRing: false,
                                            isRtl: false,
                                            isUsingFooterAnimation: false,
                                            isUsingHeaderAnimation: false,
                                            itemBuilder: (context, i, b) {
                                              return QCardContentProvider.children[i];
                                            },
                                            itemDraggingFocusNode: _topItemDragingNode,
                                            itemFitMargin: 108.0,
                                            itemHeight: 270.0,
                                            items: QCardContentProvider.children,
                                            itemWidth: 480.0,
                                            marginDraggingItem: -96.0,
                                            onReorder: (oldIndex, newIndex) {
                                              setState(() {
                                                final QCardListItem element = QCardContentProvider.children[oldIndex];
                                                QCardContentProvider.children.removeAt(oldIndex);
                                                QCardContentProvider.children.insert(newIndex, element);
                                              });
                                            },
                                            popupMenuController: _topPopupController,
                                            reorderableController: _topReorderableController,
                                            scrollController: _topScrollControllerDisplay,
                                            scrollZone: 60.0,
                                            shouldScaleFirstAndLastItemFromEdge: false,
                                            typeVoiceItemTop: VCIntent.delete,
                                          ))
                                    ])),
                            Container(
                              height: 100.0,
                            ),
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
                ],
              ),
            )));
  }
}
