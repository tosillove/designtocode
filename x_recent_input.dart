// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import '/mock/mock_compound_content.dart';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class XRecentInput extends StatelessWidget {
  const XRecentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusRootScope(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecentInputCard(
                      borderImage: '''assets/compound_images/recent/border_rectangle.png''',
                      captionHeight: 62.0,
                      captionImageUri: '''assets/compound_images/recent/ic_live_badge.png''',
                      captionLeftPadding: 6.0,
                      captionTopPadding: 12.0,
                      captionWidth: 132.0,
                      enableLiveCaption: true,
                      enableShadow: false,
                      height: 270.0,
                      hoverTextStyle: const TextStyle(
                          fontFamily: '''LG Smart UI''',
                          fontSize: 54.0,
                          height: 1.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF)),
                      imageUri: '''assets/compound_images/recent/PIP.webp''',
                      shadowImageUri: '''null''',
                      strokeColor: Color(0xFFFFFFFF),
                      strokeThickness: 2.0,
                      textStyle: const TextStyle(
                          fontFamily: '''LG Smart UI''',
                          fontSize: 54.0,
                          height: 1.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF)),
                      title: '''Mocked Recent Input''',
                      titleAreaHeight: 49.0,
                      titleAreaWidth: 444.0,
                      titleLeftPadding: 12.0,
                      titleTopPadding: 210.0,
                      width: 445.0)
                ],
              ),
            )));
  }
}
