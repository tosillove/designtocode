import 'dart:math';
import 'dart:typed_data';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';

import 'package:plover/plover.dart';

class ContentShelfChannelItem extends StatefulWidget {
  const ContentShelfChannelItem({
    super.key,
    this.boxDecoration,
    this.broadcastUtcTime,
    this.channelName = '',
    this.channelNameAlign = WMarqueeAlign.left,
    this.channelNameAlwaysScroll = false,
    this.channelNameImgFit = BoxFit.fill,
    this.channelNameImgHeight = 78,
    this.channelNameImgPadding = EdgeInsets.zero,
    this.channelNameImgUrl = '',
    this.channelNameImgWidth = 152,
    this.channelNameRTL = false,
    this.channelNameMarqueeSpacing = 20,
    this.channelNamePadding = EdgeInsets.zero,
    this.channelNameTextStyle,
    this.channelNameUsingDefaultMouseRegion,
    this.channelNameVelocity = 50,
    this.channelNumber = '',
    this.channelNumberAlign = WMarqueeAlign.left,
    this.channelNumberAlwaysScroll = false,
    this.channelNumberRTL = false,
    this.channelNumberMarqueeSpacing = 20,
    this.channelNumberPadding = const EdgeInsets.only(top: 62),
    this.channelNumberTextStyle,
    this.channelNumberUsingDefaultMouseRegion,
    this.channelNumberVelocity = 50,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.endTime,
    this.height = 432,
    this.iconBoaderRadius,
    this.iconFit = BoxFit.fill,
    this.iconHeight = 60,
    this.iconPadding = const EdgeInsets.only(right: 30),
    this.iconUrl = '',
    this.iconWidth = 60,
    required this.isFocus,
    this.mainAxisSize = MainAxisSize.min,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.only(left: 42, right: 42, top: 78),
    this.progressBackgroundColor = const Color(0xff373A41),
    this.progressColor = const Color(0xffE6E6E6),
    this.progressHeight = 12,
    this.progressPadding = const EdgeInsets.only(top: 54),
    this.semanticsLabel = "",
    this.startTime,
    this.title = '',
    this.titleAlign = WMarqueeAlign.left,
    this.titleAlwaysScroll = false,
    this.titleRTL = false,
    this.titleMarqueeSpacing = 20,
    this.titlePadding = const EdgeInsets.only(top: 5, bottom: 41),
    this.titleStyle,
    this.titleUsingDefaultMouseRegion,
    this.titleVelocity = 50,
    this.width = 426,
  })  : channelNameImgBytes = null,
        iconBytes = null;

  const ContentShelfChannelItem.bytes({
    super.key,
    this.boxDecoration,
    this.broadcastUtcTime,
    this.channelName = '',
    this.channelNameAlign = WMarqueeAlign.left,
    this.channelNameAlwaysScroll = false,
    this.channelNameImgFit = BoxFit.fill,
    this.channelNameImgHeight = 78,
    this.channelNameImgPadding = EdgeInsets.zero,
    this.channelNameImgBytes,
    this.channelNameImgWidth = 152,
    this.channelNameRTL = false,
    this.channelNameMarqueeSpacing = 20,
    this.channelNamePadding = EdgeInsets.zero,
    this.channelNameTextStyle,
    this.channelNameUsingDefaultMouseRegion,
    this.channelNameVelocity = 50,
    this.channelNumber = '',
    this.channelNumberAlign = WMarqueeAlign.left,
    this.channelNumberAlwaysScroll = false,
    this.channelNumberRTL = false,
    this.channelNumberMarqueeSpacing = 20,
    this.channelNumberPadding = const EdgeInsets.only(top: 62),
    this.channelNumberTextStyle,
    this.channelNumberUsingDefaultMouseRegion,
    this.channelNumberVelocity = 50,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.endTime,
    this.height = 432,
    this.iconBoaderRadius,
    this.iconFit = BoxFit.fill,
    this.iconHeight = 60,
    this.iconPadding = const EdgeInsets.only(right: 30),
    this.iconBytes,
    this.iconWidth = 60,
    required this.isFocus,
    this.mainAxisSize = MainAxisSize.min,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.only(left: 42, right: 42, top: 78),
    this.progressBackgroundColor = const Color(0xff373A41),
    this.progressColor = const Color(0xffE6E6E6),
    this.progressHeight = 12,
    this.progressPadding = const EdgeInsets.only(top: 54),
    this.semanticsLabel = "",
    this.startTime,
    this.title = '',
    this.titleAlign = WMarqueeAlign.left,
    this.titleAlwaysScroll = false,
    this.titleRTL = false,
    this.titleMarqueeSpacing = 20,
    this.titlePadding = const EdgeInsets.only(top: 5, bottom: 41),
    this.titleStyle,
    this.titleUsingDefaultMouseRegion,
    this.titleVelocity = 50,
    this.width = 426,
  })  : channelNameImgUrl = null,
        iconUrl = null;

