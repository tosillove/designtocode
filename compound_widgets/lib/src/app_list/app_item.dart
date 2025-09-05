import 'dart:typed_data';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

import 'badget_item.dart';

enum AppIconState {
  idle,
  newlyInstalled,
  canUpdate,
  downloading,
  locking,
  bookmark,
}

class AppItem extends StatefulWidget {
  const AppItem({
    super.key,
    this.aniCurve = Curves.linear,
    this.aniDuration = 400,
    this.itemWidth = 360,
    this.itemHeight = 336,
    this.imageWidth = 252,
    this.imageHeight = 252,
    required this.url,
    required this.backgroundColor,
    required this.appTitle,
    this.titleStyle,
    this.titleHoverStyle,
    this.squircleRadius = 0.70,
    this.spacingTitleAndImage = 24,
    this.imageFit = BoxFit.cover,
    this.textAreaHeight = 60,
    this.textAreaWidth,
    this.marqueeSpeed = 50,
    this.onTap,
    this.appLabel,
    this.badgeStyle = AppIconState.idle,
    this.progressPpercent = 0,
    this.isShowLabel = false,
    this.labelStyle,
    this.labelHoverStyle,
    this.labelTopPadding = 190,
    this.progressTopPadding = 209,
    this.progressLeftPadding = 33,
    this.progressRightPadding = 33,
    this.progressBottomPadding = 33,
    this.progressWidth = 186,
    this.progressHeight = 10,
    this.progressBgColor = Colors.black,
    this.progressColor = Colors.white,
    this.circleTopPadding = 33,
    this.circleBottomPadding = 199,
    this.circleLeftPadding = 199,
    this.circleRightPadding = 33,
    this.circleColor = Colors.white,
    this.circleWidth = 20,
    this.circleHeight = 20,
    this.lockingColor = Colors.white,
    this.lockingTopPadding = 27,
    this.lockingLeftPadding = 195,
    this.lockingRightPadding = 33,
    this.lockingBottomPadding = 193,
    this.lockingWidth = 24,
    this.lockingHeight = 32,
    this.lockingimageUrl = 'assets/compound_images/applist/ic_lock.png',
    this.bookmarkHeight = 84,
    this.bookmarkWidth = 84,
    this.bookmarkTopPadding = 168,
    this.bookmarkLeftPadding = 168,
    this.bookmarkUrl = 'assets/compound_images/applist/ic_add_to_home.png',
    this.itemBorderImage = 'assets/compound_images/applist/bg_app_copy_16.png',
    this.isSelected = false,
    this.semanticsLabel = "",
  })  : imageBytes = null,
        itemBorderImageBytes = null;

  const AppItem.bytes({
    super.key,
    this.aniCurve = Curves.linear,
    this.aniDuration = 400,
    this.itemWidth = 360,
    this.itemHeight = 336,
    this.imageWidth = 252,
    this.imageHeight = 252,
    required this.imageBytes,
    required this.backgroundColor,
    required this.appTitle,
    this.titleStyle,
    this.titleHoverStyle,
    this.squircleRadius = 0.70,
    this.spacingTitleAndImage = 24,
    this.imageFit = BoxFit.cover,
    this.textAreaHeight = 60,
    this.textAreaWidth,
    this.marqueeSpeed = 50,
    this.onTap,
    this.appLabel,
    this.badgeStyle = AppIconState.idle,
    this.progressPpercent = 0,
    this.isShowLabel = false,
    this.labelStyle,
    this.labelHoverStyle,
    this.labelTopPadding = 190,
    this.progressTopPadding = 209,
    this.progressLeftPadding = 33,
    this.progressRightPadding = 33,
    this.progressBottomPadding = 33,
    this.progressWidth = 186,
    this.progressHeight = 10,
    this.progressBgColor = Colors.black,
    this.progressColor = Colors.white,
    this.circleTopPadding = 33,
    this.circleBottomPadding = 199,
    this.circleLeftPadding = 199,
    this.circleRightPadding = 33,
    this.circleColor = Colors.white,
    this.circleWidth = 20,
    this.circleHeight = 20,
    this.lockingColor = Colors.white,
    this.lockingTopPadding = 27,
    this.lockingLeftPadding = 195,
    this.lockingRightPadding = 33,
    this.lockingBottomPadding = 193,
    this.lockingWidth = 24,
    this.lockingHeight = 32,
    this.lockingimageUrl = 'assets/compound_images/applist/ic_lock.png',
    this.bookmarkHeight = 84,
    this.bookmarkWidth = 84,
    this.bookmarkTopPadding = 168,
    this.bookmarkLeftPadding = 168,
    this.bookmarkUrl = 'assets/compound_images/applist/ic_add_to_home.png',
    required this.itemBorderImageBytes,
    this.isSelected = false,
    this.semanticsLabel = "",
  })  : url = null,
        itemBorderImage = null;

