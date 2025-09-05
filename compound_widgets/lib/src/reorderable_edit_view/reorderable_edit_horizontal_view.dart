import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plover/plover.dart';

class ReorderableEditHorizontalView extends StatefulWidget {
  const ReorderableEditHorizontalView({
    super.key,
    this.alignFocusedElement = AlignFocusedElement.neutral,
    this.alignFocusedElementDeltaPixel = 0,
    this.animatedScale = 1.2,
    this.animDuration = 500,
    this.autofocus = false,
    this.autoSelectedIndex,
    this.cacheExtent,
    this.childMargin = 72,
    this.clipBehavior = Clip.none,
    required this.controller,
    required this.context,
    this.delayAutoScroll = 500,
    required this.draggedItemBuilder,
    this.draggedItemFit,
    this.enableAnimation = true,
    this.enterAnimCurve = Curves.easeOutBack,
    this.exitAnimCurve,
    this.extendedDxSide = 50,
    this.focusOnHover = true,
    required this.focusScopeNode,
    this.footer,
    this.groupLabel = '',
    this.header,
    this.initialScrollOffset,
    this.isFocusRing = false,
    this.isRtl = false,
    this.isUsingFooterAnimation = false,
    this.isUsingHeaderAnimation = false,
    required this.itemBuilder,
    required this.itemDraggingFocusNode,
    this.itemFitMargin = 108,
    this.itemHeader,
    this.itemHeight = 270,
    this.itemKey,
    this.itemLabel,
    required this.items,
    this.itemTitleBuilder,
    this.itemTopKey,
    this.itemWidth = 480,
    this.marginDraggingItem = -96,
    this.onFocusChange,
    this.onFocusChangeItem,
    this.onFocusedItemAnimationChange,
    this.onHideItem,
    this.onAddItem,
    this.onRemoveItem,
    this.onKeyEvent,
    required this.onReorder,
    this.onTapItemTop,
    this.padding,
    required this.popupMenuController,
    required this.reorderableController,
    required this.scrollController,
    this.scrollZone = 60,
    this.shouldScaleFirstAndLastItemFromEdge = false,
    this.typeVoiceItemTop = VCIntent.delete,
  }) : assert(items.length > 0);

  /// The alignment option for the focused element in the parent scroll.
  final AlignFocusedElement? alignFocusedElement;

  /// The delta value in pixels used for aligning the focused element.
  final double alignFocusedElementDeltaPixel;

  /// Animation scale, when hover to a child, the child will animate zoom from 1.0 to animatedScale
  final double animatedScale;

  /// Animation duration
  final int animDuration;

  final bool autofocus;

  final int? autoSelectedIndex;

  /// An area before and after the visible area to cache items.
  final double? cacheExtent;

  /// Children's margin
  final double childMargin;

  /// The content will be clipped (or not) according to this option.
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  final BuildContext context;

  final ReorderableEditController controller;

  /// delay for auto scrolling
  final int delayAutoScroll;

  /// item is dragging in mode oder
  final Widget Function(BuildContext context, int index, int current)
      draggedItemBuilder;

  /// only for horizontal, custom position of item dragging
  final double Function(int current)? draggedItemFit;

  /// Disable default scaling logic
  final bool enableAnimation;

  /// Enter animation effect
  final Curve enterAnimCurve;

  /// Exit animation effect
  final Curve? exitAnimCurve;

  final double extendedDxSide;

  /// custom focus when hover
  final bool focusOnHover;

  /// focusScopeNode
  final WFocusScopeNode focusScopeNode;

  /// A non-reorderable footer item to show after the items of the list.
  ///
  /// If null, no footer will appear after the list.
  final Widget? footer;

  /// groupLabel of widget to support voice control requests
  final String groupLabel;

  /// A non-reorderable header item to show before the items of the list.
  ///
  /// If null, no header will appear before the list.
  final Widget? header;

  final double? initialScrollOffset;

  final bool isFocusRing;

  final bool isRtl;

  final bool isUsingFooterAnimation;

  final bool isUsingHeaderAnimation;

