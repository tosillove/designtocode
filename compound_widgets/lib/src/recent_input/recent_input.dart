import 'dart:typed_data';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/// `RecentInputCard` is a widget that displays a recently input item in a card format.
/// This widget is stateful and provides various customization options.
class RecentInputCard extends StatefulWidget {
  /// Constructor
  ///
  /// Initializes the widget with parameters such as [borderImage], [captionHeight],
  /// [captionImageUri], [captionLeftPadding], [captionTopPadding], [captionWidth],
  /// [enableLiveCaption], [enableShadow], [height], [hoverTextStyle], [imageUri],
  /// [shadowImageUri], [strokeColor], [strokeThickness], [textStyle], [title],
  /// [titleAreaHeight], [titleAreaWidth],[titleLeftPadding], [titleTopPadding],
  /// and [width].
  const RecentInputCard({
    super.key,
    this.aniCurve = Curves.linear,
    this.aniDuration = 400,
    this.borderImage,
    this.captionHeight = 62,
    this.captionImageUri,
    this.captionLeftPadding = 6,
    this.captionTopPadding = 12,
    this.captionWidth = 132,
    this.enableLiveCaption = false,
    this.enableShadow = false,
    this.height = 270,
    this.hoverTextStyle,
    required this.imageUri,
    this.onTap,
    this.shadowImageUri,
    this.strokeColor = Colors.white,
    this.strokeThickness = 2,
    this.textStyle,
    this.title,
    this.titleAreaHeight = 49,
    this.titleAreaWidth = 444,
    this.titleLeftPadding = 12,
    this.titleTopPadding = 210,
    this.width = 480,
    this.semanticsLabel = "",
  })  : imageBytes = null,
        borderImageBytes = null,
        captionImageBytes = null,
        shadowImageBytes = null;

  const RecentInputCard.bytes({
    super.key,
    this.aniCurve = Curves.linear,
    this.aniDuration = 400,
    this.borderImageBytes,
    this.captionHeight = 62,
    this.captionImageBytes,
    this.captionLeftPadding = 6,
    this.captionTopPadding = 12,
    this.captionWidth = 132,
    this.enableLiveCaption = false,
    this.enableShadow = false,
    this.height = 270,
    this.hoverTextStyle,
    required this.imageBytes,
    this.onTap,
    this.shadowImageBytes,
    this.strokeColor = Colors.white,
    this.strokeThickness = 2,
    this.textStyle,
    this.title,
    this.titleAreaHeight = 49,
    this.titleAreaWidth = 444,
    this.titleLeftPadding = 12,
    this.titleTopPadding = 210,
    this.width = 480,
    this.semanticsLabel = "",
  })  : imageUri = null,
        borderImage = null,
        captionImageUri = null,
        shadowImageUri = null;

  // The value of AnimationCurve. Default value is Curves.linear
  final Curve aniCurve;

  // The value of AnimationSpeed. Default value is 400ms.
  final int aniDuration;

  /// Represents the URI of the border image to be used.
  final String? borderImage;

  final Uint8List? borderImageBytes;

  /// Represents the height of the caption area.
  final double captionHeight;

  /// Represents the URI of the caption image.
  final String? captionImageUri;

  final Uint8List? captionImageBytes;

  /// Represents the left padding of the caption.
  final double captionLeftPadding;

  /// Represents the top padding of the caption.
  final double captionTopPadding;

  /// Represents the width of the caption area.
  final double captionWidth;

  /// Indicates whether the live caption feature is enabled.
  final bool enableLiveCaption;

  /// Indicates whether the shadow effect is enabled.
  final bool enableShadow;

  /// Represents the overall height of the card.
  final double height;

  /// Represents the text style when hovered.
  final TextStyle? hoverTextStyle;

  /// Represents the URI of the image to be displayed in the card.
  final String? imageUri;

  final Uint8List? imageBytes;

