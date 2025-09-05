import 'package:flutter/material.dart';

/*
 * A widget that displays a grid of items with customizable padding and spacing.
 * This widget uses a [GridView] to arrange its children in a grid format.
 * You can specify the number of columns, item dimensions, and spacing between items.
*/

class ContentListView extends StatefulWidget {
  /*
   * Creates a [ContentListView].
   * The [itemBuilder] parameter is required and is used to build each item in the grid.
   *
   * @param paddingLeft The left padding of the grid. Defaults to 576.
   * @param paddingTop The top padding of the grid. Defaults to 662.
   * @param paddingRight The right padding of the grid. Defaults to 576.
   * @param paddingBottom The bottom padding of the grid. Defaults to 0.
   * @param mainAxisSpacing The spacing between items in the main axis (vertical). Defaults to 93.
   * @param crossAxisSpacing The spacing between items in the cross axis (horizontal). Defaults to 72.
   * @param itemWidth The width of each item in the grid. Defaults to 711.
   * @param itemHeight The height of each item in the grid. Defaults to 511 (calculated).
   * @param crossAxisCount The number of columns in the grid. Defaults to 4.
   * @param itemCount The total number of items to display in the grid. Defaults to 8.
   * @param itemBuilder A builder function that creates the items in the grid. This parameter is required.
   */
  const ContentListView({
    super.key,
    this.paddingLeft = 576,
    this.paddingTop = 662,
    this.paddingRight = 576,
    this.paddingBottom = 0,
    this.mainAxisSpacing = 93,
    this.crossAxisSpacing = 72,
    this.itemWidth = 711,
    this.itemHeight = 348 + 36 + 57 + 70,
    this.crossAxisCount = 4,
    this.itemCount = 8,
    required this.itemBuilder,
  });

  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final int crossAxisCount;
  final int itemCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final IndexedWidgetBuilder itemBuilder;
  final int itemWidth;
  final int itemHeight;

  @override
  State<ContentListView> createState() => _ContentListViewState();
}

class _ContentListViewState extends State<ContentListView> {
  /*
   * Builds a single item in the grid using the provided [itemBuilder].
   * This method is called for each item in the grid.
   *
   * @param context The build context for the widget.
   * @param index The index of the item to build.
   */
  Widget _itemBuilder(BuildContext context, int index) {
    final Widget item = widget.itemBuilder(context, index);
    return item;
  }

  @override
  Widget build(BuildContext context) {
  return Container(
      padding: EdgeInsets.fromLTRB(
        widget.paddingLeft,
        widget.paddingTop,
        widget.paddingRight,
        widget.paddingBottom),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: widget.mainAxisSpacing,
          crossAxisSpacing: widget.crossAxisSpacing,
          crossAxisCount: widget.crossAxisCount,
          childAspectRatio: widget.itemWidth / widget.itemHeight),
          itemCount: widget.itemCount,
          itemBuilder: _itemBuilder,
        ),
    );
  }
}