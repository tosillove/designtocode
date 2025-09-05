import 'dart:typed_data';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';

import 'package:plover/plover.dart';

class ContentShelfEditorsPickItem extends StatefulWidget {
  const ContentShelfEditorsPickItem({
    super.key,
    this.boxDecoration,
    this.height = 432,
    this.imgBoaderRadius,
    this.imgFit = BoxFit.fill,
    this.imgHeight,
    this.imgMaskBegin = Alignment.centerLeft,
    this.imgMaskColors = const [Color(0xFFD8D8D8)],
    this.imgMaskEnd = Alignment.centerRight,
    this.imgMaskStops = const [1],
    this.imgMaskTileMode = TileMode.clamp,
    this.imgMaskTransform,
    this.imgPadding,
    required this.imgUrl,
    this.imgWidth,
    this.isFocus = false,
    this.isRTL = false,
    this.padding = EdgeInsets.zero,
    this.semanticsLabel = "",
    this.shadowAlignment = Alignment.bottomCenter,
    this.shadowBoxDecoration,
    this.shadowHeight,
    this.title = '',
    this.titleAlign = WMarqueeAlign.center,
    this.titleAlignment = Alignment.center,
    this.titleAlwaysScroll = false,
    this.titleHeight = 70,
    this.titleMargin = EdgeInsets.zero,
    this.titleMarqueeSpacing = 20,
    this.titleStyle,
    this.titleUsingDefaultMouseRegion,
    this.titleVelocity = 50,
    this.titleWidth,
    this.width = 768,
  }) : imgBytes = null;

  const ContentShelfEditorsPickItem.bytes({
    super.key,
    this.boxDecoration,
    this.height = 432,
    this.imgBoaderRadius,
    this.imgFit = BoxFit.fill,
    this.imgHeight,
    this.imgMaskBegin = Alignment.centerLeft,
    this.imgMaskColors = const [Color(0xFFD8D8D8)],
    this.imgMaskEnd = Alignment.centerRight,
    this.imgMaskStops = const [1],
    this.imgMaskTileMode = TileMode.clamp,
    this.imgMaskTransform,
    this.imgPadding,
    required this.imgBytes,
    this.imgWidth,
    this.isFocus = false,
    this.isRTL = false,
    this.padding = EdgeInsets.zero,
    this.semanticsLabel = "",
    this.shadowAlignment = Alignment.bottomCenter,
    this.shadowBoxDecoration,
    this.shadowHeight,
    this.title = '',
    this.titleAlign = WMarqueeAlign.center,
    this.titleAlignment = Alignment.center,
    this.titleAlwaysScroll = false,
    this.titleHeight = 70,
    this.titleMargin = EdgeInsets.zero,
    this.titleMarqueeSpacing = 20,
    this.titleStyle,
    this.titleUsingDefaultMouseRegion,
    this.titleVelocity = 50,
    this.titleWidth,
    this.width = 768,
  }) : imgUrl = null;

  final BoxDecoration? boxDecoration;

  final double height;

  final BorderRadiusGeometry? imgBoaderRadius;

  final BoxFit imgFit;

  final double? imgHeight;

  final AlignmentGeometry imgMaskBegin;

  final List<Color> imgMaskColors;

  final AlignmentGeometry imgMaskEnd;

  final List<double>? imgMaskStops;

  final TileMode imgMaskTileMode;

  final GradientTransform? imgMaskTransform;

  final EdgeInsetsGeometry? imgPadding;

  final String? imgUrl;

  final Uint8List? imgBytes;

  final double? imgWidth;

  final bool isFocus;

  final bool isRTL;

  final EdgeInsets padding;

  final String semanticsLabel;

  final AlignmentGeometry shadowAlignment;

  final BoxDecoration? shadowBoxDecoration;

  final double? shadowHeight;

  final String title;

  final WMarqueeAlign titleAlign;

  final AlignmentGeometry titleAlignment;

  final bool titleAlwaysScroll;

  final double titleHeight;

  final EdgeInsets titleMargin;

  final double titleMarqueeSpacing;

  final TextStyle? titleStyle;

  final bool? titleUsingDefaultMouseRegion;

  final double titleVelocity;

  final double? titleWidth;

  final double width;

  @override
  State<ContentShelfEditorsPickItem> createState() =>
      _ContentShelfEditorsPickItemState();
}

class _ContentShelfEditorsPickItemState
    extends State<ContentShelfEditorsPickItem> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        decoration: widget.boxDecoration ??
            BoxDecoration(
              color: const Color(0xFF3E454D),
              border: Border.all(
                width: 2,
                color: const Color(0x80CCCCCC),
              ),
            ),
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: widget.imgMaskBegin,
                  colors: widget.imgMaskColors,
                  end: widget.imgMaskEnd,
                  stops: widget.imgMaskStops,
                  tileMode: widget.imgMaskTileMode,
                  transform: widget.imgMaskTransform,
                ).createShader(bounds);
              },
              child: widget.imgBytes != null
                  ? ImageContainer.bytes(
                      width: widget.imgWidth ?? widget.width,
                      height: widget.imgHeight ?? widget.height,
                      imageBytes: widget.imgBytes,
                      fit: widget.imgFit,
                      borderRadius: widget.imgBoaderRadius,
                      padding: widget.imgPadding,
                    )
                  : ImageContainer(
                      width: widget.imgWidth ?? widget.width,
                      height: widget.imgHeight ?? widget.height,
                      uri: widget.imgUrl,
                      fit: widget.imgFit,
                      borderRadius: widget.imgBoaderRadius,
                      padding: widget.imgPadding,
                    ),
            ),
            Positioned.fill(
              child: Center(
                child: Stack(
                  children: [
                    if (widget.isFocus)
                      Align(
                        alignment: widget.shadowAlignment,
                        child: Container(
                          height: widget.shadowHeight ?? widget.height / 2,
                          decoration: widget.shadowBoxDecoration ??
                              const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x00000000),
                                    Color(0xb3000000)
                                  ],
                                ),
                              ),
                        ),
                      ),
                    Align(
                      alignment: widget.titleAlignment,
                      child: Container(
                        height: widget.titleHeight,
                        margin: widget.titleMargin,
                        width: widget.titleWidth ?? widget.width,
                        child: WMarquee(
                          align: widget.titleAlign,
                          alwaysScroll: widget.titleAlwaysScroll,
                          focused: widget.isFocus,
                          isLtoR: !widget.isRTL,
                          marqueeSpacing: widget.titleMarqueeSpacing,
                          style: widget.titleStyle ??
                              WFont.instance.regular
                                  .copyWith(fontSize: 60, color: Colors.white),
                          text: widget.title,
                          usingDefaultMouseRegion:
                              widget.titleUsingDefaultMouseRegion,
                          velocity: widget.titleVelocity,
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
