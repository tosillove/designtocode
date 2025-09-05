import 'dart:async';

import 'package:compound_widgets/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plover/plover.dart';

class QCardListView extends StatefulWidget {
  const QCardListView({
    super.key,
    this.animatedScale = 1.15,
    this.animDuration = 400,
    this.buttonScrollCurve = Curves.linear,
    this.buttonScrollDistance = 480 + 72,
    this.buttonScrollDuration = const Duration(milliseconds: 100),
    this.cacheExtent,
    this.carouselController,
    this.childMargin = 72,
    this.clipper,
    this.delayAutoScroll = 500,
    this.direction = Axis.horizontal,
    this.enterAnimCurve = Curves.easeOutBack,
    this.exitAnimCurve,
    this.focusEmphasisBoxDecoration,
    this.header,
    this.height = 270,
    this.initialOfFocused = 0,
    this.isChangedUser = false,
    required this.itemBuilder,
    this.itemConfigBuilder,
    required this.itemCount,
    this.itemHeader,
    this.itemHeaderKey,
    this.itemKey,
    this.itemLabel,
    this.leftArrowBoxDecoration =
        const BoxDecoration(color: Colors.transparent),
    this.leftArrowHeight = 126,
    this.leftArrowImageFocus =
        'assets/compound_images/qcard/arrow_more_l_f.png',
    this.leftArrowMargin = const EdgeInsets.only(right: 60),
    this.leftArrowImageNormal =
        'assets/compound_images/qcard/arrow_more_l_n.png',
    this.leftArrowWidth = 126,
    this.longPressDuration = const Duration(seconds: 1),
    this.onAnimationFinished,
    this.onFocusChangeItem,
    this.onFocusedItemAnimationChange,
    this.onLongPress,
    this.onShowItem,
    this.onTap,
    this.onTapItemHeader,
    this.padding = EdgeInsets.zero,
    this.registeredLongPressKeys = const <LogicalKeyboardKey>[
      LogicalKeyboardKey.enter
    ],
    this.registeredTapKeys = const <LogicalKeyboardKey>[
      LogicalKeyboardKey.enter
    ],
    this.rightArrowBoxDecoration =
        const BoxDecoration(color: Colors.transparent),
    this.rightArrowHeight = 126,
    this.rightArrowImageFocus =
        'assets/compound_images/qcard/arrow_more_r_f.png',
    this.rightArrowMargin = const EdgeInsets.only(left: 60),
    this.rightArrowImageNormal =
        'assets/compound_images/qcard/arrow_more_r_n.png',
    this.rightArrowWidth = 126,
    this.scrollController,
    this.scrollType = Curves.linear,
    this.scrollZone = 60,
    this.shelfId = '',
    this.shouldScaleFirstAndLastItemFromEdge = true,
    this.speedScrolling = 1,
    this.typeVoiceItemHeader = VCIntent.delete,
    this.width = 3060,
  })  : rightArrowImageFocusBytes = null,
        leftArrowImageFocusBytes = null,
        rightArrowImageNormalBytes = null,
        leftArrowImageNormalBytes = null;

  const QCardListView.bytes({
    super.key,
    this.animatedScale = 1.15,
    this.animDuration = 400,
    this.buttonScrollCurve = Curves.linear,
    this.buttonScrollDistance = 480 + 72,
    this.buttonScrollDuration = const Duration(milliseconds: 100),
    this.cacheExtent,
    this.carouselController,
    this.childMargin = 72,
    this.clipper,
    this.delayAutoScroll = 500,
    this.direction = Axis.horizontal,
    this.enterAnimCurve = Curves.easeOutBack,
    this.exitAnimCurve,
    this.focusEmphasisBoxDecoration,
    this.header,
    this.height = 270,
    this.initialOfFocused = 0,
    this.isChangedUser = false,
    required this.itemBuilder,
    this.itemConfigBuilder,
    required this.itemCount,
    this.itemHeader,
    this.itemHeaderKey,
    this.itemKey,
    this.itemLabel,
    this.leftArrowBoxDecoration =
        const BoxDecoration(color: Colors.transparent),
    this.leftArrowHeight = 126,
    this.leftArrowImageFocusBytes,
    this.leftArrowMargin = const EdgeInsets.only(right: 60),
    this.leftArrowImageNormalBytes,
    this.leftArrowWidth = 126,
    this.longPressDuration = const Duration(seconds: 1),
    this.onAnimationFinished,
    this.onFocusChangeItem,
    this.onFocusedItemAnimationChange,
    this.onLongPress,
    this.onShowItem,
    this.onTap,
    this.onTapItemHeader,
    this.padding = EdgeInsets.zero,
    this.registeredLongPressKeys = const <LogicalKeyboardKey>[
      LogicalKeyboardKey.enter
    ],
    this.registeredTapKeys = const <LogicalKeyboardKey>[
      LogicalKeyboardKey.enter
    ],
    this.rightArrowBoxDecoration =
        const BoxDecoration(color: Colors.transparent),
    this.rightArrowHeight = 126,
    this.rightArrowImageFocusBytes,
    this.rightArrowMargin = const EdgeInsets.only(left: 60),
    this.rightArrowImageNormalBytes,
    this.rightArrowWidth = 126,
    this.scrollController,
    this.scrollType = Curves.linear,
    this.scrollZone = 60,
    this.shelfId = '',
    this.shouldScaleFirstAndLastItemFromEdge = true,
    this.speedScrolling = 1,
    this.typeVoiceItemHeader = VCIntent.delete,
    this.width = 3060,
  })  : rightArrowImageFocus = null,
        leftArrowImageFocus = null,
        rightArrowImageNormal = null,
        leftArrowImageNormal = null;