  final BoxDecoration? boxDecoration;

  final DateTime? broadcastUtcTime;

  final String channelName;

  final WMarqueeAlign channelNameAlign;

  final bool channelNameAlwaysScroll;

  final BoxFit channelNameImgFit;

  final double? channelNameImgHeight;

  final EdgeInsetsGeometry channelNameImgPadding;

  final String? channelNameImgUrl;

  final Uint8List? channelNameImgBytes;

  final double? channelNameImgWidth;

  final bool channelNameRTL;

  final double channelNameMarqueeSpacing;

  final EdgeInsetsGeometry channelNamePadding;

  final TextStyle? channelNameTextStyle;

  final bool? channelNameUsingDefaultMouseRegion;

  final double channelNameVelocity;

  final String channelNumber;

  final WMarqueeAlign channelNumberAlign;

  final bool channelNumberAlwaysScroll;

  final bool channelNumberRTL;

  final double channelNumberMarqueeSpacing;

  final EdgeInsetsGeometry channelNumberPadding;

  final TextStyle? channelNumberTextStyle;

  final bool? channelNumberUsingDefaultMouseRegion;

  final double channelNumberVelocity;

  final CrossAxisAlignment crossAxisAlignment;

  final DateTime? endTime;

  final double height;

  final BorderRadiusGeometry? iconBoaderRadius;

  final BoxFit iconFit;

  final double iconHeight;

  final EdgeInsetsGeometry iconPadding;

  final String? iconUrl;

  final Uint8List? iconBytes;

  final double iconWidth;

  final bool isFocus;

  final MainAxisSize mainAxisSize;

  final EdgeInsetsGeometry margin;

  final EdgeInsetsGeometry padding;

  final Color progressBackgroundColor;

  final Color progressColor;

  final double progressHeight;

  final EdgeInsetsGeometry progressPadding;

  final String semanticsLabel;

  final DateTime? startTime;

  final String title;

  final WMarqueeAlign titleAlign;

  final bool titleAlwaysScroll;

  final bool titleRTL;

  final double titleMarqueeSpacing;

  final EdgeInsetsGeometry titlePadding;

  final TextStyle? titleStyle;

  final bool? titleUsingDefaultMouseRegion;

  final double titleVelocity;

  final double width;

  @override
  State<ContentShelfChannelItem> createState() =>
      _ContentShelfChannelItemState();
}

