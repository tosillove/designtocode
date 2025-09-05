import 'package:compound_widgets/src/now_streaming/item_streaming_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:plover/plover.dart';
import 'package:html_unescape/html_unescape.dart';

/*
 * A widget that displays streaming content in a carousel format.
 *
 * This widget is designed to show a list of streaming contents with various properties
 * such as title, subtitle, and icons. It supports focus and hover interactions and provides customization options for appearance and behavior.
 */
class StreamingContentWidget extends StatefulWidget {
  /*
   * Creates a StreamingContentWidget
   *
   * @param selectedId The ID of the selected content.
   * @param contentsListAll The complete list of contents to be displayed.
   * @param is4K Indicates whether the content is in 4K resolution.
   * @param onTap Callback function to be called when a content item is tapped.
   * @param childMargin The margin between child items in the carousel.
   * @param animatedScale The scale factor for the animated scaling effect.
   * @param screenWidth The width of the screen.
   * @param categoryTitleTopPadding The top padding of the category title.
   * @param categoryTitleBottomPadding The bottom padding of the category title.
   * @param categoryTitleLeftPadding The left padding of the category title.
   * @param streamingCategoryTitleFontSize The font size of the category title.
   * @param isRtl Indicates whether the text direction is right-to-left.
   * @param subTitleText The subtitle text to be displayed when the content is a VOD.
   * @param contentsHeight The height of the content items.
   * @param focusedWidth The width of the focused content item.
   * @param maskImageHeight The height of the mask image for the focused content item.
   * @param maskImage The URL of the mask image for the focused content item.
   * @param streamingContentBorderSize The border size of the streaming content items.
   * @param streamingContentBorderColor The border color of the streaming content items.
   * @param borderOpacity The opacity of the border color.
   * @param streamingContentHoveredBorderColor The border color of the streaming content items when hovered.
   * @param streamingTitleTopMargin The top margin of the streaming title.
   * @param streamingTitleHeight The height of the streaming title.
   * @param streamingTitleFontSize The font size of the streaming title.
   * @param streamingContentsHoverFontColor The font color of the streaming content items when hovered.
   * @param streamingTitlePadding The padding of the streaming title.
   * @param posTopOfTitle The top position of the title.
   * @param posLeftOfTitle The left position of the title.
   * @param posBottomOfTitle The bottom position of the title.
   * @param posTopOfTitleVod The top position of the title when the content is a VOD.
   * @param posLeftOfTitleVod The left position of the title when the content is a VOD.
   * @param posBottomOfTitleVod The bottom position of the title when the content is a VOD.
   * @param posTopOfSubtitleVod The top position of the subtitle when the content is a VOD.
   * @param posLeftOfSubTitleVod The left position of the subtitle when the content is a VOD.
   * @param posBottomOfSubTitleVod The bottom position of the subtitle when the content is a VOD.
   * @param iconImageSize The size of the custom app icon for the last index.
   * @param focusedIconImageSize The size of the focused custom app icon.
   * @param iconSize The size of the icon.
   * @param focusedIconSize The size of the focused icon.
   * @param iconImageRadius The radius of the icon image.
   * @param iconImageBgColor The background color of the icon image container.
   * @param iconFocusedImage The URL of the focused icon image.
   * @param iconFocusedImageWidth The width of the focused icon image.
   * @param iconFocusedImageHeight The height of the focused icon image.
   * @param iconFocusedImagLeftPos The left position of the focused icon image.
   * @param iconFocusedImagTopPos The top position of the focused icon image.
   */
  const StreamingContentWidget(
      {super.key,
      required this.selectedId,
      required this.contentsListAll,
      this.is4K = true,
      this.onTap,
      this.childMargin = 48,
      this.animatedScale = 1.15,
      this.screenWidth = 2688,
      this.isRtl = false,
      this.categoryTitleTopPadding = 0,
      this.categoryTitleBottomPadding = 33,
      this.categoryTitleLeftPadding = 0,
      this.streamingCategoryTitleFontSize = 48,
      this.subTitleText = '00h 00m',
      this.contentsHeight = 432,
      this.focusedWidth = 882,
      this.maskImageHeight = 126,
      this.maskImage = 'compound_images/streaming/mask.png',
      this.streamingContentBorderSize = 2.0,
      this.streamingContentBorderColor = const Color(0xffFFFFFF),
      this.borderOpacity = 0.3,
      this.streamingContentHoveredBorderColor = const Color(0xffE6E6E6),
      this.streamingTitleTopMargin = 42,
      this.streamingTitleHeight = 57,
      this.streamingTitleFontSize = 48,
      this.streamingContentsHoverFontColor = const Color(0xffE6E6E6),
      this.streamingTitlePadding = 30,
      this.posTopOfTitle = 405,
      this.posLeftOfTitle = 60,
      this.posBottomOfTitle = 36,
      this.posTopOfTitleVod = 345,
      this.posLeftOfTitleVod = 24,
      this.posBottomOfTitleVod = 96,
      this.posTopOfSubtitleVod = 414,
      this.posLeftOfSubTitleVod = 24,
      this.posBottomOfSubTitleVod = 42,
      this.iconImageSize = 224,
      this.iconSize = 252,
      this.iconImageBgColor = const Color(0xff333333),
      this.focusedIconImageSize = 268.44,
      this.focusedIconSize = 302,
      this.iconImageRadius = 18.51,
      this.iconFocusedImage = 'compound_images/streaming/Bitmap.png',
      this.iconFocusedImageWidth = 120,
      this.iconFocusedImageHeight = 170,
      this.iconFocusedImagLeftPos = 280,
      this.iconFocusedImagTopPos = 266});

