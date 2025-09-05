// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';

class AlwaysReady extends StatelessWidget {
  const AlwaysReady({super.key});
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
              color: const Color(0xFF000000),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 2000.0,
                      height: 1022.0,
                      child: ContentListView(
                        paddingLeft: 20.0,
                        paddingTop: 30.0,
                        paddingRight: 20.0,
                        paddingBottom: 20.0,
                        mainAxisSpacing: 40.0,
                        crossAxisSpacing: 20.0,
                        itemWidth: 711,
                        itemHeight: 511,
                        crossAxisCount: 4,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          if (index < 2) {
                            return ContentListItem(
                              title: 'Title_$index',
                              imgUrl: 'assets/compound_images/contentlist/Rectangle_$index.webp',
                              borderColorOpacity: 0.0,
                            );
                          } else {
                            return ContentListItem(
                              title: 'Title_$index',
                              imgUrl: 'assets/compound_images/contentlist/Rectangle_$index.webp',
                              isDownload: true,
                              borderColorOpacity: 0.0,
                            );
                          }
                        },
                      ))
                ])));
  }
}