  final double animatedScale;

  /// Enter animation duration
  final int animDuration;

  final Curve buttonScrollCurve;

  final double buttonScrollDistance;

  final Duration buttonScrollDuration;

  // The Listview cacheExtent
  final double? cacheExtent;

  final WAnimatedCarouselController? carouselController;

  /// Children's margin
  final double childMargin;

  final CustomClipper<Path>? clipper;

  /// time for delay auto scroll
  final int delayAutoScroll;

  /// Axis direction, can be [Axis.horizontal] or [Axis.vertical]
  final Axis direction;

  /// Enter animation effect
  final Curve enterAnimCurve;

  /// Exit animation effect
  final Curve? exitAnimCurve;

  /// BoxDecoration for emphasize the focus effect.
  final BoxDecoration? focusEmphasisBoxDecoration;

  /// Header builder
  final Widget Function(bool animation)? header;

  final double height;

  /// initial item focus when this widget created
  final int? initialOfFocused;

  final bool isChangedUser;

  /// List of children
  final Widget Function(BuildContext context, int index, bool isFocus)
      itemBuilder;

  ///Optional item configuration
  final AnimatedCarouselItemConfig? Function(int index)? itemConfigBuilder;

  /// The total number of items
  final int itemCount;

  /// Item header builder
  final Widget? Function(bool animation, int index, bool isItemFocused)?
      itemHeader;

  /// Unique key for each item to serve request focus by id
  final String? Function(int index)? itemHeaderKey;

  /// Unique key for each item to serve request focus by id
  final String? Function(int index)? itemKey;

  /// Unique label for each item to handle voice control requests
  final List<String> Function(int index)? itemLabel;

  final BoxDecoration leftArrowBoxDecoration;

  final double leftArrowHeight;

  final String? leftArrowImageFocus;

  final Uint8List? leftArrowImageFocusBytes;

  final EdgeInsetsGeometry? leftArrowMargin;

  final String? leftArrowImageNormal;

  final Uint8List? leftArrowImageNormalBytes;

  final double leftArrowWidth;

  /// Duration of a long press
  final Duration longPressDuration;

  final FutureOr<dynamic> Function(void)? onAnimationFinished;

  /// Focus status change callback of the item
  final void Function(bool isFocus, int index)? onFocusChangeItem;

  /// Listen to size and offset changes (based on animation status) of the
  /// focused item
  final void Function(
          int index, AnimationStatus animationStatus, Size size, Offset offset)?
      onFocusedItemAnimationChange;

  // onLongPress
  final void Function(int index, KeyEvent? keyEvent)? onLongPress;

  // On activate the item callback, can be triggered by voice control show command.
  final void Function(int index)? onShowItem;

  /// On activate the item callback, can be triggered by pointer middle button or enter key.
  final void Function(int index)? onTap;

  /// On activate the item callback, can be triggered by pointer middle button or enter key.
  final void Function(int index)? onTapItemHeader;

  final EdgeInsetsGeometry? padding;

  /// The keys to be registered for long press listening
  final List<LogicalKeyboardKey> registeredLongPressKeys;

  /// The keys to be registered for onTap listening
  final List<LogicalKeyboardKey> registeredTapKeys;

  final BoxDecoration rightArrowBoxDecoration;

  final double rightArrowHeight;

  final String? rightArrowImageFocus;

  final Uint8List? rightArrowImageFocusBytes;

  final EdgeInsetsGeometry? rightArrowMargin;

