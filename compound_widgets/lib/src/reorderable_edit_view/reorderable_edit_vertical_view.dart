import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plover/plover.dart';

class ReorderableEditVerticalView extends StatefulWidget {
  const ReorderableEditVerticalView({
    super.key,
    this.animatedScale = 1.0,
    this.animDuration = 500,
    this.autofocus = false,
    this.autoSelectedIndex,
    this.cacheExtent,
    this.childMargin = 30,
    this.clipBehavior = Clip.none,
    required this.controller,
    required this.context,
    this.delayAutoScroll = 500,
    required this.draggedItemBuilder,
    this.enableAnimation = false,
    this.enterAnimCurve = Curves.easeOutBack,
    this.exitAnimCurve,
    this.extendedDxSide = 50,
    this.focusOnHover = true,
    required this.focusScopeNode,
    this.footer,
    this.groupLabel = '',
    this.header,
    this.height = 1110,
    this.initialScrollOffset,
    this.isFocusRing = false,
    this.isRtl = false,
    required this.itemBuilder,
    this.itemConfigBuilder,
    required this.itemCount,
    required this.itemDraggingFocusNode,
    this.itemFitMargin = 0,
    this.itemHeader,
    this.itemHeight = 120,
    this.itemKey,
    this.itemLabel,
    this.itemRightBuilder,
    this.itemTitleBuilder,
    this.itemTopKey,
    this.itemWidth = 1440,
    this.marginDraggingItem = 180,
    this.onFocusChange,
    this.onFocusChangeItem,
    this.onFocusedItemAnimationChange,
    this.onHideItem,
    this.onKeyEvent,
    required this.onReorder,
    this.onTapItemTop,
    this.padding = EdgeInsetsDirectional.zero,
    required this.popupMenuController,
    required this.scrollController,
    this.scrollZone = 60,
    this.shouldScaleFirstAndLastItemFromEdge = false,
    this.typeVoiceItemTop = VCIntent.delete,
    this.width = 1914,
    this.widthItemRight = 444,
  }) : assert(itemCount > 0);

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

  /// support stop reorderable listen reorderable stop
  final ReorderableController controller;

  /// delay for auto scrolling
  final int delayAutoScroll;

  /// item is dragging in mode oder
  final Widget Function(BuildContext context, int index, int current)
      draggedItemBuilder;

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

  final double height;

  final double? initialScrollOffset;

  final bool isFocusRing;

  final bool isRtl;

  /// A builder function that returns the widget for each item in the list.
  ///
  /// The `context` argument is the build context. The `index` argument is the
  /// index of the item in the list. The `isfocus` argument indicates whether
  /// the item is currently focused or not.
  final Widget Function(BuildContext context, int index, bool isfocus)
      itemBuilder;

  /// Optional item configuration
  final AnimatedCarouselItemConfig? Function(int index)? itemConfigBuilder;

  /// the length of the itemBuilder
  final int itemCount;

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

  /// only support for vertical and placed on right of itemBuilder
  final IndexedWidgetBuilder? itemRightBuilder;

  /// Item title builder
  final Widget Function(int index, bool isItemFocused)? itemTitleBuilder;

  /// Unique key for each item to serve request focus by id
  final String? Function(int index)? itemTopKey;

  final double itemWidth;

  /// margin bottom with horizontal and left with vertical
  final double marginDraggingItem;

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

  /// function called when the item is stopped reordering
  final ReorderCallback onReorder;

  /// On activate the item callback, can be triggered by pointer middle button or enter key.
  final void Function(int index)? onTapItemTop;

  final EdgeInsetsDirectional? padding;

  final PopupMenuController popupMenuController;

  final ScrollController scrollController;

  /// area handle scroll
  final double scrollZone;

  /// Should set the origin of scaling of first and last item from its last
  /// edge.
  final bool shouldScaleFirstAndLastItemFromEdge;

  /// type voice control of item top
  final VCIntent typeVoiceItemTop;

  final double width;

  /// custom width to show itemRightBuilder
  final double? widthItemRight;

  @override
  State<StatefulWidget> createState() {
    return _ReorderableEditVerticalViewState();
  }
}

