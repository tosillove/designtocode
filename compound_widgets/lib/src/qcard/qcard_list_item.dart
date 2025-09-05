import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class QCardListItem extends StatefulWidget {
  const QCardListItem({
    super.key,
    this.backgroundImgFit = BoxFit.fill,
    this.backgroundImgUrl = '',
    this.border,
    this.borderRadius = const BorderRadius.only(
      topRight: Radius.circular(48.0),
      bottomLeft: Radius.circular(48.0),
      bottomRight: Radius.circular(48.0),
    ),
    this.height = 270.0,
    this.icon = '',
    this.iconAlignment = Alignment.topCenter,
    this.iconBorderRadius,
    this.iconFit = BoxFit.contain,
    this.iconHeight = 144.0,
    this.iconPadding = const EdgeInsets.only(top: 30),
    this.iconWidth = 144.0,
    required this.id,
    this.isFocused = false,
    this.launchPointId,
    this.padding = EdgeInsets.zero,
    this.semanticsLabel = "",
    this.title = '',
    this.titleAlignment = Alignment.bottomCenter,
    this.titleAlwaysScroll = true,
    this.titleHeight = 57,
    this.titleHoverStyle,
    this.titleMarqueeAlign = WMarqueeAlign.left,
    this.titleMarqueeSpacing = 20,
    this.titlePadding = const EdgeInsets.only(left: 30, right: 30, bottom: 52),
    this.titleTextStyle,
    this.titleUsingDefaultMouseRegion,
    this.titleVelocity = 50,
    this.titleWidth,
    this.width = 480.0,
  })  : iconBytes = null,
        backgroundImgBytes = null;

  const QCardListItem.bytes({
    super.key,
    this.backgroundImgFit = BoxFit.fill,
    this.backgroundImgBytes,
    this.border,
    this.borderRadius = const BorderRadius.only(
      topRight: Radius.circular(48.0),
      bottomLeft: Radius.circular(48.0),
      bottomRight: Radius.circular(48.0),
    ),
    this.height = 270.0,
    this.iconBytes,
    this.iconAlignment = Alignment.topCenter,
    this.iconBorderRadius,
    this.iconFit = BoxFit.contain,
    this.iconHeight = 144.0,
    this.iconPadding = const EdgeInsets.only(top: 30),
    this.iconWidth = 144.0,
    required this.id,
    this.isFocused = false,
    this.launchPointId,
    this.padding = EdgeInsets.zero,
    this.semanticsLabel = "",
    this.title = '',
    this.titleAlignment = Alignment.bottomCenter,
    this.titleAlwaysScroll = true,
    this.titleHeight = 57,
    this.titleHoverStyle,
    this.titleMarqueeAlign = WMarqueeAlign.left,
    this.titleMarqueeSpacing = 20,
    this.titlePadding = const EdgeInsets.only(left: 30, right: 30, bottom: 52),
    this.titleTextStyle,
    this.titleUsingDefaultMouseRegion,
    this.titleVelocity = 50,
    this.titleWidth,
    this.width = 480.0,
  })  : icon = null,
        backgroundImgUrl = null;

  final BoxFit backgroundImgFit;

  final String? backgroundImgUrl;

  final Uint8List? backgroundImgBytes;

  final Border? border;

  final BorderRadiusGeometry borderRadius;

  final double height;

  final String? icon;

  final Uint8List? iconBytes;

  final AlignmentGeometry iconAlignment;

  /// The border radius of the container.
  final BorderRadiusGeometry? iconBorderRadius;

  /// The fit of the image within the container.
  final BoxFit? iconFit;

  final double iconHeight;

  final EdgeInsetsGeometry iconPadding;

  final double iconWidth;

  final String id;

  /// Text flow enable, default value is false
  final bool isFocused;

  final String? launchPointId;

  final EdgeInsetsGeometry padding;

  final String semanticsLabel;

  final String title;

  final AlignmentGeometry titleAlignment;

  /// Always text should flow regardless of whether the focus is active.
  final bool titleAlwaysScroll;

  final double? titleHeight;

  /// The text style displayed when the WMarquee widget has focus
  final TextStyle? titleHoverStyle;

  /// Align text when text size is smaller than parent widget.
  /// see the [WMarqueeAlign]
  final WMarqueeAlign titleMarqueeAlign;

  /// When flow string repeated, spacing between last word and first word
  final double titleMarqueeSpacing;

  final EdgeInsetsGeometry titlePadding;

  final TextStyle? titleTextStyle;

  /// Using MouseRegion of Marquee, default value is true. (if focused value is true, this property value will be false)
  final bool? titleUsingDefaultMouseRegion;

  /// Text flow speed
  final double titleVelocity;

  final double? titleWidth;

  final double width;

  @override
  State<QCardListItem> createState() => _QCardListItemState();
}

