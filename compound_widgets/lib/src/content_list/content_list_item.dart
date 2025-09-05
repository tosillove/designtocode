import 'dart:typed_data';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * A widget that represents a content list item with customizable properties.
 * This widget displays an image and a title, with optional download functionality.
 */

class ContentListItem extends StatefulWidget {
  /*
   * Creates a [ContentListItem].
   * The parameters allow customization of the item's appearance and behavior.
   *
   * @param itemWidth The width of the item. Defaults to 711.
   * @param itemHeight The height of the item. Defaults to 441.
   * @param imageWidth The width of the image. Defaults to 618.
   * @param imageHeight The height of the image. Defaults to 348.
   * @param imgUrl The URL of the image to display. Defaults to 'assets/compound_images/contentlist/Rectangle_0.webp'.
   * @param borderRadius The border radius of the item. Defaults to 36.
   * @param borderSize The size of the border. Defaults to 2.
   * @param borderColor The color of the border. Defaults to white.
   * @param focusedBorderRadius The border radius when focused. Defaults to 41.4.
   * @param focusedBorderSize The size of the border when focused. Defaults to 2.3.
   * @param focusedBorderColor The color of the border when focused. Defaults to white.
   * @param isDownload Indicates if the item has a download option. Defaults to false.
   * @param downloadimageWidth The width of the download image. Defaults to 96.
   * @param downloadimageHeight The height of the download image. Defaults to 96.
   * @param downloadimgUrl The URL of the download image. Defaults to 'assets/compound_images/contentlist/ic_download_n.png'.
   * @param downloadTopPadding The top padding for the download image. Defaults to 146.
   * @param downloadLeftPadding The left padding for the download image. Defaults to 261.
   * @param downloadFillsColor The fill color for the download container. Defaults to black.
   * @param downloadFillsColorOpacity The opacity of the fill color. Defaults to 0.2.
   * @param downloadBorderSize The size of the download border. Defaults to 3.
   * @param downloadBorderColor The color of the download border. Defaults to white.
   * @param downloadBorderColorOpacity The opacity of the download border color. Defaults to 0.5.
   * @param downloadBorderRadius The border radius of the download container. Defaults to 18.
   * @param spacingTitleAndImage The spacing between the title and the image. Defaults to 36.
   * @param textAreaHeight The height of the text area for the title. Defaults to 57.
   * @param textAreaWidth The width of the text area for the title. Defaults to 618.
   * @param title The title text to display. Defaults to 'Title'.
   * @param titleFontSize The font size of the title. Defaults to 48.
   * @param titleFontColor The color of the title text. Defaults to white.
   * @param marqueeSpeed The speed of the marquee effect for the title. Defaults to 50.
   */
  const ContentListItem({
    super.key,
    this.itemWidth = 711,
    this.itemHeight = 441,
    this.imageWidth = 618,
    this.imageHeight = 348,
    this.imgUrl = 'assets/compound_images/contentlist/Rectangle_0.webp',
    this.borderRadius = 36,
    this.borderSize = 2,
    this.borderColor = Colors.white,
    this.borderColorOpacity = 0.3,
    this.focusedBorderRadius = 41.4,
    this.focusedBorderSize = 2.3,
    this.focusedBorderColor = Colors.white,
    this.isDownload = false,
    this.downloadimageWidth = 96,
    this.downloadimageHeight = 96,
    this.downloadimgUrl =
        'assets/compound_images/contentlist/ic_download_n.png',
    this.downloadTopPadding = 146,
    this.downloadLeftPadding = 261,
    this.downloadFillsColor = Colors.black,
    this.downloadFillsColorOpacity = 0.2,
    this.downloadBorderSize = 3,
    this.downloadBorderColor = Colors.white,
    this.downloadBorderColorOpacity = 0.5,
    this.downloadBorderRadius = 18,
    this.spacingTitleAndImage = 36,
    this.textAreaHeight = 57,
    this.textAreaWidth = 618,
    this.title = 'Title',
    this.titleFontSize = 48,
    this.titleFontColor = Colors.white,
    this.marqueeSpeed = 50,
    this.semanticsLabel = "",
  })  : imgBytes = null,
        downloadimgBytes = null;

