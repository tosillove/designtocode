// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import '/providers/app_list_content_provider.dart';
import 'dart:convert';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class XAppListReorderablePage extends StatefulWidget {
  const XAppListReorderablePage({super.key});

  @override
  State<StatefulWidget> createState() => XAppListReorderablePageState();
}

class XAppListReorderablePageState extends State<XAppListReorderablePage> {
  late final ScrollController _controller;
  late final ReorderableGridController _reorderableGridController;
  final List<WFocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _reorderableGridController = ReorderableGridController();
    _focusNodes.addAll(List<WFocusNode>.generate(AppListContentProvider.children.length, (_) => WFocusNode()));
  }

  @override
  void dispose() {
    _controller.dispose();

    _focusNodes.clear();
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
                            Container(
                                width: 3700.0,
                                height: 600.0,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0x7F979797),
                                    width: 6,
                                  ),
                                  borderRadius: BorderRadius.circular(64),
                                ),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/generated_drawables/app_edit.png',
                                          width: 888.0, height: 420.0),
                                      Container(
                                        width: 200.0,
                                      ),
                                      Container(
                                          width: 2000.0,
                                          height: 600.0,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  '''To change the layout by moving apps''',
                                                  style: const TextStyle(
                                                      fontFamily: '''LG Smart UI''',
                                                      fontSize: 60.0,
                                                      height: null,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFFABAEB3)),
                                                ),
                                                Container(
                                                    width: 2000.0,
                                                    height: 300.0,
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
                                                            '''1. Select an app you want to move.''',
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
                                                            '''2. Move it to the desired place.''',
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
                                                            '''3. Press the [OK] button on your remote.''',
                                                            style: const TextStyle(
                                                                fontFamily: '''LG Smart UI''',
                                                                fontSize: 60.0,
                                                                height: null,
                                                                fontWeight: FontWeight.w400,
                                                                color: Color(0xFFABAEB3)),
                                                          )
                                                        ])),
                                                Container(
                                                    width: 2000.0,
                                                    height: 100.0,
                                                    child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          const Text(
                                                            '''To hide apps, select the''',
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
                                                          Image.asset('assets/generated_drawables/eye.png',
                                                              width: 70.0, height: 70.0),
                                                          Container(
                                                            width: 12.0,
                                                          ),
                                                          const Text(
                                                            '''button and to delete apps, ''',
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
                                                          const Text(
                                                            '''select the''',
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
                                                          Image.asset('assets/generated_drawables/delete.png',
                                                              width: 70.0, height: 70.0),
                                                          Container(
                                                            width: 12.0,
                                                          ),
                                                          const Text(
                                                            '''button.''',
                                                            style: const TextStyle(
                                                                fontFamily: '''LG Smart UI''',
                                                                fontSize: 60.0,
                                                                height: null,
                                                                fontWeight: FontWeight.w400,
                                                                color: Color(0xFFABAEB3)),
                                                          )
                                                        ]))
                                              ]))
                                    ])),
                            Container(
                              height: 100.0,
                            ),
                            SizedBox(
                                width: 3200.0,
                                height: 800.0,
                                child: ReorderableGridView(
                                  controller: _controller,
                                  focusNodes: _focusNodes,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 8,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 20,
                                  ),
                                  itemBuilder: (BuildContext context, int index, bool hasFocus, VoidCallback onTab) {
                                    return AppListContentProvider.children[index];
                                  },
                                  itemCount: 16,
                                  onReorder: (oldIndex, newIndex) {
                                    setState(() {
                                      final AppItem element = AppListContentProvider.children[oldIndex];
                                      AppListContentProvider.children.removeAt(oldIndex);
                                      AppListContentProvider.children.insert(newIndex, element);
                                    });
                                  },
                                  reorderableGridController: _reorderableGridController,
                                )),
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