class _ReorderableEditVerticalViewState
    extends State<ReorderableEditVerticalView> {
  @override
  BuildContext get context => widget.context;

  ReorderableController get reorderController => widget.controller;
  PopupMenuController get popupMenuController => widget.popupMenuController;
  WFocusNode get itemDraggingFocusNode => widget.itemDraggingFocusNode;
  bool get isRtl => widget.isRtl;

  static LogicalKeyboardKey get keyWebOSScreenRemote =>
      const LogicalKeyboardKey(WebOSKeyCodes.keyWebOSScreenRemote);

  int _currentIndex = -1;

  @override
  void initState() {
    _currentIndex = -1;
    reorderController.addListener(_cardDisplayDraggingListener);

    super.initState();
  }

  @override
  void dispose() {
    reorderController.removeListener(_cardDisplayDraggingListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: stopReorder,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: WReorderableListView.builder(
          animatedScale: widget.animatedScale,
          animDuration: widget.animDuration,
          autofocus: widget.autofocus,
          autoSelectedIndex: widget.autoSelectedIndex,
          cacheExtent: widget.cacheExtent,
          childMargin: widget.childMargin,
          clipBehavior: widget.clipBehavior,
          controller: reorderController,
          draggedItemBuilder: (context, index, current) {
            return draggedWidget(
              child: widget.draggedItemBuilder(context, index, current),
            );
          },
          enableAnimation: widget.enableAnimation,
          enterAnimCurve: widget.enterAnimCurve,
          exitAnimCurve: widget.exitAnimCurve,
          extendedDxSide: widget.extendedDxSide,
          focusOnHover: widget.focusOnHover,
          focusScopeNode: widget.focusScopeNode,
          footer: widget.footer,
          groupLabel: widget.groupLabel,
          header: widget.header,
          initialScrollOffset: widget.initialScrollOffset,
          itemBuilder: (context, index, isfocus) {
            bool isFocus =
                widget.enableAnimation ? isfocus : (_currentIndex == index);

            return widget.itemBuilder(context, index, isFocus);
          },
          itemConfigBuilder: widget.itemConfigBuilder,
          itemCount: widget.itemCount,
          itemHeader: widget.itemHeader,
          itemKey: widget.itemKey ?? (index) => index.toString(),
          itemLabel: widget.itemLabel,
          itemRightBuilder: widget.itemRightBuilder,
          itemSize: Size(
            widget.itemWidth,
            widget.itemHeight,
          ),
          itemTitleBuilder: widget.itemTitleBuilder,
          itemTopKey: widget.itemTopKey,
          marginDragingItem: widget.marginDraggingItem,
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              _currentIndex = -1;
            }
            widget.onFocusChange?.call(hasFocus);
          },
          onFocusChangeItem: (isFocus, index) {
            if (isFocus) {
              _currentIndex = index;
            }

            widget.onFocusChangeItem?.call(isFocus, index);
          },
          onFocusedItemAnimationChange: widget.onFocusedItemAnimationChange,
          onHideItem: widget.onHideItem,
          onKeyEvent: (node, event) {
            if (widget.onKeyEvent != null) {
              return widget.onKeyEvent!(node, event);
            }

            if (event is KeyDownEvent) {
              if (widget.controller.isDraging) {
                return KeyEventResult.ignored;
              }
              if (event.logicalKey == LogicalKeyboardKey.arrowLeft && isRtl) {
                _enterEditMode();
                return KeyEventResult.handled;
              } else if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
                  !isRtl) {
                _enterEditMode();
                return KeyEventResult.handled;
              }
            }
            return KeyEventResult.ignored;
          },
          onReorder: (oldIndex, newIndex) {
            widget.onReorder(oldIndex, newIndex);

            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            _currentIndex = newIndex;
          },
          onTapItemTop: widget.onTapItemTop,
          padding: widget.padding,
          scrollController: widget.scrollController,
          scrollZone: widget.scrollZone,
          shouldScaleFirstAndLastItemFromEdge:
              widget.shouldScaleFirstAndLastItemFromEdge,
          typeVoiceItemTop: widget.typeVoiceItemTop,
          widthItemRight: widget.widthItemRight,
        ),
      ),
    );
  }

  void _enterEditMode() {
    if (_currentIndex != -1) {
      widget.controller.hideRightTopBuilder();
      widget.controller.onItemPress(index: _currentIndex);
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
        onKey: reorderController.onKey,
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
            } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              reorderController.onNext();
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              reorderController.onPre();
              return KeyEventResult.handled;
            } else {
              if (isRtl) {
                if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                  stopReorder();
                  return KeyEventResult.handled;
                }
              } else {
                if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                  stopReorder();
                  return KeyEventResult.handled;
                }
              }
            }
          }
          return KeyEventResult.ignored;
        },
        child: WFocusable(
          focusNode: itemDraggingFocusNode,
          onTap: () {
            stopReorder();
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: widget.childMargin * 2),
            child: child,
          ),
        ),
      ),
    );
  }

  void stopReorder() {
    if (reorderController.isDraging) {
      reorderController.stopReorder();
    }
  }

  Future<void> _openPopupMenu() async {
    await Future.delayed(const Duration(milliseconds: 300));
    popupMenuController.openMenu();
  }
}