class _ContentShelfChannelItemState extends State<ContentShelfChannelItem> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: Container(
        height: widget.height,
        width: widget.width,
        margin: widget.margin,
        padding: widget.padding,
        decoration: widget.boxDecoration ??
            BoxDecoration(
              color: const Color(0xFF3E454D),
              border: Border.all(
                width: 2,
                color: const Color(0x80707070),
              ),
            ),
        child: Column(
          mainAxisSize: widget.mainAxisSize,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            if (widget.channelNameImgBytes != null)
              ChannelNameWidget.bytes(
                channelName: widget.channelName,
                channelNameAlign: widget.channelNameAlign,
                channelNameAlwaysScroll: widget.channelNameAlwaysScroll,
                channelNameImgFit: widget.channelNameImgFit,
                channelNameImgHeight: widget.channelNameImgHeight,
                channelNameImgPadding: widget.channelNameImgPadding,
                channelNameImgBytes: widget.channelNameImgBytes,
                channelNameImgWidth: widget.channelNameImgWidth,
                channelNameRTL: widget.channelNameRTL,
                channelNameMarqueeSpacing: widget.channelNameMarqueeSpacing,
                channelNamePadding: widget.channelNamePadding,
                channelNameTextStyle: widget.channelNameTextStyle,
                channelNameUsingDefaultMouseRegion:
                    widget.channelNameUsingDefaultMouseRegion,
                channelNameVelocity: widget.channelNameVelocity,
                iconBoaderRadius: widget.iconBoaderRadius,
                iconFit: widget.iconFit,
                iconHeight: widget.iconHeight,
                iconPadding: widget.iconPadding,
                iconBytes: widget.iconBytes,
                iconWidth: widget.iconWidth,
                isFocus: widget.isFocus,
              )
            else
              ChannelNameWidget(
                channelName: widget.channelName,
                channelNameAlign: widget.channelNameAlign,
                channelNameAlwaysScroll: widget.channelNameAlwaysScroll,
                channelNameImgFit: widget.channelNameImgFit,
                channelNameImgHeight: widget.channelNameImgHeight,
                channelNameImgPadding: widget.channelNameImgPadding,
                channelNameImgUrl: widget.channelNameImgUrl!,
                channelNameImgWidth: widget.channelNameImgWidth,
                channelNameRTL: widget.channelNameRTL,
                channelNameMarqueeSpacing: widget.channelNameMarqueeSpacing,
                channelNamePadding: widget.channelNamePadding,
                channelNameTextStyle: widget.channelNameTextStyle,
                channelNameUsingDefaultMouseRegion:
                    widget.channelNameUsingDefaultMouseRegion,
                channelNameVelocity: widget.channelNameVelocity,
                iconBoaderRadius: widget.iconBoaderRadius,
                iconFit: widget.iconFit,
                iconHeight: widget.iconHeight,
                iconPadding: widget.iconPadding,
                iconUrl: widget.iconUrl!,
                iconWidth: widget.iconWidth,
                isFocus: widget.isFocus,
              ),
            ProgressWidget(
              broadcastUtcTime: widget.broadcastUtcTime,
              endTime: widget.endTime,
              progressBackgroundColor: widget.progressBackgroundColor,
              progressColor: widget.progressColor,
              progressHeight: widget.progressHeight,
              progressPadding: widget.progressPadding,
              startTime: widget.startTime,
            ),
            ChannelNumberWidget(
              channelNumber: widget.channelNumber,
              channelNumberAlign: widget.channelNumberAlign,
              channelNumberAlwaysScroll: widget.channelNumberAlwaysScroll,
              channelNumberRTL: widget.channelNumberRTL,
              channelNumberMarqueeSpacing: widget.channelNumberMarqueeSpacing,
              channelNumberPadding: widget.channelNumberPadding,
              channelNumberTextStyle: widget.channelNumberTextStyle,
              channelNumberUsingDefaultMouseRegion:
                  widget.channelNumberUsingDefaultMouseRegion,
              channelNumberVelocity: widget.channelNumberVelocity,
              isFocus: widget.isFocus,
            ),
            TitleWidget(
              isFocus: widget.isFocus,
              title: widget.title,
              titleAlign: widget.titleAlign,
              titleAlwaysScroll: widget.titleAlwaysScroll,
              titleRTL: widget.titleRTL,
              titleMarqueeSpacing: widget.titleMarqueeSpacing,
              titlePadding: widget.titlePadding,
              titleStyle: widget.titleStyle,
              titleUsingDefaultMouseRegion: widget.titleUsingDefaultMouseRegion,
              titleVelocity: widget.titleVelocity,
            ),
          ],
        ),
      ),
    );
  }
}

class ChannelNameWidget extends StatefulWidget {
  const ChannelNameWidget({
    super.key,
    required this.channelName,
    required this.channelNameAlign,
    required this.channelNameAlwaysScroll,
    required this.channelNameImgFit,
    required this.channelNameImgHeight,
    required this.channelNameImgPadding,
    required this.channelNameImgUrl,
    required this.channelNameImgWidth,
    required this.channelNameRTL,
    required this.channelNameMarqueeSpacing,
    required this.channelNamePadding,
    required this.channelNameTextStyle,
    required this.channelNameUsingDefaultMouseRegion,
    required this.channelNameVelocity,
    required this.iconBoaderRadius,
    required this.iconFit,
    required this.iconHeight,
    required this.iconPadding,
    required this.iconUrl,
    required this.iconWidth,
    required this.isFocus,
  })  : channelNameImgBytes = null,
        iconBytes = null;

  const ChannelNameWidget.bytes({
    super.key,
    required this.channelName,
    required this.channelNameAlign,
    required this.channelNameAlwaysScroll,
    required this.channelNameImgFit,
    required this.channelNameImgHeight,
    required this.channelNameImgPadding,
    required this.channelNameImgBytes,
    required this.channelNameImgWidth,
    required this.channelNameRTL,
    required this.channelNameMarqueeSpacing,
    required this.channelNamePadding,
    required this.channelNameTextStyle,
    required this.channelNameUsingDefaultMouseRegion,
    required this.channelNameVelocity,
    required this.iconBoaderRadius,
    required this.iconFit,
    required this.iconHeight,
    required this.iconPadding,
    required this.iconBytes,
    required this.iconWidth,
    required this.isFocus,
  })  : channelNameImgUrl = '',
        iconUrl = '';

