// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import "/tabs/home_tab/always_ready.dart";
import "/tabs/home_tab/discovery.dart";
import "/tabs/home_tab/home.dart";
import '/mock/mock_compound_content.dart';
import '/providers/app_list_content_provider.dart';
import '/providers/qcard_content_provider.dart';
import '/providers/shelves_content_provider.dart';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class TNativePage extends StatelessWidget {
  const TNativePage({super.key});

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: 3840.0,
                                height: 186.0,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF000000),
                                ),
                                child: SizedBox(
                                    child: Stack(children: [
                                  Positioned(
                                      left: 2900.0,
                                      child: GlobalLineWidget(
                                          leftMargin: 0.0,
                                          rightMargin: 0.0,
                                          childMargin: 48.0,
                                          itemWidth: 126.0,
                                          itemHeight: 126.0,
                                          buttonColor: Color(0xFFE6E6E6),
                                          borderSize: 0.0,
                                          borderColor: Color(0x00FFFFFF),
                                          hoveredButtonColor: Color(0xFF4C5059),
                                          hoveredBorderSize: 0.0,
                                          hoveredBorderColor: Color(0xFFFFFFFF),
                                          backgroundColor: Color(0xFF000000),
                                          hoveredBackgroundColor: Color(0xFFE6E6E6),
                                          globalLineHeight: 126.0,
                                          globalLineWidth: 822.0,
                                          globalLineHorizontal: true,
                                          globalLineBottomMargin: 10.0,
                                          imageFolderPath: '''assets/compound_images/4k/''',
                                          notiCount: 1,
                                          notiCounterIcon: '''ic_notice_n.png''',
                                          notiCounterBadgeBackgroundColor: Color(0xFFFF5454),
                                          notiCounterWidgetBadgeCurWidth: 42.0,
                                          notiCounterWidgetBadgeCurWidthBigSize: 66.0,
                                          notiCounterWidgetBadgeCurLeftPos: 63.0,
                                          notiCounterWidgetBadgeCurLeftPosBigSize: 57.0,
                                          notiCounterWidgetBadgeTopPosition: 9.0,
                                          notiCounterWidgetBadgeHeight: 42.0,
                                          notiCounterWidgetBadgeBorderRadius: 21.0,
                                          notiCounterWidgetBadgeFontSize: 30.0,
                                          notiCounterWidgetBadgeFontColor: Color(0xFFE6E6E6),
                                          loginId: '''''',
                                          accountLabelWidgetAccountSize: 96.0,
                                          accountLabelWidgetAccountFontSize: 60.0,
                                          accountLabelWidgetColor: Color(0xFFBF4658),
                                          noSignedIcon: '''ic_signin_n.png''')),
                                  Positioned(
                                      left: 120.0,
                                      top: 11.0,
                                      child: TimeInfoWidget(
                                          timeInfoHeight: 105.0,
                                          timeInfoWidth: 330.0,
                                          fontColor: Color(0xFFFFFFFF),
                                          fontSize: 72.0,
                                          fontWeight: FontWeight.w300,
                                          letterSpacingHourMin: 3.0,
                                          letterSpacingAmpm: 6.0,
                                          hourMinuteWidth: 200.0,
                                          hourMinuteHeight: 84.0,
                                          ampmWidth: 130.0,
                                          ampmHeight: 105.0,
                                          format24Hour: false,
                                          bgColor: Color(0x00000000),
                                          borderSize: 0.0,
                                          borderRadius: 0.0,
                                          borderColor: Color(0x00FFFFFF),
                                          bgOpacity: 1.0))
                                ]))),
                            Container(
                              height: 60.0,
                            ),
                            GenericTabWidget(
                              direction: Axis.horizontal,
                              betweenItems: 6.0,
                              contentWidth: 3840.0,
                              contentHeight: 1800.0,
                              groupLabel: '''Tab_common_hometab''',
                              genericTabHeight: 87.0,
                              genericTabWidth: 352.0,
                              genericTabListBorderSize: 4.0,
                              genericTabs: [
                                '''Always Ready''',
                                '''Home''',
                                '''Discovery''',
                              ],
                              initialIndex: 1,
                              tabTitleFontSize: 34.0,
                              tabButtonHeight: 75.0,
                              tabButtonWidth: 340.0,
                              tabButtonTextHeight: 50.0,
                              tabButtonTextWidth: 480.0,
                              tabButtonBorderSize: 0.0,
                              genericTabListBgColor: Color(0xFF000000),
                              genericTabListBgColorOpacity: 0.1,
                              genericTabListBorderColor: Color(0xFFFFFFFF),
                              genericTabListBorderColorOpacity: 0.4,
                              tabButtonFontColor: Color(0xFFFFFFFF),
                              tabButtonBorderColor: Color(0xFFFFFFFF),
                              tabButtonBgColor: Color(0xFF000000),
                              tabButtonHoveredBgColor: Color(0xFFFFFFFF),
                              tabButtonHoveredBgColorOpacity: 0.9,
                              tabButtonHoveredBorderColor: Color(0xFFFFFFFF),
                              tabButtonHoveredFontColor: Color(0xFF323232),
                              tabButtonSelectedFontColor: Color(0xFFFFFFFF),
                              tabButtonSelectedBorderColor: Color(0xFFFFFFFF),
                              tabButtonSelectedBgColor: Color(0xFF000000),
                              children: [AlwaysReady(), Home(), Discovery()],
                            )
                          ]))
                ],
              ),
            )));
  }
}
