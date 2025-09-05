// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import '/providers/app_list_content_provider.dart';
import '/providers/qcard_content_provider.dart';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: 3840.0,
            height: 1800.0,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.only(
              left: 0.0,
              top: 100.0,
              right: 0.0,
              bottom: 100.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF050505),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  QCardListView(
                      height: 270.0,
                      cacheExtent: 0.0,
                      animatedScale: 1.15,
                      animDuration: 400,
                      childMargin: 72.0,
                      delayAutoScroll: 500,
                      direction: Axis.horizontal,
                      initialOfFocused: 0,
                      isChangedUser: false,
                      itemCount: 8,
                      itemBuilder: (context, index, isFocus) {
                        return QCardContentProvider.children[index % QCardContentProvider.children.length];
                      },
                      leftArrowHeight: 126.0,
                      leftArrowImageFocus: '''assets/compound_images/qcard/arrow_more_l_f.png''',
                      leftArrowMargin: EdgeInsets.only(
                        left: 0.0,
                        top: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                      ),
                      leftArrowImageNormal: '''assets/compound_images/qcard/arrow_more_l_n.png''',
                      leftArrowWidth: 126.0,
                      padding: EdgeInsets.only(
                        left: 0.0,
                        top: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                      ),
                      rightArrowHeight: 126.0,
                      rightArrowImageFocus: '''assets/compound_images/qcard/arrow_more_r_f.png''',
                      rightArrowMargin: EdgeInsets.only(
                        left: 0.0,
                        top: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                      ),
                      rightArrowImageNormal: '''assets/compound_images/qcard/arrow_more_r_n.png''',
                      rightArrowWidth: 126.0,
                      scrollZone: 60.0,
                      shelfId: '''''',
                      shouldScaleFirstAndLastItemFromEdge: true,
                      speedScrolling: 1.0,
                      width: 2880.0),
                  Container(
                    height: 100.0,
                  ),
                  AppList(
                      rows: 2,
                      width: 2880.0,
                      height: 800.0,
                      crossAxisCount: 8,
                      itemCount: 16,
                      mainAxisSpacing: 96.0,
                      crossAxisSpacing: 0.0,
                      padding: EdgeInsets.only(
                        left: 0.0,
                        top: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                      ),
                      itemWidth: 360,
                      itemHeight:
                          360, // This is made on purpose to make the container square, but allow inner content to be rectangular
                      itemBuilder: (context, index) {
                        return AppListContentProvider.children[index % AppListContentProvider.children.length];
                      }),
                  Container(
                    height: 100.0,
                  ),
                  Container(
                      width: 3840.0,
                      height: 128.0,
                      padding: EdgeInsets.only(
                        left: 10.0,
                        top: 10.0,
                        right: 10.0,
                        bottom: 10.0,
                      ),
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
                                  fontSize: 60.0,
                                  height: 1.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFFFFF)),
                              minWidth: true,
                              onPressed: () {
                                Navigator.of(context).pushNamed('/x_qcard_reorderable_page');
                              },
                              selected: false,
                              semanticsLabel: '''semanticsLabel''',
                              semanticButton: false,
                              size: ButtonSize.small,
                              text: '''QCard edit''',
                              textStyle: const TextStyle(
                                  fontFamily: null,
                                  fontSize: 60.0,
                                  height: 1.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFFFFF)),
                              tooltipType: WTooltipType.balloon,
                            ),
                            Container(
                              width: 50.0,
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
                                  fontSize: 60.0,
                                  height: 1.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFFFFF)),
                              minWidth: true,
                              onPressed: () {
                                Navigator.of(context).pushNamed('/x_app_list_reorderable_page');
                              },
                              selected: false,
                              semanticsLabel: '''semanticsLabel''',
                              semanticButton: false,
                              size: ButtonSize.small,
                              text: '''AppList edit''',
                              textStyle: const TextStyle(
                                  fontFamily: null,
                                  fontSize: 60.0,
                                  height: 1.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFFFFFFF)),
                              tooltipType: WTooltipType.balloon,
                            )
                          ]))
                ])));
  }
}
