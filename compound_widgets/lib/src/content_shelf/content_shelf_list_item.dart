import 'dart:typed_data';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';

import 'package:plover/plover.dart';

enum ContentShelfItemType {
  vertical,
  horizontal,
}

class ContentShelfItem extends StatefulWidget {
  const ContentShelfItem({
    super.key,
    this.focusBoxDecoration,
    this.height = 432,
    this.imgBoaderRadius,
    this.imgFit = BoxFit.fill,
    this.imgHeight,
    this.imgPadding,
    required this.imgUrl,
    this.imgWidth,
    this.innerTitle = '',
    this.innerTitleAlign = WMarqueeAlign.center,
    this.innerTitleAlwaysScroll = false,
    this.innerTitleHeight = 70,
    this.innerTitleMarqueeSpacing = 20,
    this.innerTitleMargin = EdgeInsets.zero,
    this.innerTitleStyle,
    this.innerTitleUsingDefaultMouseRegion,
    this.innerTitleVelocity = 50,
    this.innerTitleWidth,
    this.isFocus = false,
    this.isRTL = false,
    this.padding = EdgeInsets.zero,
    this.semanticsLabel = "",
    this.shadowBoxDecoration,
    this.shadowHeight,
    this.showBottomTitle = true,
    this.type = ContentShelfItemType.horizontal,
    this.width,
  }) : imgBytes = null;

  const ContentShelfItem.bytes({
    super.key,
    this.focusBoxDecoration,
    this.height = 432,
    this.imgBoaderRadius,
    this.imgFit = BoxFit.fill,
    this.imgHeight,
    this.imgPadding,
    required this.imgBytes,
    this.imgWidth,
    this.innerTitle = '',
    this.innerTitleAlign = WMarqueeAlign.center,
    this.innerTitleAlwaysScroll = false,
    this.innerTitleHeight = 70,
    this.innerTitleMarqueeSpacing = 20,
    this.innerTitleMargin = EdgeInsets.zero,
    this.innerTitleStyle,
    this.innerTitleUsingDefaultMouseRegion,
    this.innerTitleVelocity = 50,
    this.innerTitleWidth,
    this.isFocus = false,
    this.isRTL = false,
    this.padding = EdgeInsets.zero,
    this.semanticsLabel = "",
    this.shadowBoxDecoration,
    this.shadowHeight,
    this.showBottomTitle = true,
    this.type = ContentShelfItemType.horizontal,
    this.width,
  }) : imgUrl = null;

  final BoxDecoration? focusBoxDecoration;

  final double height;

  final BorderRadiusGeometry? imgBoaderRadius;

  final BoxFit imgFit;

  final double? imgHeight;

  final EdgeInsetsGeometry? imgPadding;

  final String? imgUrl;

  final Uint8List? imgBytes;

  final double? imgWidth;

  final String innerTitle;

  final WMarqueeAlign innerTitleAlign;

  final bool innerTitleAlwaysScroll;

  final double innerTitleHeight;

  final double innerTitleMarqueeSpacing;

  final EdgeInsets innerTitleMargin;

  final TextStyle? innerTitleStyle;

  final bool? innerTitleUsingDefaultMouseRegion;

  final double innerTitleVelocity;

  final double? innerTitleWidth;

  final bool isFocus;

  final bool isRTL;

  final EdgeInsets padding;

  final String semanticsLabel;

  final BoxDecoration? shadowBoxDecoration;

  final double? shadowHeight;

  final bool showBottomTitle;

  final ContentShelfItemType type;

  final double? width;

  @override
  State<ContentShelfItem> createState() => _ContentShelfItemState();
}

class _ContentShelfItemState extends State<ContentShelfItem> {
  bool get isFocusRing => WTheme.of(context)?.applyFocusRing ?? false;

  @override
  Widget build(BuildContext context) {
    double width;

    switch (widget.type) {
      case ContentShelfItemType.vertical:
        width = widget.width ?? 288;
        break;
      default:
        width = widget.width ?? 768;
        break;
    }

    return Semantics(
      label: widget.semanticsLabel,
      child: Container(
        width: width,
        height: widget.height,
        padding: widget.padding,
        child: Stack(
          children: [
            if (widget.imgBytes != null)
              ImageContainer.bytes(
                width: widget.imgWidth ?? width,
                height: widget.imgHeight ?? widget.height,
                imageBytes: widget.imgBytes,
                fit: widget.imgFit,
                borderRadius: widget.imgBoaderRadius,
                padding: widget.imgPadding,
              )
            else
              ImageContainer(
                width: widget.imgWidth ?? width,
                height: widget.imgHeight ?? widget.height,
                uri: widget.imgUrl,
                fit: widget.imgFit,
                borderRadius: widget.imgBoaderRadius,
                padding: widget.imgPadding,
              ),
            if (widget.isFocus)
              Positioned.fill(
                child: Container(
                  decoration: widget.focusBoxDecoration ??
                      BoxDecoration(
                        border: !isFocusRing
                            ? Border.all(
                                color: const Color(0xffe6e6e6),
                                width: 2.0,
                              )
                            : null,
                      ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: widget.shadowHeight ?? widget.height / 2,
                            decoration: widget.shadowBoxDecoration ??
                                BoxDecoration(
                                  gradient: !widget.showBottomTitle
                                      ? const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0x00000000),
                                            Color(0xb3000000)
                                          ],
                                        )
                                      : null,
                                )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: widget.innerTitleHeight,
                          margin: widget.innerTitleMargin,
                          width: widget.innerTitleWidth ?? width,
                          child: Opacity(
                            opacity: widget.showBottomTitle ? 0 : 1,
                            child: WMarquee(
                              align: widget.innerTitleAlign,
                              alwaysScroll: widget.innerTitleAlwaysScroll,
                              focused: widget.isFocus,
                              isLtoR: !widget.isRTL,
                              marqueeSpacing: widget.innerTitleMarqueeSpacing,
                              style: widget.innerTitleStyle ??
                                  WFont.instance.semiBold.copyWith(
                                      fontSize: 60, color: Colors.white),
                              text: widget.innerTitle,
                              usingDefaultMouseRegion:
                                  widget.innerTitleUsingDefaultMouseRegion,
                              velocity: widget.innerTitleVelocity,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