  final String selectedId;
  final List<Map<String, Object>> contentsListAll;
  final bool is4K;
  final void Function(String id, int index)? onTap;
  final double childMargin;
  final double animatedScale;
  final double screenWidth;

  ///// properties of ItemStreamingContents widget ///
  // padding of category title
  final double categoryTitleTopPadding;
  final double categoryTitleBottomPadding;
  final double categoryTitleLeftPadding;
  final double streamingCategoryTitleFontSize;
  // r to l of title
  final bool isRtl;

  // time info when isVod is true
  final String subTitleText;
  // height of contents
  final double contentsHeight;
  // width of focused
  final double focusedWidth;
  final double maskImageHeight;
  // mask image url in case of focused
  final String maskImage;

  final double streamingContentBorderSize;
  final Color streamingContentBorderColor;
  final double borderOpacity;
  final Color streamingContentHoveredBorderColor;
  final double streamingTitleTopMargin;
  final double streamingTitleHeight;
  final double streamingTitleFontSize;
  final Color streamingContentsHoverFontColor;
  final double streamingTitlePadding;

  // position of title
  final double posTopOfTitle;
  final double posLeftOfTitle;
  final double posBottomOfTitle;

  // position of title in case of vod
  final double posTopOfTitleVod;
  final double posLeftOfTitleVod;
  final double posBottomOfTitleVod;

  // position of subtitle in case of vod
  final double posTopOfSubtitleVod;
  final double posLeftOfSubTitleVod;
  final double posBottomOfSubTitleVod;

  // custom app icon for last index
  final double iconImageSize;
  final double focusedIconImageSize;
  final double iconSize;
  final double focusedIconSize;
  final double iconImageRadius;
  // color of container of icon
  final Color iconImageBgColor;
  // url of focused icon image
  final String iconFocusedImage;
  // width of focused icon image
  final double iconFocusedImageWidth;
  // position of focused icon image
  final double iconFocusedImageHeight;
  final double iconFocusedImagLeftPos;
  final double iconFocusedImagTopPos;

  @override
  State<StreamingContentWidget> createState() => _StreamingContentsState();
}