  final String channelName;
  final WMarqueeAlign channelNameAlign;
  final bool channelNameAlwaysScroll;
  final BoxFit channelNameImgFit;
  final double? channelNameImgHeight;
  final EdgeInsetsGeometry channelNameImgPadding;
  final String channelNameImgUrl;
  final Uint8List? channelNameImgBytes;
  final double? channelNameImgWidth;
  final bool channelNameRTL;
  final double channelNameMarqueeSpacing;
  final EdgeInsetsGeometry channelNamePadding;
  final TextStyle? channelNameTextStyle;
  final bool? channelNameUsingDefaultMouseRegion;
  final double channelNameVelocity;
  final BorderRadiusGeometry? iconBoaderRadius;
  final BoxFit iconFit;
  final double iconHeight;
  final EdgeInsetsGeometry iconPadding;
  final String iconUrl;
  final Uint8List? iconBytes;
  final double iconWidth;
  final bool isFocus;

  @override
  State<ChannelNameWidget> createState() => _ChannelNameWidgetState();
}

class _ChannelNameWidgetState extends State<ChannelNameWidget> {
  @override
  Widget build(BuildContext context) {
    final channelNameTextWidget = Padding(
      padding: widget.channelNamePadding,
      child: WMarquee(
        align: widget.channelNameAlign,
        alwaysScroll: widget.channelNameAlwaysScroll,
        focused: widget.isFocus,
        isLtoR: !widget.channelNameRTL,
        marqueeSpacing: widget.channelNameMarqueeSpacing,
        style: widget.channelNameTextStyle ??
            WFont.instance.semiBold.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 66.0,
              color: const Color(0xFFE6E6E6),
              decoration: TextDecoration.none,
              fontFamily: WFont.defaultFont().first,
              fontFamilyFallback: WFont.defaultFont(),
            ),
        text: widget.channelName,
        usingDefaultMouseRegion: widget.channelNameUsingDefaultMouseRegion,
        velocity: widget.channelNameVelocity,
      ),
    );