  /// A builder function that returns the widget for each item in the list.
  ///
  /// The `context` argument is the build context. The `index` argument is the
  /// index of the item in the list. The `isfocus` argument indicates whether
  /// the item is currently focused or not.
  final Widget Function(BuildContext context, int index, bool isfocus)
      itemBuilder;

  final WFocusNode itemDraggingFocusNode;

  final double itemFitMargin;

  /// Item header builder
  final Widget? Function(bool animation, int index, bool isItemFocused)?
      itemHeader;

  final double itemHeight;

  /// Unique key for each item to serve request focus by id
  final String? Function(int index)? itemKey;

  /// Unique label for each item to handle voice control requests
  final List<String> Function(int index)? itemLabel;

  final List<Object> items;

  /// Item title builder
  final Widget Function(int index, bool isItemFocused)? itemTitleBuilder;

  /// Unique key for each item to serve request focus by id
  final String? Function(int index)? itemTopKey;

  final double itemWidth;

  /// margin bottom with horizontal and left with vertical
  final double marginDraggingItem;

  final void Function()? onAddItem;

  /// onFocusChange
  final ValueChanged<bool>? onFocusChange;

  /// Focus status change callback of the item
  final void Function(bool isFocus, int index)? onFocusChangeItem;

  /// Listen to size and offset changes (based on animation status) of the
  /// focused item
  final void Function(
    int index,
    AnimationStatus animationStatus,
    Size size,
    Offset offset,
  )? onFocusedItemAnimationChange;

  /// On activate the item callback, can be triggered by voice control hide command.
  final void Function(int index)? onHideItem;

  /// onKeyEvent
  final FocusOnKeyEventCallback? onKeyEvent;

  final void Function()? onRemoveItem;

  /// function called when the item is stopped reordering
  final ReorderCallback onReorder;

  /// On activate the item callback, can be triggered by pointer middle button or enter key.
  final void Function(int index)? onTapItemTop;

  final EdgeInsetsDirectional? padding;

  final PopupMenuController popupMenuController;

  final ReorderableController reorderableController;

  final ScrollController scrollController;

  /// area handle scroll
  final double scrollZone;

  /// Should set the origin of scaling of first and last item from its last
  /// edge.
  final bool shouldScaleFirstAndLastItemFromEdge;

  /// type voice control of item top
  final VCIntent typeVoiceItemTop;

  @override
  State<StatefulWidget> createState() {
    return _ReorderableEditHorizontalViewState();
  }
}