  // Callback Function when tab action occurred
  final VoidCallback? onTap;

  /// Accesibility label
  final String semanticsLabel;

  /// Represents the URI of the shadow image.
  final String? shadowImageUri;

  final Uint8List? shadowImageBytes;

  /// the color value of storke when focused
  final Color strokeColor;

  /// the thickness value when focused
  final double strokeThickness;

  /// Represents the text style.
  final TextStyle? textStyle;

  /// Represents the title of the card.
  final String? title;

  /// Represents the height of the title area.
  final double titleAreaHeight;

  /// Represents the width of the title area.
  final double titleAreaWidth;

  /// Represents the left padding of the title.
  final double titleLeftPadding;

  /// Represents the top padding of the title.
  final double titleTopPadding;

  /// Represents the overall width of the card.
  final double width;

  @override
  State<RecentInputCard> createState() => _RecentInputCardState();
}

class _RecentInputCardState extends State<RecentInputCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<dynamic> _animation;
  bool isFocused = false;

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: widget.aniDuration),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.aniCurve,
      ),
    )..addListener(_listener);
  }

  @override
  void dispose() {
    _animation.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  void callTabFunction() {
    if (widget.onTap != null) {
      widget.onTap!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: WFocusable(
        onFocusChange: (bool value) {
          setState(() {
            if (value) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            isFocused = value;
          });
        },
        onTap: callTabFunction,
        child: Transform.scale(
          scale: _animation.value as double,
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: Stack(
              children: [
                (widget.imageBytes != null)
                    ? ImageContainer.bytes(
                        width: widget.width,
                        height: widget.height,
                        imageBytes: widget.imageBytes!,
                      )
                    : ImageContainer(
                        width: widget.width,
                        height: widget.height,
                        uri: widget.imageUri!,
                      ),
                if (widget.borderImage != null ||
                    widget.borderImageBytes != null)
                  (widget.borderImageBytes != null)
                      ? ImageContainer.bytes(
                          width: widget.width,
                          height: widget.height,
                          imageBytes: widget.borderImageBytes!,
                        )
                      : ImageContainer(
                          width: widget.width,
                          height: widget.height,
                          uri: widget.borderImage!,
                        ),
                if (widget.enableShadow &&
                    (widget.shadowImageUri != null ||
                        widget.shadowImageBytes != null))
                  (widget.shadowImageBytes != null)
                      ? ImageContainer.bytes(
                          width: widget.width,
                          height: widget.height,
                          imageBytes: widget.shadowImageBytes!,
                        )
                      : ImageContainer(
                          width: widget.width,
                          height: widget.height,
                          uri: widget.shadowImageUri!,
                        ),
                if (widget.enableLiveCaption &&
                    (widget.captionImageUri != null ||
                        widget.captionImageBytes != null))
                  Container(
                    margin: EdgeInsets.only(
                        top: widget.captionTopPadding,
                        left: widget.captionLeftPadding),
                    width: widget.captionWidth,
                    height: widget.captionHeight,
                    child: (widget.captionImageBytes != null)
                        ? ImageContainer.bytes(
                            width: widget.captionWidth,
                            height: widget.captionHeight,
                            imageBytes: widget.captionImageBytes!,
                          )
                        : ImageContainer(
                            width: widget.captionWidth,
                            height: widget.captionHeight,
                            uri: widget.captionImageUri!,
                          ),
                  ),
                if (widget.title != null)
                  Container(
                    width: widget.titleAreaWidth,
                    height: widget.titleAreaHeight,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        top: widget.titleTopPadding,
                        left: widget.titleLeftPadding),
                    child: WMarquee(
                      focused: isFocused,
                      usingDefaultMouseRegion: false,
                      text: widget.title!,
                      style: widget.textStyle ??
                          DefaultTextStyle.of(context).style,
                      hoverStyle: widget.hoverTextStyle ?? widget.textStyle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