    final channelNameImgWidget = Flexible(
      child: Padding(
        padding: widget.channelNameImgPadding,
        child: () {
          if (widget.channelNameImgBytes != null) {
            return ImageContainer.bytes(
              width: widget.channelNameImgWidth!,
              height: widget.channelNameImgHeight!,
              imageBytes: widget.channelNameImgBytes,
              fit: widget.channelNameImgFit,
            );
          } else {
            if (widget.channelNameImgUrl.startsWith('http://') ||
                widget.channelNameImgUrl.startsWith('https://')) {
              return Image.network(
                widget.channelNameImgUrl,
                width: widget.channelNameImgWidth,
                height: widget.channelNameImgHeight,
                fit: widget.channelNameImgFit,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return channelNameTextWidget;
                  }
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return channelNameTextWidget;
                },
              );
            } else {
              return Image.asset(
                widget.channelNameImgUrl,
                width: widget.channelNameImgWidth,
                height: widget.channelNameImgHeight,
                fit: widget.channelNameImgFit,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return channelNameTextWidget;
                },
              );
            }
          }
        }(),
      ),
    );

    return Row(
      children: [
        if (widget.iconUrl.isNotEmpty || widget.iconBytes != null)
          if (widget.iconBytes != null)
            Padding(
              padding: widget.iconPadding,
              child: ImageContainer.bytes(
                width: widget.iconWidth,
                height: widget.iconHeight,
                imageBytes: widget.iconBytes,
                fit: widget.iconFit,
                borderRadius: widget.iconBoaderRadius,
              ),
            )
          else
            Padding(
              padding: widget.iconPadding,
              child: ImageContainer(
                width: widget.iconWidth,
                height: widget.iconHeight,
                uri: widget.iconUrl,
                fit: widget.iconFit,
                borderRadius: widget.iconBoaderRadius,
              ),
            ),
        if (widget.isFocus)
          Flexible(child: channelNameTextWidget)
        else
          widget.channelNameImgUrl!.isNotEmpty ||
                  widget.channelNameImgBytes != null
              ? channelNameImgWidget
              : Flexible(child: channelNameTextWidget),
      ],
    );
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
    required this.broadcastUtcTime,
    required this.endTime,
    required this.progressBackgroundColor,
    required this.progressColor,
    required this.progressHeight,
    required this.progressPadding,
    required this.startTime,
  });

  final DateTime? broadcastUtcTime;
  final DateTime? endTime;
  final Color progressBackgroundColor;
  final Color progressColor;
  final double progressHeight;
  final EdgeInsetsGeometry progressPadding;
  final DateTime? startTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: progressPadding,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (broadcastUtcTime == null) {
            return SizedBox(height: progressHeight);
          } else {
            return SizedBox(
              width: constraints.maxWidth,
              height: progressHeight,
              child: Container(
                alignment: Alignment.centerLeft,
                color: progressBackgroundColor,
                child: UnconstrainedBox(
                  child: Container(
                      height: progressHeight,
                      color: progressColor,
                      width: constraints.maxWidth * _calculateProgress()),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  double _calculateProgress() {
    if (startTime != null && endTime != null) {
      double progress;

      if (broadcastUtcTime != null) {
        if (startTime!.isAfter(endTime!) ||
            startTime!.isAfter(broadcastUtcTime!)) {
          return 0;
        }

        progress = (broadcastUtcTime!.difference(startTime!).inMilliseconds) /
            (endTime!.difference(startTime!).inMilliseconds);
        return min(1, progress);
      }
    }

    return 0;
  }
}

class ChannelNumberWidget extends StatelessWidget {
  const ChannelNumberWidget({
    super.key,
    required this.channelNumber,
    required this.channelNumberAlign,
    required this.channelNumberAlwaysScroll,
    required this.channelNumberRTL,
    required this.channelNumberMarqueeSpacing,
    required this.channelNumberPadding,
    required this.channelNumberTextStyle,
    required this.channelNumberUsingDefaultMouseRegion,
    required this.channelNumberVelocity,
    required this.isFocus,
  });

  final String channelNumber;
  final WMarqueeAlign channelNumberAlign;
  final bool channelNumberAlwaysScroll;
  final bool channelNumberRTL;
  final double channelNumberMarqueeSpacing;
  final EdgeInsetsGeometry channelNumberPadding;
  final TextStyle? channelNumberTextStyle;
  final bool? channelNumberUsingDefaultMouseRegion;
  final double channelNumberVelocity;
  final bool isFocus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: channelNumberPadding,
      child: WMarquee(
        align: channelNumberAlign,
        alwaysScroll: channelNumberAlwaysScroll,
        focused: isFocus,
        isLtoR: !channelNumberRTL,
        marqueeSpacing: channelNumberMarqueeSpacing,
        style: channelNumberTextStyle ??
            WFont.instance.semiBold.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 42,
              color: const Color(0xFFE6E6E6),
              decoration: TextDecoration.none,
              fontFamily: WFont.defaultFont().first,
              fontFamilyFallback: WFont.defaultFont(),
            ),
        text: channelNumber,
        usingDefaultMouseRegion: channelNumberUsingDefaultMouseRegion,
        velocity: channelNumberVelocity,
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.isFocus,
    required this.title,
    required this.titleAlign,
    required this.titleAlwaysScroll,
    required this.titleRTL,
    required this.titleMarqueeSpacing,
    required this.titlePadding,
    required this.titleStyle,
    required this.titleUsingDefaultMouseRegion,
    required this.titleVelocity,
  });

  final bool isFocus;
  final String title;
  final WMarqueeAlign titleAlign;
  final bool titleAlwaysScroll;
  final bool titleRTL;
  final double titleMarqueeSpacing;
  final EdgeInsetsGeometry titlePadding;
  final TextStyle? titleStyle;
  final bool? titleUsingDefaultMouseRegion;
  final double titleVelocity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: titlePadding,
      child: WMarquee(
        align: titleAlign,
        alwaysScroll: titleAlwaysScroll,
        focused: isFocus,
        isLtoR: !titleRTL,
        marqueeSpacing: titleMarqueeSpacing,
        style: titleStyle ??
            WFont.instance.regular.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 42,
              color: const Color(0xFFE6E6E6),
              decoration: TextDecoration.none,
              fontFamily: WFont.defaultFont().first,
              fontFamilyFallback: WFont.defaultFont(),
            ),
        text: title,
        usingDefaultMouseRegion: titleUsingDefaultMouseRegion,
        velocity: titleVelocity,
      ),
    );
  }
}