class _StreamingContentsState extends State<StreamingContentWidget> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = getContents(widget.contentsListAll, widget.selectedId);
    if (list.isEmpty) {
      return SizedBox(width: widget.screenWidth, height: 300, child: const Text('List is empty'));
    }

    return WFocusableScope(
      tapByEnter: false,
      focusOnTap: false,
      focusOnHover: false,
      onFocusChange: (hasFocus) {},
      child: FocusScrollConfig(
          alignFocusedElementDeltaPixel: -widget.childMargin,
          child: Container(
            alignment: Alignment.topLeft,
            width: widget.screenWidth,
            child: WAnimatedCarousel(
              controller: _controller,
              key: ValueKey(widget.selectedId),
              onFocusChangeItem: (isFocus, index) {
                debugPrint('onFocusChangeItem:$index');
              },
              itemLabel: (index) {
                final item = list[index];
                String titleText = convertUnescape(item['titleText']) ?? '';
                return [titleText];
              },
              groupLabel: 'streaming',
              itemKey: (index) {
                final model = list[index];
                return model['contentId'];
              },
              speedScrolling: 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              onTap: (index) {
                widget.onTap?.call(widget.selectedId, index);
              },
              childMargin: widget.childMargin,
              animatedScale: widget.animatedScale,
              itemBuilder: (BuildContext context, int index, bool isFocus) => _itemBuilder(
                context,
                index,
                isFocus,
                list,
              ),
              itemCount: list.length,
              itemConfigBuilder: (index) {
                return AnimatedCarouselItemConfig(
                  shouldScaleOnFocus: (index == list.length - 1) ? false : true,
                );
              },
              cacheExtent: 888 * 3,
            ),
          )),
    );
  }

  /*
   * Builds the widget for each item in the carousel.
   *
   * @param context The build context.
   * @param index The index of the item.
   * @param isFocus Whether the item is focused.
   * @param list The list of contents.
   * @return The widget representing the item.
   */
  Widget _itemBuilder(
    BuildContext context,
    int index,
    bool isFocus,
    List list,
  ) {
    final item = list[index];
    String category = item['category'] ?? '';
    if (index == 0 || category != list[index - 1]['category']) {
      category = item['category'] ?? '';
    } else {
      category = '';
    }

    String? titleText = convertUnescape(item['titleText']) ?? '';
    String contentId = item['contentId'];
    late String imageUrl;
    if (widget.is4K) {
      imageUrl =
          item['image_4k'] != null && item['image_4k']['url'] != '' ? item['image_4k']['url'] : item['image']?['url'];
    } else {
      imageUrl = item['image']['url'];
    }

    Color iconBgColor = Colors.transparent;

    if (item['type'] == 'title') {
      if (item['image_4k'] != null && item['image_4k']['url'] != '') {
        if (item['image_4k']['bgColor'] != null && item['image_4k']['bgColor'] != '') {
          iconBgColor = convertHexColor(item['image_4k']['bgColor']);
        }
      } else {
        if (item['image']['bgColor'] != null && item['image']['bgColor'] != '') {
          iconBgColor = convertHexColor(item['image']['bgColor']);
        }
      }
    }

    return ItemStreamingContentWidget(
        image: imageUrl,
        type: item['type'] == 'title' ? 'icon' : 'contents',
        cpTitle: titleText,
        contentId: contentId,
        category: category,
        isFocus: isFocus,
        iconBgColor: iconBgColor,
        isRtl: widget.isRtl,
        categoryTitleTopPadding: widget.categoryTitleTopPadding,
        categoryTitleBottomPadding: widget.categoryTitleBottomPadding,
        categoryTitleLeftPadding: widget.categoryTitleLeftPadding,
        streamingCategoryTitleFontSize: widget.streamingCategoryTitleFontSize,
        subTitleText: widget.subTitleText,
        contentsHeight: widget.contentsHeight,
        focusedWidth: widget.focusedWidth,
        maskImageHeight: widget.maskImageHeight,
        maskImage: widget.maskImage,
        isVod: item['vod'] ?? false,
        streamingContentBorderSize: widget.streamingContentBorderSize,
        streamingContentBorderColor: widget.streamingContentBorderColor,
        borderOpacity: widget.borderOpacity,
        streamingContentHoveredBorderColor: widget.streamingContentHoveredBorderColor,
        streamingTitleTopMargin: widget.streamingTitleTopMargin,
        streamingTitleHeight: widget.streamingTitleHeight,
        streamingTitleFontSize: widget.streamingTitleFontSize,
        streamingContentsHoverFontColor: widget.streamingContentsHoverFontColor,
        streamingTitlePadding: widget.streamingTitlePadding,
        posTopOfTitle: widget.posTopOfTitle,
        posLeftOfTitle: widget.posLeftOfTitle,
        posBottomOfTitle: widget.posBottomOfTitle,
        posTopOfTitleVod: widget.posTopOfTitleVod,
        posLeftOfTitleVod: widget.posLeftOfTitleVod,
        posBottomOfTitleVod: widget.posBottomOfTitleVod,
        posTopOfSubtitleVod: widget.posTopOfSubtitleVod,
        posLeftOfSubTitleVod: widget.posLeftOfSubTitleVod,
        posBottomOfSubTitleVod: widget.posBottomOfSubTitleVod,
        iconImageSize: widget.iconImageSize,
        iconSize: widget.iconSize,
        iconImageBgColor: widget.iconImageBgColor,
        focusedIconImageSize: widget.focusedIconImageSize,
        focusedIconSize: widget.focusedIconSize,
        iconImageRadius: widget.iconImageRadius,
        iconFocusedImage: widget.iconFocusedImage,
        iconFocusedImageWidth: widget.iconFocusedImageWidth,
        iconFocusedImageHeight: widget.iconFocusedImageHeight,
        iconFocusedImagLeftPos: widget.iconFocusedImagLeftPos,
        iconFocusedImagTopPos: widget.iconFocusedImagTopPos,
        semanticLabel: titleText);
  }
}

