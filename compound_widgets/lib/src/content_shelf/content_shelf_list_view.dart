import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plover/plover.dart';

class ContentShelfListView extends StatefulWidget {
  const ContentShelfListView({
    super.key,
    this.animatedScale = 1.15,
    this.animDuration = 400,
    this.cacheExtent,
    this.carouselController,
    this.childMargin = 48,
    this.controller,
    this.delayAutoScroll = 500,
    this.direction = Axis.horizontal,
    this.exitAnimCurve,
    this.enterAnimCurve = Curves.easeOutBack,
    this.focusEmphasisBoxDecoration,
    this.headerTitle = '',
    this.headerTitleAlign = WMarqueeAlign.left,
    this.headerTitleAlwaysScroll = false,
    this.headerTitleAnimOffset,
    this.headerTitleFocused = false,
    this.headerTitleHeight,
    this.headerTitleHoverStyle,
    this.headerTitleMarqueeSpacing = 20,
    this.headerTitlePadding = const EdgeInsets.only(left: 30, bottom: 39),
    this.headerTitleTextStyle,
    this.headerTitleUsingDefaultMouseRegion,
    this.headerTitleVelocity = 50,
    this.headerTitleWidth,
    this.height = 534,
    this.initialOfFocused,
    this.isLoading = false,
    this.isRTL = false,
    required this.itemBuilder,
    required this.itemCount,
    this.itemHeader,
    this.itemHeaderKey,
    this.itemConfigBuilder,
    this.itemKey,
    this.itemLabel,
    this.itemTitleBuilder,
    this.longPressDuration = const Duration(seconds: 1),
    this.onTap,
    this.onFocusChangeItem,
    this.onFocusedItemAnimationChange,
    this.onLongPress,
    this.onShowItem,
    this.onTapItemHeader,
    this.padding,
    this.registeredLongPressKeys = const <LogicalKeyboardKey>[
      LogicalKeyboardKey.enter
    ],
    this.registeredTapKeys = const <LogicalKeyboardKey>[
      LogicalKeyboardKey.enter
    ],
    this.scrollType = Curves.linear,
    this.scrollZone = 60,
    required this.shelfId,
    this.shouldScaleFirstAndLastItemFromEdge = true,
    this.speedScrolling = 1,
    this.typeVoiceItemHeader = VCIntent.delete,
    this.width = 2688,
  });

  final double animatedScale;

  /// Enter animation duration
  final int animDuration;

  /// The Listview cacheExtent
  final double? cacheExtent;

  /// controller to control function in WAnimatedCarousel
  final WAnimatedCarouselController? carouselController;

  final double childMargin;

  final ScrollController? controller;

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

  final String headerTitle;

  final WMarqueeAlign headerTitleAlign;

  final bool headerTitleAlwaysScroll;

  final double? headerTitleAnimOffset;

  final bool headerTitleFocused;

  final double? headerTitleHeight;

  final TextStyle? headerTitleHoverStyle;

  final double headerTitleMarqueeSpacing;

  final EdgeInsets? headerTitlePadding;

  final TextStyle? headerTitleTextStyle;

  final bool? headerTitleUsingDefaultMouseRegion;

  final double headerTitleVelocity;

  final double? headerTitleWidth;

  final double? height;

  /// initial item focus when this widget created
  final int? initialOfFocused;

  /// A boolean value that shows if the data is loading
  final bool isLoading;

  /// A boolean value that shows if the language is RTL
  final bool isRTL;

  /// List of children
  final Widget Function(BuildContext context, int index, bool isFocus)
      itemBuilder;

  final int itemCount;

  /// Item header builder
  final Widget? Function(bool animation, int index, bool isItemFocused)?
      itemHeader;

  /// Unique key for each item to serve request focus by id
  final String? Function(int index)? itemHeaderKey;

  ///Optional item configuration
  final AnimatedCarouselItemConfig? Function(int index)? itemConfigBuilder;

  /// Unique key for each item to serve request focus by id
  final String? Function(int index)? itemKey;

  /// Unique label for each item to handle voice control requests
  final List<String> Function(int index)? itemLabel;

  final Widget Function(int index, bool isItemFocused)? itemTitleBuilder;

  /// Duration of a long press
  final Duration longPressDuration;

  /// Callback when pointer button or enter key is pressed on shelf item
  final void Function(int index)? onTap;