  // The value of AnimationCurve. Default value is Curves.linear
  final Curve aniCurve;

  // The value of AnimationSpeed. Default value is 400ms.
  final int aniDuration;

  // The width of the item. Default value is 360.
  final double itemWidth;

  // The height of the item. Default value is 336.
  final double itemHeight;

  // The height of the image. Default value is 252.
  final double imageHeight;

  // The width of the image. Default value is 252.
  final double imageWidth;

  // The byteArry of the image.
  final Uint8List? imageBytes;

  // The URL of the image.
  final String? url;

  // The background color of the item.
  final Color backgroundColor;

  // The title of the app.
  final String appTitle;

  // The text style of the title. (nullable)
  final TextStyle? titleStyle;

  // The text style of the title when hovered. (nullable)
  final TextStyle? titleHoverStyle;

  // The radius of the squircle between the title and the image. Default value is 0.6.
  final double squircleRadius;

  // The spacing between the title and the image. Default value is 24.
  final double spacingTitleAndImage;

  // The fit of the image. Default value is BoxFit.cover.
  final BoxFit imageFit;

  // The height of the text area. Default value is 60.
  final double textAreaHeight;

  // The height of the text area. Default value is imageWidth.
  final double? textAreaWidth;

  // The value of speed at marquee.
  final double marqueeSpeed;

  // Callback Function when tab action occurred
  final VoidCallback? onTap;

  // The String value of Application label
  final String? appLabel;

  // badge Style
  final AppIconState badgeStyle;

  // value of percent at progressbar
  final double progressPpercent;

  // when this value is true, display application title
  final bool isShowLabel;

  // The text style of the label. (nullable)
  final TextStyle? labelStyle;

  // The text style of the label when hovered. (nullable)
  final TextStyle? labelHoverStyle;

  // The value of App Label top padding
  final double labelTopPadding;
  // The top padding for the progress bar.
  final double progressTopPadding;
  // The left padding for the progress bar.
  final double progressLeftPadding;
  // The right padding for the progress bar.
  final double progressRightPadding;
  // The bottom padding for the progress bar.
  final double progressBottomPadding;

  // The width of the progress bar.
  final double progressWidth;
  // The height of the progress bar.
  final double progressHeight;

  // The color of the progress indicator.
  final Color progressColor;
  // The background color of the progress bar.
  final Color progressBgColor;

  // The top padding for the circle indicator.
  final double circleTopPadding;
  // The left padding for the circle indicator.
  final double circleLeftPadding;
  // The right padding for the circle indicator.
  final double circleRightPadding;
  // The bottom padding for the circle indicator.
  final double circleBottomPadding;
  // The color of the circle indicator.
  final Color circleColor;
  // The width of the circle indicator.
  final double circleWidth;
  // The height of the circle indicator.
  final double circleHeight;

  // The color of the locking icon.
  final Color lockingColor;
  // The top padding for the locking icon.
  final double lockingTopPadding;
  // The left padding for the locking icon.
  final double lockingLeftPadding;
  // The right padding for the locking icon.
  final double lockingRightPadding;
  // The bottom padding for the locking icon.
  final double lockingBottomPadding;
  // The width of the locking icon.
  final double lockingWidth;
  // The height of the locking icon.
  final double lockingHeight;
  // The image URL for the locking icon.
  final String lockingimageUrl;

  // The width of the bookmark icon.
  final double bookmarkWidth;
  // The height of the bookmark icon.
  final double bookmarkHeight;
  // The top padding for the bookmark icon.
  final double bookmarkTopPadding;
  // The left padding for the bookmark icon.
  final double bookmarkLeftPadding;
  // The image URL for the bookmark icon.
  final String bookmarkUrl;

  // The image URL for the item's border.
  final String? itemBorderImage;

  final Uint8List? itemBorderImageBytes;

  // Determines whether the item is selected.
  final bool isSelected;

  // The semantic label for accessibility.
  final String semanticsLabel;

  @override
  State<AppItem> createState() => _AppItemState();
}