/*
 * Retrieves the list of contents based on the selected ID.
 *
 * @param contentList The complete list of contents.
 * @param selectedId The ID of the selected content.
 * @return A list of contents filtered by the selected ID.
 */
List getContents(List conetentList, String selectedId) {
  debugPrint('streaming selectedId:$selectedId');
  for (int i = 0; i < conetentList.length; i++) {
    if (conetentList[i]['id'] == selectedId) {
      List result = conetentList[i]['contents'];
      final temp = result[result.indexWhere((item) => item['type'] == 'title')];
      result.removeWhere((item) => item['type'] == 'title');
      result.add(temp);
      return result;
    }
  }
  return [];
}

/*
 * Converts HTML escape sequences to their corresponding characters.
 *
 * @param value The text containing HTML escape sequences.
 * @return The unescaped text.
 */
String? convertUnescape(String? value) {
  if (value == null) {
    return null;
  }
  final unescape = HtmlUnescape();
  return unescape.convert(value);
}

/*
 * Converts a hexadecimal color string to a Color object.
 *
 * @param hexColorStr The hexadecimal color string.
 * @return The Color object representing the hexadecimal color.
 */
Color convertHexColor(String? hexColorStr) {
  if (isEmpty(hexColorStr)) {
    return Colors.transparent;
  }
  String cStr = hexColorStr!.substring(1);
  String colorStr = "";

  switch (cStr.length) {
    case 3:
      colorStr = "FF${cStr[0]}${cStr[0]}${cStr[1]}${cStr[1]}${cStr[2]}${cStr[2]}";
    case 4:
      colorStr = cStr[3] + cStr[3] + cStr[0] + cStr[0] + cStr[1] + cStr[1] + cStr[2] + cStr[2];
    case 6:
      colorStr = "FF$cStr";
    case 8:
      colorStr = cStr.substring(7) + cStr.substring(1, 7);
    default:
  }

  return Color(int.parse(colorStr, radix: 16));
}

/*
 * Checks if a string is empty or null.
 *
 * @param text The string to check.
 * @return True if the string is empty or null, false otherwise.
 */
bool isEmpty(String? text) {
  return text == null || text.trim().isEmpty || text == 'null' || text.isEmpty;
}