  final String? rightArrowImageNormal;

  final Uint8List? rightArrowImageNormalBytes;

  final double rightArrowWidth;

  final ScrollController? scrollController;

  /// Supported type of scrolling type
  final Curve scrollType;

  /// area handle scroll
  final double scrollZone;

  final String shelfId;

  /// Should set the origin of scaling of first and last item from its last
  /// edge.
  final bool shouldScaleFirstAndLastItemFromEdge;

  /// Scroll speed
  final double speedScrolling;

  /// type voice control of item top
  final VCIntent typeVoiceItemHeader;

  final double width;

  @override
  State<QCardListView> createState() => _QCardListViewState();
}

class _QCardListViewState extends State<QCardListView>
    with TickerProviderStateMixin {
  WFocusNode focusNode = WFocusNode();

  late ScrollController _controller;

  bool get isFocusRing => WTheme.of(context)?.applyFocusRing ?? false;

  bool _showScrollBackwardButton = false;
  bool _showScrollForwardButton = false;

  @override
  void initState() {
    _controller = widget.scrollController ?? ScrollController();
    _controller.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (_controller.position.maxScrollExtent > 0) {
          setState(() => _showScrollForwardButton = true);
        }
      },
    );

    super.initState();
  }

  _scrollListener() {
    if (_controller.position.atEdge) {
      if (_controller.position.minScrollExtent == _controller.offset) {
        _showScrollBackwardButton = false;
      } else if (_controller.position.maxScrollExtent == _controller.offset) {
        _showScrollForwardButton = false;
      }

      setState(() {});
    } else if (!_showScrollBackwardButton || !_showScrollForwardButton) {
      _showScrollBackwardButton = true;
      _showScrollForwardButton = true;

      setState(() {});
    }
  }

  _setupAnimation() {
    WidgetsBinding.instance.addPostFrameCallback(
      (value) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted && widget.isChangedUser) {
            _controller
                .animateTo(0,
                    duration: const Duration(microseconds: 10),
                    curve: Curves.linear)
                .whenComplete(() {});
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLtoR =
        Directionality.of(context) == TextDirection.ltr ? true : false;

    _setupAnimation();
    return Container(
      height: widget.height,
      width: widget.width,
      padding: widget.padding,
      child: Row(
        children: [
          Opacity(
            opacity: _showScrollBackwardButton ? 1 : 0,
            child: WButton(
              focusNode: focusNode,
              child: (color, isHovered, focused) {
                return widget.leftArrowImageFocusBytes != null
                    ? ImageContainer.bytes(
                        width: isLtoR
                            ? widget.leftArrowWidth
                            : widget.rightArrowWidth,
                        height: isLtoR
                            ? widget.leftArrowHeight
                            : widget.rightArrowHeight,
                        imageBytes: isHovered || focused
                            ? (isLtoR
                                ? widget.leftArrowImageFocusBytes
                                : widget.rightArrowImageFocusBytes)
                            : (isLtoR
                                ? widget.leftArrowImageNormalBytes
                                : widget.rightArrowImageNormalBytes),
                      )
                    : ImageContainer(
                        width: isLtoR
                            ? widget.leftArrowWidth
                            : widget.rightArrowWidth,
                        height: isLtoR
                            ? widget.leftArrowHeight
                            : widget.rightArrowHeight,
                        uri: isHovered || focused
                            ? (isLtoR
                                ? widget.leftArrowImageFocus
                                : widget.rightArrowImageFocus)
                            : (isLtoR
                                ? widget.leftArrowImageNormal
                                : widget.rightArrowImageNormal),
                      );
              },
              decoration: isLtoR
                  ? widget.leftArrowBoxDecoration
                  : widget.rightArrowBoxDecoration,
              onPressed: () {
                _scrollToBackward();
              },
              size: isLtoR
                  ? Size(widget.leftArrowWidth, widget.leftArrowHeight)
                  : Size(widget.rightArrowWidth, widget.rightArrowHeight),
              margin: isLtoR ? widget.leftArrowMargin : widget.rightArrowMargin,
            ),
          ),
          Expanded(
            child: ClipPath(
              clipper: widget.clipper ?? DefaultCustomClipper(),
              child: WAnimatedCarousel(
                direction: widget.direction,
                speedScrolling: widget.speedScrolling,
                itemBuilder: widget.itemBuilder,
                childMargin: widget.childMargin,
                animatedScale: widget.animatedScale,
                onTap: (index) => widget.onTap?.call(index),
                onLongPress: widget.onLongPress,
                onFocusChangeItem: widget.onFocusChangeItem,
                animDuration: widget.animDuration,
                enterAnimCurve: widget.enterAnimCurve,
                exitAnimCurve: widget.exitAnimCurve,
                header: widget.header,
                controller: _controller,
                scrollZone: widget.scrollZone,
                itemHeader: widget.itemHeader,
                itemConfigBuilder: widget.itemConfigBuilder ??
                    (index) {
                      if (!isFocusRing) {
                        return null;
                      }
                      return const AnimatedCarouselItemConfig(
                        shouldScaleOnFocus: false,
                      );
                    },
                initialOfFocused: widget.initialOfFocused,
                scrollType: widget.scrollType,
                onFocusedItemAnimationChange:
                    widget.onFocusedItemAnimationChange,
                itemCount: widget.itemCount,
                shouldScaleFirstAndLastItemFromEdge:
                    widget.shouldScaleFirstAndLastItemFromEdge,
                itemKey: widget.itemKey ?? (index) => index.toString(),
                itemLabel: widget.itemLabel,
                groupLabel: widget.shelfId,
                itemHeaderKey: widget.itemHeaderKey,
                onTapItemHeader: widget.onTapItemHeader,
                typeVoiceItemHeader: widget.typeVoiceItemHeader,
                registeredLongPressKeys: widget.registeredLongPressKeys,
                registeredTapKeys: widget.registeredTapKeys,
                longPressDuration: widget.longPressDuration,
                carouselController: widget.carouselController,
                delayAutoScroll: widget.delayAutoScroll,
                cacheExtent: widget.cacheExtent,
                onShowItem: widget.onShowItem,
              ),
            ),
          ),
          Opacity(
            opacity: _showScrollForwardButton ? 1 : 0,
            child: WButton(
              focusNode: focusNode,
              child: (color, isHovered, focused) {
                return widget.leftArrowImageFocusBytes != null
                    ? ImageContainer.bytes(
                        width: isLtoR
                            ? widget.rightArrowWidth
                            : widget.leftArrowWidth,
                        height: isLtoR
                            ? widget.rightArrowHeight
                            : widget.leftArrowHeight,
                        imageBytes: isHovered || focused
                            ? (isLtoR
                                ? widget.rightArrowImageFocusBytes
                                : widget.leftArrowImageFocusBytes)
                            : (isLtoR
                                ? widget.rightArrowImageNormalBytes
                                : widget.leftArrowImageNormalBytes),
                      )
                    : ImageContainer(
                        width: isLtoR
                            ? widget.rightArrowWidth
                            : widget.leftArrowWidth,
                        height: isLtoR
                            ? widget.rightArrowHeight
                            : widget.leftArrowHeight,
                        uri: isHovered || focused
                            ? (isLtoR
                                ? widget.rightArrowImageFocus
                                : widget.leftArrowImageFocus)
                            : (isLtoR
                                ? widget.rightArrowImageNormal
                                : widget.leftArrowImageNormal),
                      );
              },
              decoration: isLtoR
                  ? widget.rightArrowBoxDecoration
                  : widget.leftArrowBoxDecoration,
              onPressed: () {
                _scrollToForward();
              },
              size: isLtoR
                  ? Size(widget.rightArrowWidth, widget.rightArrowHeight)
                  : Size(widget.leftArrowWidth, widget.leftArrowHeight),
              margin: isLtoR ? widget.rightArrowMargin : widget.leftArrowMargin,
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToBackward() {
    double offsetDifference = 0;

    if (_controller.offset % widget.buttonScrollDistance != 0) {
      offsetDifference = widget.buttonScrollDistance -
          _controller.offset % widget.buttonScrollDistance;
    }

    double newOffset =
        _controller.offset - widget.buttonScrollDistance + offsetDifference;

    _controller.animateTo(
      newOffset,
      duration: widget.buttonScrollDuration,
      curve: widget.buttonScrollCurve,
    );
  }

  void _scrollToForward() {
    double offsetDifference = 0;

    if (_controller.offset % widget.buttonScrollDistance != 0) {
      offsetDifference = _controller.offset % widget.buttonScrollDistance;
    }

    double newOffset =
        _controller.offset + widget.buttonScrollDistance - offsetDifference;

    _controller.animateTo(
      newOffset,
      duration: widget.buttonScrollDuration,
      curve: widget.buttonScrollCurve,
    );
  }
}

class DefaultCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(-45, -1000);
    path.lineTo(size.width + 45, -1000);
    path.lineTo(size.width + 45, size.height + 1000);
    path.lineTo(-45, size.height + 1000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
