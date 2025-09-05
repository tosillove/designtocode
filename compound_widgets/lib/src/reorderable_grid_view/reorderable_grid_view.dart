import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:plover/plover.dart';

typedef ReorderableItemCallback = void Function(ReorderableItemInfo item);

typedef ReorderableItemBuilder = Widget Function(
    int index, Widget child, VoidCallback onTab);

typedef GridItemBuilder = Widget Function(
    BuildContext context, int index, bool hasFocus, VoidCallback onTab);

class ReorderableGridView extends StatefulWidget {
  const ReorderableGridView({
    super.key,
    this.controller,
    required this.focusNodes,
    required this.gridDelegate,
    required this.itemBuilder,
    this.itemCount = 0,
    this.onFocusChange,
    this.onItemRemove,
    required this.onReorder,
    this.padding = const EdgeInsets.all(54),
    required this.reorderableGridController,
    this.reorderableItemBuilder,
  });

  final ScrollController? controller;

  final List<WFocusNode> focusNodes;

  final SliverGridDelegate gridDelegate;

  final GridItemBuilder itemBuilder;

  final int itemCount;

  /// FocusChange call back
  final void Function(bool)? onFocusChange;

  final void Function()? onItemRemove;

  final ReorderCallback onReorder;

  final EdgeInsetsGeometry padding;

  final ReorderableGridController reorderableGridController;

  final ReorderableItemBuilder? reorderableItemBuilder;

  @override
  State<StatefulWidget> createState() {
    return _ReorderableGridViewState();
  }
}

class _ReorderableGridViewState extends State<ReorderableGridView> {
  ScrollController get controller => widget.controller ?? ScrollController();

  @override
  Widget build(BuildContext context) {
    return FocusRootScope(
      child: ReorderableGridMixinWidget(
          reorderableGridController: widget.reorderableGridController,
          reorderableGridItemBuilder: widget.reorderableItemBuilder,
          onReorder: widget.onReorder,
          child: GridView.custom(
            key: widget.key,
            childrenDelegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
                    widget.gridDelegate
                        as SliverGridDelegateWithFixedCrossAxisCount;

                return ReorderableGridItem(
                  crossAxisCount: gridDelegate.crossAxisCount,
                  focusNodes: widget.focusNodes,
                  index: index,
                  itemBuilder: widget.itemBuilder,
                  itemCount: widget.itemCount,
                  onFocusChange: widget.onFocusChange,
                  onItemRemove: widget.onItemRemove,
                );
              },
              childCount: widget.itemCount,
            ),
            controller: controller,
            padding: widget.padding,
            gridDelegate: widget.gridDelegate,
          )),
    );
  }
}

class ReorderableGridMixinWidget extends StatefulWidget
    with ReorderableGridMixin {
  const ReorderableGridMixinWidget({
    super.key,
    required this.child,
    this.reorderableGridItemBuilder,
    required this.onReorder,
    required this.reorderableGridController,
  });

  @override
  final Widget child;

  @override
  final ReorderableItemBuilder? reorderableGridItemBuilder;

  @override
  final ReorderCallback onReorder;

  @override
  final ReorderableGridController reorderableGridController;

  @override
  State<StatefulWidget> createState() {
    return ReorderableGridMixinWidgetState();
  }
}

class ReorderableGridMixinWidgetState extends State<ReorderableGridMixinWidget>
    with
        TickerProviderStateMixin<ReorderableGridMixinWidget>,
        ReorderableGridStateMixin<ReorderableGridMixinWidget> {}

mixin ReorderableGridMixin on StatefulWidget {
  Widget get child;

  ReorderableItemBuilder? get reorderableGridItemBuilder;

  ReorderCallback get onReorder;

  ReorderableGridController get reorderableGridController;
}