class _ReorderableEditHorizontalViewState
    extends State<ReorderableEditHorizontalView> with KeyBoardReorderListener {
  @override
  BuildContext get context => widget.context;

  @override
  ReorderableController get controller => widget.reorderableController;

  @override
  PopupMenuController get popupMenuController => widget.popupMenuController;

  @override
  WFocusNode get itemDraggingFocusNode => widget.itemDraggingFocusNode;

  List<Object> get _items => widget.items;

  bool get isRtl => widget.isRtl;

  @override
  void initState() {
    widget.controller.addItem = _addItem;
    widget.controller.removeItem = _removeItem;
    widget.reorderableController.addListener(_cardDisplayDraggingListener);

    super.initState();
  }

  @override
  void dispose() {
    widget.reorderableController.removeListener(_cardDisplayDraggingListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget? footerWidget = widget.footer;
    if (footerWidget != null && widget.isUsingFooterAnimation) {
      footerWidget = HeaderFooterFocusAnimationWidget(
        animatedScale: widget.animatedScale,
        enterAnimCurve: widget.enterAnimCurve,
        animDuration: widget.animDuration,
        exitAnimCurve: widget.exitAnimCurve,
        child: footerWidget,
      );
    }

    Widget? headerWidget = widget.header;
    if (headerWidget != null && widget.isUsingHeaderAnimation) {
      headerWidget = HeaderFooterFocusAnimationWidget(
        animatedScale: widget.animatedScale,
        enterAnimCurve: widget.enterAnimCurve,
        animDuration: widget.animDuration,
        exitAnimCurve: widget.exitAnimCurve,
        child: headerWidget,
      );
    }

    return FocusScrollConfig(
      alignFocusedElement: widget.alignFocusedElement,
      alignFocusedElementDeltaPixel: widget.alignFocusedElementDeltaPixel,
      child: WReorderableListView.builder(
        animatedScale: widget.animatedScale,
        animDuration: widget.animDuration,
        autofocus: widget.autofocus,
        autoSelectedIndex: widget.autoSelectedIndex,
        cacheExtent: widget.itemWidth * 2,
        childMargin: widget.childMargin,
        clipBehavior: widget.clipBehavior,
        controller: widget.reorderableController,
        delayAutoScroll: widget.delayAutoScroll,
        draggedItemBuilder: (context, index, current) {
          return draggedWidget(
              child: widget.draggedItemBuilder(context, index, current));
        },
        draggedItemFit: (current) {
          if (widget.isFocusRing) {
            return 0;
          }
          bool isLTR = !widget.isRtl;
          if (isLTR) {
            if (current == (_items.length)) {
              return widget.itemFitMargin * 2;
            } else if (current != 0) {
              return widget.itemFitMargin;
            }
            return 0;
          } else {
            if (current == 0) {
              return widget.itemFitMargin * 2;
            } else if (current != (_items.length)) {
              return widget.itemFitMargin;
            }
            return 0;
          }
        },
        enableAnimation: widget.enableAnimation,
        enterAnimCurve: widget.enterAnimCurve,
        exitAnimCurve: widget.exitAnimCurve,
        extendedDxSide: widget.extendedDxSide,
        focusOnHover: widget.focusOnHover,
        focusScopeNode: widget.focusScopeNode,
        footer: footerWidget,
        groupLabel: widget.groupLabel,
        header: headerWidget,
        initialScrollOffset: widget.initialScrollOffset,
        itemBuilder: widget.itemBuilder,
        itemConfigBuilder: (index) {
          if (widget.isFocusRing) {
            return AnimatedCarouselItemConfig(
                shouldScaleOnFocus: !widget.isFocusRing);
          }
          AnimatedCarouselItemConfig config =
              AnimatedCarouselItemConfig.defaultValue();

          if (index == 0) {
            config = config.copyWith(itemOriginOffset: (Size size, int index) {
              final double dx = size.width / 2;
              return Offset(dx, 0);
            });
          } else if (index == _items.length - 1) {
            config = config.copyWith(itemOriginOffset: (Size size, int index) {
              final double dx = -size.width / 2;
              return Offset(dx, 0);
            });
          } else {
            config = config.copyWith(itemOriginOffset: (Size size, int index) {
              return Offset.zero;
            });
          }
          return config;
        },
        itemCount: _items.length,
        itemHeader: widget.itemHeader,
        itemKey: widget.itemKey ?? (index) => index.toString(),
        itemLabel: widget.itemLabel,
        itemSize: Size(
          widget.itemWidth,
          widget.itemHeight,
        ),
        itemTitleBuilder: widget.itemTitleBuilder,
        itemTopKey: widget.itemTopKey,
        marginDragingItem: widget.marginDraggingItem,
        onFocusChange: widget.onFocusChange,
        onFocusChangeItem: widget.onFocusChangeItem,
        onFocusedItemAnimationChange: widget.onFocusedItemAnimationChange,
        onHideItem: widget.onHideItem,
        onKeyEvent: widget.onKeyEvent,
        onReorder: widget.onReorder,
        onTapItemTop: widget.onTapItemTop,
        padding: widget.padding,
        scrollController: widget.scrollController,
        scrollDirection: Axis.horizontal,
        scrollZone: widget.scrollZone,
        shouldScaleFirstAndLastItemFromEdge:
            widget.shouldScaleFirstAndLastItemFromEdge,
        typeVoiceItemTop: widget.typeVoiceItemTop,
      ),
    );
  }

  @override
  void onStopReorder() {
    if (widget.reorderableController.isDraging) {
      widget.reorderableController.stopReorder();
    }
  }

  void _cardDisplayDraggingListener(bool isDragging) {
    if (isDragging) {
      WidgetsBinding.instance.addPostFrameCallback(
        (Duration timeStamp) {
          itemDraggingFocusNode.requestFocus();
        },
      );
    }
  }

  void _addItem(int index, Object item) {
    if (index > _items.length) {
      index = _items.length;
    }

    _items.insert(index, item);
    widget.onAddItem?.call();
  }

  Object _removeItem(int index) {
    Object item = _items[index];
    _items.removeAt(index);
    widget.reorderableController.stopReorder.call();
    widget.onRemoveItem?.call();
    return item;
  }
}

mixin KeyBoardReorderListener {
  static LogicalKeyboardKey get keyWebOSScreenRemote =>
      const LogicalKeyboardKey(WebOSKeyCodes.keyWebOSScreenRemote);

  BuildContext get context;
  bool get isRTL => false;
  WFocusNode get itemDraggingFocusNode;
  PopupMenuController get popupMenuController;
  ReorderableController get controller;

  void onStopReorder() {}

  Widget draggedWidget({
    required Widget child,
  }) {
    return FocusRootScope(
      child: WFocusableScope(
        tapByEnter: false,
        focusOnTap: false,
        focusOnHover: false,
        autoFocus: true,
        onFocusChange: (isfocus) {
          if (!isfocus &&
              WidgetsBinding.instance.lifecycleState ==
                  AppLifecycleState.resumed) {
            stopReorder();
          }
        },
        onKey: controller.onKey,
        onKeyEvent: (FocusNode node, KeyEvent event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == keyWebOSScreenRemote) {
              stopReorder();
              _openPopupMenu();
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.exit ||
                event.logicalKey == LogicalKeyboardKey.escape ||
                event.logicalKey == LogicalKeyboardKey.metaLeft ||
                event.logicalKey == LogicalKeyboardKey.enter) {
              if (itemDraggingFocusNode.hasFocus) {
                stopReorder();
              }
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              controller.onNext();
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              controller.onPre();
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
                itemDraggingFocusNode.hasFocus) {
              stopReorder();
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: WFocusable(
          focusNode: itemDraggingFocusNode,
          onTap: () {
            stopReorder();
          },
          child: child,
        ),
      ),
    );
  }

  void stopReorder() {
    onStopReorder.call();
    if (controller.isDraging) {
      controller.stopReorder();
    }
  }

  Future<void> _openPopupMenu() async {
    await Future.delayed(const Duration(milliseconds: 300));
    popupMenuController.openMenu();
  }
}

class ReorderableEditController {
  late void Function(int, Object) addItem;
  late Object Function(int) removeItem;
}

class HeaderFooterFocusAnimationWidget extends StatefulWidget {
  const HeaderFooterFocusAnimationWidget({
    super.key,
    required this.animatedScale,
    required this.animDuration,
    required this.child,
    required this.enterAnimCurve,
    required this.exitAnimCurve,
  });

  /// Animation scale, when hover to a child, the child will animate zoom from 1.0 to animatedScale
  final double animatedScale;

  /// Animation duration
  final int animDuration;

  final Widget child;

  /// The scale's enter animation effect
  final Curve enterAnimCurve;

  /// The scale's exit animation effect
  final Curve? exitAnimCurve;

  @override
  State<HeaderFooterFocusAnimationWidget> createState() =>
      _HeaderFooterFocusAnimationWidgetState();
}

class _HeaderFooterFocusAnimationWidgetState
    extends State<HeaderFooterFocusAnimationWidget>
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
      duration: Duration(milliseconds: widget.animDuration),
      reverseDuration: Duration.zero,
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: widget.animatedScale,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.enterAnimCurve,
        reverseCurve: widget.exitAnimCurve,
      ),
    )..addListener(_listener);
  }

  @override
  void dispose() {
    _animation.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WFocusable(
      onFocusChange: (value) {
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
        child: widget.child,
      ),
    );
  }
}