  /// Callback when focus of an item changes
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
  final void Function(int index)? onTapItemHeader;

  final EdgeInsets? padding;

  /// The keys to be registered for long press listening
  final List<LogicalKeyboardKey> registeredLongPressKeys;

  /// The keys to be registered for onTap listening
  final List<LogicalKeyboardKey> registeredTapKeys;

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

  final double? width;

  @override
  State<ContentShelfListView> createState() => _ContentShelfListViewState();
}

class _ContentShelfListViewState extends State<ContentShelfListView> {
  final _focusScopeNode = WFocusScopeNode();

  bool get isFocusRing => WTheme.of(context)?.applyFocusRing ?? false;

  @override
  Widget build(BuildContext context) {
    TextStyle headerTitleTextStyle = widget.headerTitleTextStyle ??
        WFont.instance.semiBold.copyWith(fontSize: 54, color: Colors.white);

    return SizedBox(
      width: widget.width,
      height: widget.height,
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
        header: (animation) {
          return HeaderAnimationWidget(
            align: widget.headerTitleAlign,
            alwaysScroll: widget.headerTitleAlwaysScroll,
            animation: animation,
            animOffset: widget.headerTitleAnimOffset,
            focused: widget.headerTitleFocused,
            height: widget.headerTitleHeight,
            hoverStyle: widget.headerTitleHoverStyle,
            marqueeSpacing: widget.headerTitleMarqueeSpacing,
            isRtl: widget.isRTL,
            padding: widget.headerTitlePadding,
            title: widget.headerTitle,
            textStyle: headerTitleTextStyle,
            usingDefaultMouseRegion: widget.headerTitleUsingDefaultMouseRegion,
            velocity: widget.headerTitleVelocity,
            width: widget.headerTitleWidth,
          );
        },
        padding: widget.padding,
        controller: widget.controller,
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
        initialOfFocused: () {
          return widget.initialOfFocused ??
              (_focusScopeNode.hasPrimaryFocus &&
                      (FocusNavigationMode.instance.focusMode !=
                          FocusEventsHandlingMode.cursor)
                  ? 0
                  : null);
        }(),
        scrollType: widget.scrollType,
        onFocusedItemAnimationChange: widget.onFocusedItemAnimationChange,
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
    );
  }
}

class HeaderAnimationWidget extends StatefulWidget {
  const HeaderAnimationWidget({
    super.key,
    required this.align,
    required this.alwaysScroll,
    required this.animation,
    required this.animOffset,
    required this.focused,
    required this.height,
    required this.hoverStyle,
    required this.isRtl,
    required this.marqueeSpacing,
    required this.padding,
    required this.title,
    required this.textStyle,
    required this.usingDefaultMouseRegion,
    required this.velocity,
    required this.width,
  });

  /// Align text when text size is smaller than parent widget.
  /// see the [WMarqueeAlign]
  final WMarqueeAlign align;

  /// Always text should flow regardless of whether the focus is active.
  final bool alwaysScroll;

  final bool animation;

  final double? animOffset;

  /// Text flow enable, default value is false
  final bool focused;

  final double? height;

  /// The text style displayed when the WMarquee widget has focus
  final TextStyle? hoverStyle;

  final bool isRtl;

  /// When flow string repeated, spacing between last word and first word
  final double marqueeSpacing;

  final EdgeInsets? padding;

  final String title;

  final TextStyle textStyle;

  /// Using MouseRegion of Marquee, default value is true. (if focused value is true, this property value will be false)
  final bool? usingDefaultMouseRegion;

  /// Text flow speed
  final double velocity;

  final double? width;

  @override
  State<HeaderAnimationWidget> createState() => _HeaderAnimationWidgetState();
}

class _HeaderAnimationWidgetState extends State<HeaderAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: widget.padding,
      child: WMarquee(
        align: widget.align,
        alwaysScroll: widget.alwaysScroll,
        focused: widget.focused,
        hoverStyle: widget.hoverStyle,
        isLtoR: !widget.isRtl,
        marqueeSpacing: widget.marqueeSpacing,
        style: widget.textStyle,
        text: widget.title,
        usingDefaultMouseRegion: widget.usingDefaultMouseRegion,
        velocity: widget.velocity,
      ),
    );
  }
}
