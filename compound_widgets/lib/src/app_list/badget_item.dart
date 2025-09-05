import 'dart:typed_data';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';

import 'app_item.dart';

class BadgeItem extends StatefulWidget {
  const BadgeItem({
    super.key,
    this.state = AppIconState.idle,
    this.progressBgColor,
    this.progressColor,
    this.progressPercent,
    this.progressWidth,
    this.progressHeight,
    this.circleColor,
    this.circleWidth,
    this.circleHeight,
    this.lockingColor,
    this.lockingWidth,
    this.lockingHeight,
    this.lockingUrl,
    this.bookmarkHeight,
    this.bookmarkWidth,
    this.bookmarkUrl,
  })  : lockingBytes = null,
        bookmarkBytes = null;

  const BadgeItem.bytes({
    super.key,
    this.state = AppIconState.idle,
    this.progressBgColor,
    this.progressColor,
    this.progressPercent,
    this.progressWidth,
    this.progressHeight,
    this.circleColor,
    this.circleWidth,
    this.circleHeight,
    this.lockingColor,
    this.lockingWidth,
    this.lockingHeight,
    this.lockingBytes,
    this.bookmarkHeight,
    this.bookmarkWidth,
    this.bookmarkBytes,
  })  : lockingUrl = null,
        bookmarkUrl = null;

  final AppIconState state;
  final Color? progressBgColor;
  final Color? progressColor;
  final double? progressPercent;
  final double? progressWidth;
  final double? progressHeight;
  final Color? circleColor;
  final double? circleWidth;
  final double? circleHeight;
  final Color? lockingColor;
  final double? lockingWidth;
  final double? lockingHeight;
  final String? lockingUrl;
  final Uint8List? lockingBytes;
  final double? bookmarkWidth;
  final double? bookmarkHeight;
  final String? bookmarkUrl;
  final Uint8List? bookmarkBytes;

  @override
  State<BadgeItem> createState() => _BadgeItemState();
}

class _BadgeItemState extends State<BadgeItem> {
  AppIconState state = AppIconState.idle;

  @override
  void initState() {
    super.initState();
    state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case AppIconState.locking:
        return SizedBox(
          width: widget.lockingWidth,
          height: widget.lockingHeight,
          child: widget.lockingBytes != null
              ? ImageContainer.bytes(
                  width: widget.lockingWidth!,
                  height: widget.lockingHeight!,
                  imageBytes: widget.lockingBytes,
                )
              : Image.asset(
                  widget.lockingUrl!,
                  color: widget.lockingColor,
                  width: widget.lockingWidth,
                  height: widget.lockingHeight,
                ),
        );
      case AppIconState.newlyInstalled:
      case AppIconState.canUpdate:
        return SizedBox(
          width: widget.circleWidth,
          height: widget.circleHeight,
          child: CircleAvatar(
            backgroundColor: widget.circleColor,
          ),
        );
      case AppIconState.downloading:
        return SizedBox(
          width: widget.progressWidth,
          height: widget.progressHeight,
          child: LinearProgressIndicator(
            value: widget.progressPercent,
            color: widget.progressColor,
            backgroundColor: widget.progressBgColor,
          ),
        );
      case AppIconState.bookmark:
        return SizedBox(
          width: widget.bookmarkWidth,
          height: widget.bookmarkHeight,
          child: widget.bookmarkBytes != null
              ? ImageContainer.bytes(
                  width: widget.bookmarkWidth!,
                  height: widget.bookmarkHeight!,
                  imageBytes: widget.bookmarkBytes,
                )
              : ImageContainer(
                  uri: widget.bookmarkUrl!,
                  width: widget.bookmarkWidth!,
                  height: widget.bookmarkHeight!,
                ),
        );
      case AppIconState.idle:
        return const SizedBox.shrink();
    }
  }
}