class _AppItemState extends State<AppItem> with SingleTickerProviderStateMixin {
  ////
  late AnimationController _controller;
  late Animation<dynamic> _animation;
  late Animation<dynamic> _paddingAnimation;

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
      end: 1.20,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.aniCurve,
      ),
    )..addListener(_listener);

    _paddingAnimation = Tween<double>(
      begin: 0,
      end: 24,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.aniCurve,
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

  void callTabFunction() {
    if (widget.onTap != null) {
      widget.onTap!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel,
      child: Container(
        width: widget.itemWidth,
        height: widget.itemHeight,
        alignment: Alignment.topCenter,
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
              onTap: callTabFunction,
              child: Transform.scale(
                scale: widget.isSelected ? 1.2 : _animation.value as double,
                child: Stack(
                  children: [
                    SizedBox(
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      child: ClipPath(
                        clipper: SquircleClipper(),
                        child: Container(
                          color: widget.backgroundColor,
                          child: widget.imageBytes != null
                              ? ImageContainer.bytes(
                                  width: widget.imageWidth,
                                  height: widget.imageHeight,
                                  imageBytes: widget.imageBytes,
                                  fit: widget.imageFit,
                                )
                              : ImageContainer(
                                  width: widget.imageWidth,
                                  height: widget.imageHeight,
                                  uri: widget.url,
                                  fit: widget.imageFit,
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                      child: widget.itemBorderImageBytes != null
                          ? ImageContainer.bytes(
                              width: widget.imageWidth,
                              height: widget.imageHeight,
                              imageBytes: widget.itemBorderImageBytes,
                              fit: widget.imageFit,
                            )
                          : ImageContainer(
                              width: widget.imageWidth,
                              height: widget.imageHeight,
                              uri: widget.itemBorderImage,
                              fit: widget.imageFit,
                            ),
                    ),
                    if (widget.isShowLabel && widget.appLabel != null)
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: widget.labelTopPadding),
                        width: widget.imageWidth,
                        height: widget.imageHeight,
                        child: WMarquee(
                          text: widget.appLabel!,
                          style: widget.labelStyle ??
                              DefaultTextStyle.of(context).style,
                          hoverStyle:
                              widget.labelHoverStyle ?? widget.labelStyle,
                        ),
                      ),
                    if (widget.badgeStyle == AppIconState.downloading)
                      Container(
                        margin: EdgeInsets.only(
                          top: widget.progressTopPadding,
                          left: widget.progressLeftPadding,
                        ),
                        child: BadgeItem(
                          state: AppIconState.downloading,
                          progressWidth: widget.progressWidth,
                          progressHeight: widget.progressHeight,
                          progressBgColor: widget.progressBgColor,
                          progressColor: widget.progressColor,
                          progressPercent: widget.progressPpercent,
                        ),
                      ),
                    if (widget.badgeStyle == AppIconState.newlyInstalled ||
                        widget.badgeStyle == AppIconState.canUpdate)
                      Container(
                        margin: EdgeInsets.only(
                          top: widget.circleTopPadding,
                          left: widget.circleLeftPadding,
                        ),
                        child: BadgeItem(
                          state: AppIconState.canUpdate,
                          circleColor: widget.circleColor,
                          circleHeight: widget.circleHeight,
                          circleWidth: widget.circleWidth,
                        ),
                      ),
                    if (widget.badgeStyle == AppIconState.locking)
                      Container(
                        margin: EdgeInsets.only(
                          top: widget.lockingTopPadding,
                          left: widget.lockingLeftPadding,
                        ),
                        child: BadgeItem(
                          lockingUrl: widget.lockingimageUrl,
                          state: AppIconState.locking,
                          lockingColor: widget.lockingColor,
                          lockingWidth: widget.lockingWidth,
                          lockingHeight: widget.lockingHeight,
                        ),
                      ),
                    if (widget.badgeStyle == AppIconState.bookmark)
                      Container(
                        margin: EdgeInsets.only(
                          top: widget.bookmarkTopPadding,
                          left: widget.bookmarkLeftPadding,
                        ),
                        child: BadgeItem(
                          state: AppIconState.bookmark,
                          bookmarkUrl: widget.bookmarkUrl,
                          bookmarkWidth: widget.bookmarkWidth,
                          bookmarkHeight: widget.bookmarkHeight,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: widget.spacingTitleAndImage +
                  (widget.isSelected ? 24 : _paddingAnimation.value),
            ),
            SizedBox(
              height: widget.textAreaHeight,
              width: widget.textAreaWidth ?? widget.imageWidth,
              child: WMarquee(
                text: widget.appTitle,
                style: widget.titleStyle ?? DefaultTextStyle.of(context).style,
                hoverStyle: widget.titleHoverStyle ?? widget.titleStyle,
                velocity: widget.marqueeSpeed,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SquircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    double minRatio = 0.06;
    double maxRatio = 1 - minRatio;

    double wOffset = w * 0.004;
    double hOffset = h * 0.004;

    Path path = Path();
    path.moveTo(wOffset, h / 2);

    path.cubicTo(wOffset, (h * minRatio) + hOffset, (w * minRatio) + wOffset,
        hOffset, w / 2, hOffset); // 1
    path.cubicTo((w * maxRatio) - wOffset, hOffset, w - wOffset,
        (h * minRatio) + wOffset, w - wOffset, h / 2); //2
    path.cubicTo(w - wOffset, (h * maxRatio) - hOffset,
        (w * maxRatio) - wOffset, h - hOffset, w / 2, h - hOffset); //4
    path.cubicTo((w * minRatio) + wOffset, h - hOffset, wOffset,
        (h * maxRatio) - hOffset, wOffset, h / 2); //3
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