mixin ReorderableGridStateMixin<T extends ReorderableGridMixin>
    on State<T>, TickerProviderStateMixin<T> {
  final Map<int, ReorderableGridItemState> _items =
      <int, ReorderableGridItemState>{};

  MultiDragGestureRecognizer? _recognizer;

  ReorderableItemInfo? _reorderableItemInfo;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  static ReorderableGridStateMixin<ReorderableGridMixinWidget> of(
      BuildContext context) {
    return context.findAncestorStateOfType<
        ReorderableGridStateMixin<ReorderableGridMixinWidget>>()!;
  }

  void startDragRecognizer(
    int index,
    PointerDownEvent event,
    MultiDragGestureRecognizer recognizer,
  ) {
    setState(() {
      if (widget.reorderableGridController.dragIndex != null) {
        _dragReset();
      }

      widget.reorderableGridController.dragIndex = index;

      _recognizer = recognizer
        ..onStart = _onDragStart
        ..addPointer(event);
    });
  }

  Drag? _onDragStart(Offset position) {
    if (widget.reorderableGridController.dragIndex == null) {
      return null;
    }

    final ReorderableGridItemState? item =
        _items[widget.reorderableGridController.dragIndex!];

    if (item == null) {
      return null;
    }

    widget.reorderableGridController.dropIndex =
        widget.reorderableGridController.dragIndex;

    _reorderableItemInfo = ReorderableItemInfo(
      context: context,
      reorderablePosition: position,
      reorderableGridItemBuilder: widget.reorderableGridItemBuilder,
      item: item,
      onCancel: _onDragCancel,
      onEnd: _onDragEnd,
      onTap: () {
        item.tapAction.call();
      },
      onUpdate: updateDragTarget,
      readyCallback: () {
        item.draggingByDrag = true;
        item.rebuild();
        updateDragTarget();
      },
    );

    _startDrag(item);

    return _reorderableItemInfo!;
  }

  ReorderableItemInfo? onDragStart(int index, Offset position,
      KeyEventResult Function(FocusNode, KeyEvent) onkeyEvent) {
    widget.reorderableGridController.dragIndex = index;

    final ReorderableGridItemState? item = _items[index];

    if (item == null) {
      return null;
    }

    widget.reorderableGridController.dropIndex =
        widget.reorderableGridController.dragIndex;

    _reorderableItemInfo = ReorderableItemInfo(
      context: context,
      reorderablePosition: position,
      reorderableGridItemBuilder: widget.reorderableGridItemBuilder,
      item: item,
      onCancel: _onDragCancel,
      onEnd: _onDragEnd,
      onTap: () {
        item.tapAction.call();
      },
      onUpdate: updateDragTarget,
      readyCallback: () {
        item.draggingByDrag = true;
        item.rebuild();
        updateDragTarget();
      },
      onKeyEvent: onkeyEvent,
    );

    widget.reorderableGridController.dragReset = _dragReset;

    _startDrag(item);

    return _reorderableItemInfo!;
  }

  void _onDragCancel(ReorderableItemInfo item) {
    _dragReset();
    setState(() {});
  }

  void _onDragEnd(ReorderableItemInfo item) {
    if (widget.reorderableGridController.dropIndex == null ||
        widget.reorderableGridController.dragIndex == null) {
      return;
    }

    widget.onReorder(widget.reorderableGridController.dragIndex!,
        widget.reorderableGridController.dropIndex!);
    _dragReset();
  }

  void onDragEnd() {
    if (widget.reorderableGridController.dropIndex == null ||
        widget.reorderableGridController.dragIndex == null) {
      return;
    }

    widget.onReorder(widget.reorderableGridController.dragIndex!,
        widget.reorderableGridController.dropIndex!);
    _dragReset();
  }

  Future<void> updateDragTarget() async {
    if (widget.reorderableGridController.dropIndex == null) {
      return;
    }

    final int newTargetIndex =
        _calcDropIndex(widget.reorderableGridController.dropIndex!);
    if (newTargetIndex != widget.reorderableGridController.dropIndex) {
      widget.reorderableGridController.dropIndex = newTargetIndex;
      for (final ReorderableGridItemState item in _items.values) {
        item.updateForGap(widget.reorderableGridController.dropIndex!);
      }
    }
  }

  int _calcDropIndex(int defaultIndex) {
    if (_reorderableItemInfo == null) {
      return defaultIndex;
    }

    for (final ReorderableGridItemState item in _items.values) {
      if (item.context.findRenderObject() != null) {
        final RenderBox box = item.context.findRenderObject()! as RenderBox;
        final Offset pos =
            box.globalToLocal(_reorderableItemInfo!.getCenterInGlobal());
        if (pos.dx > 0 &&
            pos.dy > 0 &&
            pos.dx < box.size.width &&
            pos.dy < box.size.height) {
          return item.index;
        }
      }
    }
    return defaultIndex;
  }

  Future<void> _startDrag(ReorderableGridItemState item) async {
    if (_reorderableItemInfo == null) {
      return;
    }
    _reorderableItemInfo?.startDrag();
  }

  void _dragReset() {
    if (widget.reorderableGridController.dragIndex != null) {
      if (_items.containsKey(widget.reorderableGridController.dragIndex)) {
        final ReorderableGridItemState item =
            _items[widget.reorderableGridController.dragIndex!]!;
        item.draggingByDrag = false;
        item._isDraggingByKey = false;
        item.rebuild();
        item._curIndex = null;
      }

      widget.reorderableGridController.dragIndex = null;
      widget.reorderableGridController.dropIndex = null;

      for (final ReorderableGridItemState item in _items.values) {
        item.resetGap();
      }
      widget.reorderableGridController.dragReset = null;
    }

    _recognizer?.dispose();
    _recognizer = null;

    _reorderableItemInfo?.dispose();
    _reorderableItemInfo = null;
  }

  void registerItem(ReorderableGridItemState item) {
    _items[item.index] = item;
    if (item.index == _reorderableItemInfo?.index) {
      item.draggingByDrag = true;
      item.rebuild();
    }
  }

  void unRegisterItem(int index, ReorderableGridItemState item) {
    final ReorderableGridItemState? current = _items[index];
    if (current == item) {
      _items.remove(index);
    }
  }

  bool isContainsByIndex(int index) {
    return _items.containsKey(index);
  }

  Offset getOffsetInDrag(int index) {
    if (_reorderableItemInfo == null ||
        widget.reorderableGridController.dropIndex == null ||
        widget.reorderableGridController.dragIndex ==
            widget.reorderableGridController.dropIndex) {
      return Offset.zero;
    }

    bool isInDragRange = false;
    final bool isMoveLeft = widget.reorderableGridController.dropIndex! >
        widget.reorderableGridController.dragIndex!;

    final int minPos = min(widget.reorderableGridController.dragIndex!,
        widget.reorderableGridController.dropIndex!);
    final int maxPos = max(widget.reorderableGridController.dragIndex!,
        widget.reorderableGridController.dropIndex!);

    if (index >= minPos && index <= maxPos) {
      isInDragRange = true;
    }

    if (!isInDragRange) {
      return Offset.zero;
    } else {
      final int preIndex = index - 1;
      final int nextIndex = index + 1;
      if (isMoveLeft) {
        if (!isContainsByIndex(preIndex) || !isContainsByIndex(index)) {
          return Offset.zero;
        }
        return getPosByIndex(preIndex) - getPosByIndex(index);
      } else {
        if (!isContainsByIndex(nextIndex) || !isContainsByIndex(index)) {
          return Offset.zero;
        }
        return getPosByIndex(nextIndex) - getPosByIndex(index);
      }
    }
  }

  Offset getPosByIndex(int index, {bool isSafe = true}) {
    if (isSafe) {
      if (index < 0) {
        index = 0;
      }
    }

    if (index < 0) {
      return Offset.zero;
    }

    final ReorderableGridItemState? child = _items[index];

    final RenderObject? thisRenderObject = context.findRenderObject();

    if (thisRenderObject is RenderSliverGrid) {
      final RenderSliverGrid renderObject = thisRenderObject;

      final SliverConstraints constraints = renderObject.constraints;
      final SliverGridLayout layout =
          renderObject.gridDelegate.getLayout(constraints);

      final int fixedIndex = child?.index ?? 0;
      final SliverGridGeometry gridGeometry =
          layout.getGeometryForChildIndex(fixedIndex);
      final Offset rst =
          Offset(gridGeometry.crossAxisOffset, gridGeometry.scrollOffset);
      return rst;
    }

    final RenderObject? renderObject = child?.context.findRenderObject();
    if (renderObject == null) {
      return Offset.zero;
    }
    final RenderBox box = renderObject as RenderBox;

    if (context.findRenderObject() == null) {
      return Offset.zero;
    }

    final RenderBox parentRenderObject =
        context.findRenderObject()! as RenderBox;
    final Offset pos =
        parentRenderObject.globalToLocal(box.localToGlobal(Offset.zero));
    return pos;
  }
}

