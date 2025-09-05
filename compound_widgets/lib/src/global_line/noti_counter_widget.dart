import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * A widget that displays a notification counter badge.
 * The badge shows the number of notifications and adjusts its size and position based on the count.
 */
class NotiCounterWidget extends StatelessWidget {
  /*
   * Creates a NotiCounterWidget.
   *
   * @param notiCount The count of notifications. Defaults to 1.
   * @param notiCounterWidgetBadgeCurWidth The current width of the notification badge. Defaults to 42.
   * @param notiCounterWidgetBadgeCurWidthBigSize The big size width of the notification badge. Defaults to 66.
   * @param notiCounterWidgetBadgeCurLeftPos The left position of the notification badge. Defaults to 63.
   * @param notiCounterWidgetBadgeCurLeftPosBigSize The big size left position of the notification badge. Defaults to 57.
   * @param notiCounterWidgetBadgeTopPosition The top position of the notification badge. Defaults to 9.
   * @param notiCounterWidgetBadgeHeight The height of the notification badge. Defaults to 42.
   * @param notiCounterBadgeBackgroundColor The background color of the notification badge. Defaults to Color(0xffFF5454).
   * @param notiCounterWidgetBadgeBorderRadius The border radius of the notification badge. Defaults to 21.
   * @param notiCounterWidgetBadgeFontSize The font size of the notification badge. Defaults to 30.
   * @param notiCounterWidgetBadgeFontColor The font color of the notification badge. Defaults to Color(0xffE6E6E6).
   * @param notiCounterWidgetBadgeFontWeight The font weight of the notification badge. Defaults to FontWeight.w600.
   */
  const NotiCounterWidget({
    super.key,
    this.notiCount = 1,
    this.notiCounterWidgetBadgeCurWidth = 42,
    this.notiCounterWidgetBadgeCurWidthBigSize = 66,
    this.notiCounterWidgetBadgeCurLeftPos = 63,
    this.notiCounterWidgetBadgeCurLeftPosBigSize = 57,
    this.notiCounterWidgetBadgeTopPosition = 9,
    this.notiCounterWidgetBadgeHeight = 42,
    this.notiCounterBadgeBackgroundColor = const Color(0xffFF5454),
    this.notiCounterWidgetBadgeBorderRadius = 21,
    this.notiCounterWidgetBadgeFontSize = 30,
    this.notiCounterWidgetBadgeFontColor = const Color(0xffE6E6E6),
    this.notiCounterWidgetBadgeFontWeight = FontWeight.w600
  });

  final int notiCount;
  final double notiCounterWidgetBadgeCurWidth;
  final double notiCounterWidgetBadgeCurWidthBigSize;
  final double notiCounterWidgetBadgeCurLeftPos;
  final double notiCounterWidgetBadgeCurLeftPosBigSize;
  final double notiCounterWidgetBadgeTopPosition;
  final double notiCounterWidgetBadgeHeight;
  final Color notiCounterBadgeBackgroundColor;
  final double notiCounterWidgetBadgeBorderRadius;
  final double notiCounterWidgetBadgeFontSize;
  final Color notiCounterWidgetBadgeFontColor;
  final FontWeight notiCounterWidgetBadgeFontWeight;

  @override
  Widget build(BuildContext context) {
    String badgeText = '$notiCount';
    double curWidth = notiCounterWidgetBadgeCurWidth;
    double curLeftPos = notiCounterWidgetBadgeCurLeftPos;

    if (notiCount > 99) {
      badgeText = '99+';
      curWidth = notiCounterWidgetBadgeCurWidthBigSize;
      curLeftPos = notiCounterWidgetBadgeCurLeftPosBigSize;
    }

    if (notiCount == 0) {
      return const SizedBox.shrink();
    } else {
      return Positioned(
        top: notiCounterWidgetBadgeTopPosition,
        left: curLeftPos,
        child: Container(
          width: curWidth,
          height: notiCounterWidgetBadgeHeight,
          decoration: BoxDecoration(
            color: notiCounterBadgeBackgroundColor,
            borderRadius: BorderRadius.circular(notiCounterWidgetBadgeBorderRadius),
          ),
          child: Center(
            child: Text(
              badgeText,
              style: WFont.instance.semiBold.copyWith(
                  fontFamily: WFont.defaultFont().first,
                  fontFamilyFallback: WFont.defaultFont(),
                  fontWeight: notiCounterWidgetBadgeFontWeight,
                  fontSize: notiCounterWidgetBadgeFontSize,
                  color: notiCounterWidgetBadgeFontColor),
            ),
          ),
        ),
      );
    }
  }
}