class _QCardListItemState extends State<QCardListItem> {
  @override
  Widget build(BuildContext context) {
    bool isLtoR =
        Directionality.of(context) == TextDirection.ltr ? true : false;

    return Semantics(
      label: widget.semanticsLabel,
      child: Container(
        key: ValueKey(widget.launchPointId ?? widget.id),
        padding: widget.padding,
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: widget.borderRadius,
              child: widget.backgroundImgBytes != null
                  ? Image.memory(
                      widget.backgroundImgBytes!,
                      fit: widget.backgroundImgFit,
                      height: widget.height,
                      width: widget.width,
                    )
                  : Image.asset(
                      widget.backgroundImgUrl!,
                      fit: widget.backgroundImgFit,
                      height: widget.height,
                      width: widget.width,
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius,
                border: widget.border ??
                    Border.all(
                      width: 4,
                      color: const Color(0x33FFFFFF),
                    ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: widget.iconAlignment,
                    child: Padding(
                      padding: widget.iconPadding,
                      child: widget.iconBytes != null
                          ? ImageLoaderWidget.bytes(
                              borderRadius: widget.iconBorderRadius,
                              fit: widget.iconFit,
                              height: widget.iconHeight,
                              imageBytes: widget.iconBytes,
                              width: widget.iconWidth,
                            )
                          : ImageLoaderWidget(
                              borderRadius: widget.iconBorderRadius,
                              fit: widget.iconFit,
                              height: widget.iconHeight,
                              uri: widget.icon,
                              width: widget.iconWidth,
                            ),
                    ),
                  ),
                  Align(
                    alignment: widget.titleAlignment,
                    child: Padding(
                      padding: widget.titlePadding,
                      child: SizedBox(
                        height: widget.titleHeight,
                        width: widget.titleWidth,
                        child: WMarquee(
                          align: widget.titleMarqueeAlign,
                          alwaysScroll: widget.titleAlwaysScroll,
                          focused: widget.isFocused,
                          hoverStyle: widget.titleHoverStyle,
                          isLtoR: isLtoR,
                          marqueeSpacing: widget.titleMarqueeSpacing,
                          style: widget.titleTextStyle ??
                              WFont.instance.semiBold.copyWith(
                                  fontSize: 48.0, color: Colors.white),
                          text: widget.title,
                          usingDefaultMouseRegion:
                              widget.titleUsingDefaultMouseRegion,
                          velocity: widget.titleVelocity,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageLoaderWidget extends StatelessWidget {
  /// Creates an [ImageLoaderWidget] widget.
  ///
  /// The [width] and [height] parameters are required.
  /// The [uri] parameter specifies the source of the image.
  /// The [fit] and [borderRadius] parameters are optional.
  const ImageLoaderWidget({
    super.key,
    required this.width,
    required this.height,
    required this.uri,
    this.fit,
    this.borderRadius,
  }) : imageBytes = null;

  const ImageLoaderWidget.bytes({
    super.key,
    required this.width,
    required this.height,
    required this.imageBytes,
    this.fit,
    this.borderRadius,
  }) : uri = null;

  /// The width of the image container.
  final double width;

  /// The height of the image container.
  final double height;

  /// The URI of the image to be displayed.
  final String? uri;

  /// The byte-array of the image to be displayed.
  final Uint8List? imageBytes;

  /// The fit of the image within the container.
  final BoxFit? fit;

  /// The border radius of the container.
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (imageBytes != null) {
      imageWidget = Image.memory(
        imageBytes!,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      if (uri!.startsWith('http://') || uri!.startsWith('https://')) {
        imageWidget = Image.network(
          uri!,
          fit: fit,
          width: width,
          height: height,
        );
      } else if (uri!.startsWith('assets') || uri!.startsWith('asset')) {
        imageWidget = Image.asset(
          uri!,
          fit: fit,
          width: width,
          height: height,
        );
      } else {
        imageWidget = Image.file(
          File(uri!),
          fit: fit,
          width: width,
          height: height,
        );
      }
    }
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: imageWidget,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
          ),
        ],
      ),
    );
  }
}