class ReorderableGridItem extends StatefulWidget {
  const ReorderableGridItem({
    super.key,
    required this.crossAxisCount,
    required this.focusNodes,
    required this.itemBuilder,
    required this.index,
    required this.itemCount,
    this.onFocusChange,
    required this.onItemRemove,
  });

  final int crossAxisCount;
  final List<WFocusNode> focusNodes;
  final GridItemBuilder itemBuilder;
  final int index;
  final int itemCount;

  /// FocusChange call back
  final void Function(bool)? onFocusChange;

  final void Function()? onItemRemove;

  @override
  State<ReorderableGridItem> createState() => ReorderableGridItemState();
}

class ReorderableGridItemState extends State<ReorderableGridItem>
    with TickerProviderStateMixin {
  Widget get child {
    return widget.itemBuilder(
      context,
      index,
      widget.focusNodes[index].hasFocus,
      () => tapAction(),
    );
  }

  int? _curIndex;

  bool _isDraggingByDrag = false;

  bool _isDraggingByKey = false;

  ReorderableItemInfo? _reorderableItemInfo;

  int get index => widget.index;

  late ReorderableGridStateMixin<ReorderableGridMixinWidget> _listState;

  AnimationController? _offsetAnimation;

  Offset _startOffset = Offset.zero;

  Offset _targetOffset = Offset.zero;

  set draggingByDrag(bool isDragging) {
    if (mounted) {
      setState(() {
        _isDraggingByDrag = isDragging;
      });
    }
  }

  @override
  void initState() {
    _listState = ReorderableGridStateMixin.of(context);
    _listState.registerItem(this);

    super.initState();
  }

  @override
  void dispose() {
    _listState.unRegisterItem(index, this);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ReorderableGridItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _listState.unRegisterItem(oldWidget.index, this);
      _listState.registerItem(this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: WFocusable(
        focusNode: widget.focusNodes[index],
        onFocusChange: (bool hasFocus) {
          if (_isDraggingByKey) {
            widget.focusNodes[index].requestFocus();
          } else {
            widget.onFocusChange?.call(hasFocus);
          }
        },
        onKeyEvent: _onKey,
        onTap: tapAction,
        child: Listener(
          onPointerDown: (PointerDownEvent e) {
            final ReorderableGridStateMixin<ReorderableGridMixinWidget>
                listState = ReorderableGridStateMixin.of(context);
            listState.startDragRecognizer(
              index,
              e,
              _createDragRecognizer(),
            );
          },
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint) {
              return Transform(
                transform: Matrix4.translationValues(offset.dx, offset.dy, 0),
                child: Stack(
                  children: <Widget>[
                    Offstage(
                      offstage: !_isDraggingByDrag,
                      child: Container(
                        constraints: constraint,
                        child: const SizedBox(),
                      ),
                    ),
                    Offstage(
                      offstage: _isDraggingByDrag,
                      child: Container(
                        constraints: constraint,
                        child: child,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void tapAction() {
    _isDraggingByKey = !_isDraggingByKey;
    final ReorderableGridStateMixin<ReorderableGridMixinWidget> listState =
        ReorderableGridStateMixin.of(context);

    if (_isDraggingByKey) {
      final RenderBox? renderBox =
          widget.focusNodes[index].context?.findRenderObject() as RenderBox?;
      final Offset? offset = renderBox?.localToGlobal(Offset.zero);
      _reorderableItemInfo = listState.onDragStart(
        widget.index,
        offset ?? Offset.zero,
        _onKey,
      );
      _curIndex = index;
    } else {
      _curIndex = null;

      widget
          .focusNodes[listState.widget.reorderableGridController.dropIndex ?? 0]
          .requestFocus();
      listState.onDragEnd();
    }
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowLeft:
          if (!_isDraggingByKey) {
            return KeyEventResult.ignored;
          }

          final int newIndex = (_curIndex ?? index) - 1;

          if (newIndex < 0) {
            return KeyEventResult.ignored;
          }

          updateDragByKey(newIndex);
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowRight:
          if (!_isDraggingByKey) {
            return KeyEventResult.ignored;
          }

          final int newIndex = (_curIndex ?? index) + 1;

          if (newIndex >= widget.itemCount) {
            return KeyEventResult.ignored;
          }

          updateDragByKey(newIndex);
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowUp:
          if (!_isDraggingByKey) {
            return KeyEventResult.ignored;
          }

          final int newIndex = (_curIndex ?? index) - widget.crossAxisCount;

          if (newIndex < 0) {
            return KeyEventResult.ignored;
          }

          updateDragByKey(newIndex);
          return KeyEventResult.handled;

        case LogicalKeyboardKey.arrowDown:
          if (!_isDraggingByKey) {
            return KeyEventResult.ignored;
          }

          final int newIndex = (_curIndex ?? index) + widget.crossAxisCount;

          if (newIndex >= widget.itemCount) {
            return KeyEventResult.ignored;
          }

          updateDragByKey(newIndex);
          return KeyEventResult.handled;

        case LogicalKeyboardKey.backspace:
          if (widget.onItemRemove != null && _isDraggingByKey) {
            widget.onItemRemove?.call();

            return KeyEventResult.handled;
          }

          return KeyEventResult.ignored;

        default:
          return KeyEventResult.ignored;
      }
    }
    return KeyEventResult.ignored;
  }

  void updateDragByKey(int newIndex) {
    if (_reorderableItemInfo != null) {
      final RenderBox? renderBox =
          widget.focusNodes[newIndex].context?.findRenderObject() as RenderBox?;
      final Offset? offset = renderBox?.localToGlobal(Offset.zero);

      _reorderableItemInfo!.updateByKey(offset ?? Offset.zero);

      _curIndex = newIndex;
    }
  }

  Offset get offset {
    if (_offsetAnimation != null) {
      return Offset.lerp(
        _startOffset,
        _targetOffset,
        Curves.easeInOut.transform(_offsetAnimation!.value),
      )!;
    }

    return _targetOffset;
  }

  MultiDragGestureRecognizer _createDragRecognizer() {
    return ImmediateMultiDragGestureRecognizer();
  }

  void resetGap() {
    setState(() {
      if (_offsetAnimation != null) {
        _offsetAnimation!.dispose();
        _offsetAnimation = null;
      }

      _startOffset = Offset.zero;
      _targetOffset = Offset.zero;
    });
  }

  void rebuild() {
    if (mounted) {
      setState(() {});
    }
  }

  void updateForGap(int dropIndex) {
    if (!mounted) {
      return;
    }

    if (!_listState.isContainsByIndex(index)) {
      return;
    }

    _checkPlaceHolder();

    if (_isDraggingByDrag) {
      return;
    }

    final Offset newOffset = _listState.getOffsetInDrag(index);
    if (newOffset != _targetOffset) {
      _targetOffset = newOffset;

      if (_offsetAnimation == null) {
        _offsetAnimation = AnimationController(vsync: _listState)
          ..duration = const Duration(milliseconds: 250)
          ..addListener(rebuild)
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              _startOffset = _targetOffset;
              _offsetAnimation?.dispose();
              _offsetAnimation = null;
            }
          })
          ..forward(from: 0.0);
      } else {
        _startOffset = offset;
        _offsetAnimation?.forward(from: 0.0);
      }
    }
  }

  void _checkPlaceHolder() {
    if (!_isDraggingByDrag) {
      return;
    }

    final int targetPos =
        _listState.widget.reorderableGridController.dropIndex ?? -1;
    if (targetPos < 0) {
      return;
    }
  }
}

class ReorderableItemInfo extends Drag {
  ReorderableItemInfo({
    required this.context,
    required this.reorderablePosition,
    this.reorderableGridItemBuilder,
    required this.item,
    this.onCancel,
    this.onEnd,
    required this.onTap,
    this.onUpdate,
    required this.readyCallback,
    this.onKeyEvent,
  }) {
    child = item.child;

    if (item.context.findRenderObject() != null) {
      final RenderBox renderBox = item.context.findRenderObject()! as RenderBox;
      dragExtent = renderBox.size.height;
      dragOffset = renderBox.globalToLocal(reorderablePosition);
      dragSize = renderBox.size;
    }

    index = item.index;
    itemSize = item.context.size ?? Size.zero;
    scrollable = Scrollable.of(item.context);
  }

  BuildContext context;
  Offset reorderablePosition;
  final ReorderableItemBuilder? reorderableGridItemBuilder;
  final ReorderableGridItemState item;
  final ReorderableItemCallback? onCancel;
  final ReorderableItemCallback? onEnd;
  final VoidCallback onTap;
  final VoidCallback? onUpdate;
  final VoidCallback readyCallback;
  final KeyEventResult Function(FocusNode, KeyEvent)? onKeyEvent;

  late Widget child;
  late double dragExtent;
  late Offset dragOffset;
  late Size dragSize;
  late int index;
  late Size itemSize;
  late ScrollableState scrollable;

  bool hasEnd = false;
  bool _isScrollAnimationStarted = false;
  OverlayEntry? _overlayEntry;

  final WFocusNode _focusNode = WFocusNode();

  @override
  void update(DragUpdateDetails details) {
    reorderablePosition += details.delta;
    onUpdate?.call();

    _overlayEntry?.markNeedsBuild();
    _scrollIfNeed();
  }

  void updateByKey(Offset offset) {
    reorderablePosition = offset;
    onUpdate?.call();

    _overlayEntry?.markNeedsBuild();
    _scrollIfNeed();
  }

  @override
  void end(DragEndDetails details) {
    hasEnd = true;
    onEnd?.call(this);
  }

  @override
  void cancel() {
    hasEnd = true;
    onCancel?.call(this);
  }

  void startDrag() {
    readyCallback();
    _overlayEntry = OverlayEntry(builder: createProxy);

    Overlay.of(context).insert(_overlayEntry!);
    _scrollIfNeed();

    _focusNode.requestFocus();
  }

  Future<void> _scrollIfNeed() async {
    if (!_isScrollAnimationStarted) {
      double? newOffset;
      bool isNeedScroll = false;
      final ScrollPosition position = scrollable.position;
      final RenderObject? renderObject = scrollable.context.findRenderObject();
      if (renderObject == null) {
        return;
      }
      final RenderBox scrollRenderBox = renderObject as RenderBox;

      final Offset scrollOrigin = scrollRenderBox.localToGlobal(Offset.zero);
      final double scrollStart = scrollOrigin.dy;

      final double scrollEnd = scrollStart + scrollRenderBox.size.height;

      final double reorderableItemInfoStart = getPosInGlobal().dy;
      final double reorderableItemInfoEnd =
          reorderableItemInfoStart + dragExtent;

      final bool isOverBottom = reorderableItemInfoEnd > scrollEnd;
      final bool isOverTop = reorderableItemInfoStart < scrollStart;

      final bool isNeedScrollBottom =
          isOverBottom && position.pixels < position.maxScrollExtent;
      final bool isNeedScrollTop =
          isOverTop && position.pixels > position.minScrollExtent;

      const double oneStepMax = 5;
      double scroll = oneStepMax;

      double overSize = 0;

      if (isNeedScrollBottom) {
        overSize = reorderableItemInfoEnd - scrollEnd;
        scroll = min(overSize, oneStepMax);
      } else if (isNeedScrollTop) {
        overSize = scrollStart - reorderableItemInfoStart;
        scroll = min(overSize, oneStepMax);
      }

      void calcOffset() {
        if (isNeedScrollBottom) {
          newOffset = min(position.maxScrollExtent, position.pixels + scroll);
        } else if (isNeedScrollTop) {
          newOffset = max(position.minScrollExtent, position.pixels - scroll);
        }
        isNeedScroll =
            newOffset != null && (newOffset! - position.pixels).abs() >= 1.0;
      }

      calcOffset();

      if (isNeedScroll) {
        calcOffset();
      }

      if (isNeedScroll) {
        _isScrollAnimationStarted = true;
        await position.animateTo(newOffset!,
            duration: const Duration(milliseconds: 14), curve: Curves.linear);
        _isScrollAnimationStarted = false;
        _scrollIfNeed();
      }
    }
  }

  Widget createProxy(BuildContext context) {
    final Offset position = reorderablePosition - dragOffset;
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: WFocusable(
        focusNode: _focusNode,
        onKeyEvent: onKeyEvent,
        onTap: onTap,
        child: SizedBox(
          width: itemSize.width,
          height: itemSize.height,
          child: reorderableGridItemBuilder != null
              ? reorderableGridItemBuilder!(index, child, onTap)
              : child,
        ),
      ),
    );
  }

  Offset getPosInGlobal() {
    return reorderablePosition - dragOffset;
  }

  Offset getCenterInGlobal() {
    return getPosInGlobal() + dragSize.center(Offset.zero);
  }

  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class ReorderableGridController {
  int? dragIndex;
  int? dropIndex;

  void Function()? dragReset;
}
