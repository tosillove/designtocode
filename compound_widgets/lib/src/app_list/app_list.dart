import 'package:flutter/material.dart';

class AppList extends StatefulWidget {
  const AppList({
    super.key,
    this.rows = 2,
    this.width = 2808.0,
    this.height = 1000.0,
    this.crossAxisCount = 7,
    this.itemCount = 10,
    this.mainAxisSpacing = 96,
    this.crossAxisSpacing = 48,
    this.padding,
    this.itemWidth = 360,
    this.itemHeight = 360,
    required this.itemBuilder,
  }) : assert(itemCount <= 24 && rows < 4 && crossAxisCount < 9,
            "This GridView can contain fewer than 25 items, fewer than 4 rows, and fewer than 9 crossAxisCount.");

  final int rows;
  final double width;
  final double height;
  final int crossAxisCount;
  final int itemCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final EdgeInsets? padding;
  final IndexedWidgetBuilder itemBuilder;
  ////
  final int itemWidth;
  final int itemHeight;

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  int nDisplayItemCount = 0;
  double viewHeight = 0;

  Widget _itemBuilder(BuildContext context, int index) {
    final Widget item = widget.itemBuilder(context, index);
    return item;
  }

  @override
  void initState() {
    super.initState();
    if (widget.itemCount >= (widget.rows * widget.crossAxisCount)) {
      nDisplayItemCount = widget.rows * widget.crossAxisCount;
    } else {
      nDisplayItemCount = widget.itemCount;
    }

    viewHeight = (widget.rows * widget.itemHeight) +
        (widget.rows - 1) * widget.mainAxisSpacing;
  }

  EdgeInsets get _paddingOfContainer {
    if (widget.padding == null) {
      return const EdgeInsets.fromLTRB(0, 0, 0, 0);
    } else {
      return widget.padding!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _paddingOfContainer,
      width: widget.width,
      height: viewHeight,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: widget.mainAxisSpacing,
            crossAxisSpacing: widget.crossAxisSpacing,
            crossAxisCount: widget.crossAxisCount,
            childAspectRatio: widget.itemWidth / widget.itemHeight),
        itemCount: nDisplayItemCount,
        itemBuilder: _itemBuilder,
      ),
    );
  }
}