  const ContentListItem.bytes({
    super.key,
    this.itemWidth = 711,
    this.itemHeight = 441,
    this.imageWidth = 618,
    this.imageHeight = 348,
    this.imgBytes,
    this.borderRadius = 36,
    this.borderSize = 2,
    this.borderColor = Colors.white,
    this.borderColorOpacity = 0.3,
    this.focusedBorderRadius = 41.4,
    this.focusedBorderSize = 2.3,
    this.focusedBorderColor = Colors.white,
    this.isDownload = false,
    this.downloadimageWidth = 96,
    this.downloadimageHeight = 96,
    this.downloadimgBytes,
    this.downloadTopPadding = 146,
    this.downloadLeftPadding = 261,
    this.downloadFillsColor = Colors.black,
    this.downloadFillsColorOpacity = 0.2,
    this.downloadBorderSize = 3,
    this.downloadBorderColor = Colors.white,
    this.downloadBorderColorOpacity = 0.5,
    this.downloadBorderRadius = 18,
    this.spacingTitleAndImage = 36,
    this.textAreaHeight = 57,
    this.textAreaWidth = 618,
    this.title = 'Title',
    this.titleFontSize = 48,
    this.titleFontColor = Colors.white,
    this.marqueeSpeed = 50,
    this.semanticsLabel = "",
  })  : imgUrl = null,
        downloadimgUrl = null;

  final double itemWidth;
  final double itemHeight;
  final double imageWidth;
  final double imageHeight;
  final String? imgUrl;
  final Uint8List? imgBytes;
  final double borderRadius;
  final double borderSize;
  final Color borderColor;
  final double borderColorOpacity;
  final double focusedBorderRadius;
  final double focusedBorderSize;
  final Color focusedBorderColor;
  final bool isDownload;
  final double downloadimageWidth;
  final double downloadimageHeight;
  final String? downloadimgUrl;
  final Uint8List? downloadimgBytes;
  final double downloadTopPadding;
  final double downloadLeftPadding;
  final Color downloadFillsColor;
  final double downloadFillsColorOpacity;
  final double downloadBorderSize;
  final Color downloadBorderColor;
  final double downloadBorderColorOpacity;
  final double downloadBorderRadius;
  final double spacingTitleAndImage;
  final double textAreaHeight;
  final double textAreaWidth;
  final String title;
  final double titleFontSize;
  final Color titleFontColor;
  final double marqueeSpeed;
  final String semanticsLabel;

  @override
  State<ContentListItem> createState() => _ContentListItemState();
}

class _ContentListItemState extends State<ContentListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<dynamic> _animation;
  late Animation<dynamic> _paddingAnimation;

  final int _animationDuration = 400;

  bool isFocused = false;

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: _animationDuration),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(_listener);

    _paddingAnimation = Tween<double>(
      begin: 0,
      end: 24,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(_listener);
  }

  @override
  void dispose() {
    _paddingAnimation.removeListener(_listener);
    _animation.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: SizedBox(
        width: widget.itemWidth,
        height: widget.itemHeight,
        child: Column(
          children: [
            WFocusable(
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
              child: Transform.scale(
                scale: _animation.value as double,
                child: Stack(
                  children: [
                    WButton(
                      size: Size(widget.imageWidth, widget.imageHeight),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          width: widget.borderSize,
                          color: widget.borderColor
                              .withOpacity(widget.borderColorOpacity),
                          strokeAlign: BorderSide.strokeAlignInside,
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.borderRadius)),
                      ),
                      decorationHovered: BoxDecoration(
                        border: Border.all(
                          width: widget.focusedBorderSize,
                          color: widget.focusedBorderColor,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.focusedBorderRadius)),
                      ),
                      onPressed: _onPressed,
                      child: (color, focus, isHovered) {
                        return widget.imgBytes != null
                            ? ImageContainer.bytes(
                                imageBytes: widget.imgBytes,
                                width: widget.imageWidth,
                                height: widget.imageHeight,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.imgUrl!,
                                color: null,
                              );
                      },
                    ),
                    if (widget.isDownload)
                      Container(
                        margin: EdgeInsets.only(
                          top: widget.downloadTopPadding,
                          left: widget.downloadLeftPadding,
                        ),
                        decoration: BoxDecoration(
                          color: widget.downloadFillsColor
                              .withOpacity(widget.downloadFillsColorOpacity),
                          border: Border.all(
                            width: widget.downloadBorderSize,
                            color: widget.downloadBorderColor
                                .withOpacity(widget.downloadBorderColorOpacity),
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(widget.downloadBorderRadius),
                          ),
                        ),
                        child: widget.downloadimgBytes != null
                            ? ImageContainer.bytes(
                                imageBytes: widget.downloadimgBytes,
                                width: widget.downloadimageWidth,
                                height: widget.downloadimageHeight,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.downloadimgUrl!,
                                width: widget.downloadimageWidth,
                                height: widget.downloadimageHeight,
                              ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: widget.spacingTitleAndImage,
            ),
            SizedBox(
              height: widget.textAreaHeight,
              width: widget.textAreaWidth,
              child: WMarquee(
                text: widget.title,
                style: WFont.instance.semiBold.copyWith(
                    fontSize: widget.titleFontSize,
                    color: widget.titleFontColor,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 2),
                      ),
                    ]),
                velocity: widget.marqueeSpeed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    //to do
    if (widget.isDownload) {
      debugPrint('isDownload _onPressed');
    } else {
      debugPrint('_onPressed');
    }
  }
}
