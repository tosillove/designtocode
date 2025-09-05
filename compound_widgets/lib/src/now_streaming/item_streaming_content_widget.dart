import 'package:compound_widgets/src/now_streaming/streaming_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';
/*
 * A widget that displays streaming content with various customizable properties.
 */
class ItemStreamingContentWidget extends StatefulWidget {
  /*
   * Creates an ItemStreamingContentWidget.
   *
   * @param image The URL of the content image.
   * @param type The type of the item: either 'contents' or 'title'.
   * @param cpTitle The title text.
   * @param contentId The content ID.
   * @param category The category name for the category title.
   * @param isRtl Whether the title is right-to-left.
   * @param categoryTitleTopPadding The padding of the category title from the top.
   * @param categoryTitleBottomPadding The padding of the category title from the bottom.
   * @param categoryTitleLeftPadding The padding of the category title from the left.
   * @param streamingCategoryTitleFontSize The font size of the streaming category title.
   * @param isFocus Whether the widget is focused.
   * @param subTitleText The subtitle text, used when isVod is true.
   * @param contentsHeight The height of the content.
   * @param focusedWidth The width of the focused content.
   * @param maskImageHeight The height of the mask image.
   * @param maskImage The URL of the mask image, used when the content is focused.
   * @param isVod Whether the content is VOD (Video on Demand).
   * @param streamingContentBorderSize The border size of the streaming content.
   * @param streamingContentBorderColor The border color of the streaming content.
   * @param borderOpacity The opacity of the border.
   * @param streamingContentHoveredBorderColor The border color when the content is hovered.
   * @param streamingTitleTopMargin The top margin of the streaming title.
   * @param streamingTitleHeight The height of the streaming title.
   * @param streamingTitleFontSize The font size of the streaming title.
   * @param streamingContentsHoverFontColor The font color when the content is hovered.
   * @param streamingTitlePadding The padding of the streaming title.
   * @param defaultImage The URL of the default image.
   * @param posTopOfTitle The position of the title from the top.
   * @param posLeftOfTitle The position of the title from the left.
   * @param posBottomOfTitle The position of the title from the bottom.
   * @param posTopOfTitleVod The position of the title from the top when isVod is true.
   * @param posLeftOfTitleVod The position of the title from the left when isVod is true.
   * @param posBottomOfTitleVod The position of the title from the bottom when isVod is true.
   * @param posTopOfSubtitleVod The position of the subtitle from the top when isVod is true.
   * @param posLeftOfSubTitleVod The position of the subtitle from the left when isVod is true.
   * @param posBottomOfSubTitleVod The position of the subtitle from the bottom when isVod is true.
   * @param iconImageSize The size of the icon image.
   * @param focusedIconImageSize The size of the focused icon image.
   * @param iconSize The size of the icon.
   * @param focusedIconSize The size of the focused icon.
   * @param iconImageRadius The radius of the icon image.
   * @param iconImageBgColor The background color of the icon image container.
   * @param iconBgColor The background color of the icon itself.
   * @param iconFocusedImage The URL of the focused icon image.
   * @param iconFocusedImageWidth The width of the focused icon image.
   * @param iconFocusedImageHeight The height of the focused icon image.
   * @param iconFocusedImagLeftPos The left position of the focused icon image.
   * @param iconFocusedImagTopPos The top position of the focused icon image.
   */
  const ItemStreamingContentWidget(
      {super.key,
      required this.image,
      required this.type,
      required this.cpTitle,
      required this.contentId,
      required this.category,
      this.isRtl = false,
      this.categoryTitleTopPadding = 0,
      this.categoryTitleBottomPadding = 33,
      this.categoryTitleLeftPadding = 0,
      this.streamingCategoryTitleFontSize = 48,
      required this.isFocus,
      this.subTitleText = '00h 00m',
      this.contentsHeight = 432,
      this.focusedWidth = 882,
      this.maskImageHeight = 126,
      this.maskImage = 'compound_images/streaming/mask.png',
      this.isVod = false,
      this.streamingContentBorderSize = 2.0,
      this.streamingContentBorderColor = const Color(0xffFFFFFF),
      this.borderOpacity = 0.3,
      this.streamingContentHoveredBorderColor = const Color(0xffE6E6E6),
      this.streamingTitleTopMargin = 42,
      this.streamingTitleHeight = 57,
      this.streamingTitleFontSize = 48,
      this.streamingContentsHoverFontColor = const Color(0xffE6E6E6),
      this.streamingTitlePadding = 30,
      this.defaultImage = 'compound_images/streaming/bg_wowcast.webp',
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
      this.iconBgColor = Colors.transparent,
      this.focusedIconImageSize = 268.44,
      this.focusedIconSize = 302,
      this.iconImageRadius = 18.51,
      this.iconFocusedImage = 'compound_images/streaming/Bitmap.png',
      this.iconFocusedImageWidth = 120,
      this.iconFocusedImageHeight = 170,
      this.iconFocusedImagLeftPos = 280,
      this.iconFocusedImagTopPos = 266,
      this.semanticLabel = ''});

  // contents image url
  final String image;
  // type of item : contents or title
  final String type;
  // title text
  final String cpTitle;
  final String contentId;
  // category name for category title
  final String category;
  // padding of category title
  final double categoryTitleTopPadding;
  final double categoryTitleBottomPadding;
  final double categoryTitleLeftPadding;
  final double streamingCategoryTitleFontSize;
  // r to l of title
  final bool isRtl;
  // is contents Vod
  final bool isVod;
  final bool isFocus;
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

  // default image url
  final String defaultImage;

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
  // color of background of icon itself
  final Color iconBgColor;
  final String iconFocusedImage;
  final double iconFocusedImageWidth;
  final double iconFocusedImageHeight;
  final double iconFocusedImagLeftPos;
  final double iconFocusedImagTopPos;

  final String semanticLabel;

  @override
  State<ItemStreamingContentWidget> createState() => _ItemStreamingContentState();
}

class _ItemStreamingContentState extends State<ItemStreamingContentWidget> {
  final GlobalKey _stackKey = GlobalKey();
  double _stackWidth = 0;
  int? prevIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _measureStackWidth();
    });
  }

  /*
   * Measures the width of the stack and updates the state.
   */
  void _measureStackWidth() {
    final context = _stackKey.currentContext;
    if (context != null) {
      final RenderBox renderBox = context.findRenderObject()! as RenderBox;
      setState(() {
        _stackWidth = renderBox.size.width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: widget.semanticLabel,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widget.streamingTitleTopMargin,
            ),
            ExcludeSemantics(
              child: StreamingHeaderWidget(
                height: widget.streamingTitleHeight,
                paddingTitleTop: widget.categoryTitleTopPadding,
                paddingTitleBottom: widget.categoryTitleBottomPadding,
                paddingLeft: widget.categoryTitleLeftPadding,
                fontWeight: FontWeight.w400,
                title: widget.category ?? '',
                animation: false,
                fontSize: widget.streamingCategoryTitleFontSize,
              ),
            ),
            Stack(children: [
              Container(
                height: widget.contentsHeight,
                decoration: widget.type != 'icon' ? _decoImageContainer() : null,
                child: _child(widget.isFocus, widget.defaultImage, widget.contentsHeight, widget.type),
              ),
              if (widget.isFocus && widget.cpTitle.isNotEmpty)
                Positioned(
                    bottom: widget.isVod ? widget.posBottomOfTitleVod : widget.posBottomOfTitle,
                    left: widget.isVod ? widget.posLeftOfTitleVod : widget.posLeftOfTitleVod,
                    right: widget.isVod ? widget.posLeftOfTitleVod : widget.posLeftOfTitleVod,
                    child: _titleWidget(
                      isRtl: widget.isRtl,
                      isVod: widget.isVod,
                    )),
              if (widget.isVod && widget.isFocus)
                Positioned(
                    bottom: widget.posBottomOfSubTitleVod,
                    left: widget.posLeftOfSubTitleVod,
                    right: widget.posLeftOfSubTitleVod,
                    child: _subTitleText(widget.streamingTitleFontSize * 0.75))
            ]),
          ],
        ));
  }

  /*
   * Builds the child widget based on the focus state and type.
   *
   * @param isFocus Whether the widget is focused.
   * @param defaultImage The default image URL.
   * @param imageHeight The height of the image.
   * @param type The type of the item: either 'contents' or 'icon'.
   * @return The child widget.
   */
  Widget _child(bool isFocus, String defaultImage, double imageHeight, String type) {
    if (type == 'icon') {
      final double iconSize = isFocus ? widget.focusedIconSize : widget.iconSize;
      final double iconImageSize = isFocus ? widget.focusedIconImageSize : widget.iconImageSize;
      return Stack(children: [
        Container(
            height: imageHeight,
            width: imageHeight,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Color(0xff333333)),
            child: Container(
                height: iconSize,
                width: iconSize,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.iconImageRadius), color: widget.iconBgColor),
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.iconImageRadius),
                    child: (widget.image.startsWith('http://') || widget.image.startsWith('https://'))
                        ? Image.network(widget.image, height: iconImageSize, width: iconImageSize, fit: BoxFit.cover)
                        : Image.asset(widget.image, height: iconImageSize, width: iconImageSize, fit: BoxFit.cover)))),
        isFocus
            ? Positioned(
                left: widget.iconFocusedImagLeftPos,
                top: widget.iconFocusedImagTopPos,
                child: Container(
                    alignment: Alignment.topLeft,
                    width: widget.iconFocusedImageWidth,
                    height: widget.iconFocusedImageHeight,
                    child: Image.asset(
                      widget.iconFocusedImage,
                      width: widget.iconFocusedImageWidth,
                      height: widget.iconFocusedImageHeight,
                      fit: BoxFit.cover,
                    )))
            : const SizedBox.shrink()
      ]);
    } else {
      if (widget.image.startsWith('http://') || widget.image.startsWith('https://')) {
        return Stack(children: [
          Image.network(
            widget.image,
            gaplessPlayback: true,
            fit: BoxFit.cover,
            cacheHeight: imageHeight.toInt(),
          ),
          Positioned(
              bottom: 0,
              child: isFocus
                  ? Image.asset(
                      widget.maskImage,
                      width: widget.focusedWidth,
                      height: widget.maskImageHeight,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.dstIn,
                    )
                  : const SizedBox.shrink()),
        ]);
      } else {
        return Image.asset(
          widget.image,
          fit: BoxFit.fitHeight,
          gaplessPlayback: true,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
        );
      }
    }
  }

  /*
   * Builds the title widget based on the RTL and VOD state.
   *
   * @param isRtl Whether the title is right-to-left.
   * @param isVod Whether the content is VOD (Video on Demand).
   * @return The title widget.
   */
  Widget _titleWidget({bool isRtl = false, bool isVod = false}) {
    String title = widget.cpTitle;
    EdgeInsets padding = EdgeInsets.only(
      top: isVod ? widget.posTopOfTitleVod : widget.posTopOfTitle,
    );
    return Container(
      width: _stackWidth,
      padding: padding,
      alignment: isVod ? Alignment.bottomLeft : Alignment.center,
      child: WMarquee(
        text: title,
        style: TextStyle(
          color: widget.streamingContentsHoverFontColor,
          fontSize: widget.streamingTitleFontSize,
        ),
        alwaysScroll: true,
        isLtoR: !isRtl,
      ),
    );
  }

  /*
   * Builds the subtitle text widget.
   *
   * @param fontSize The font size of the subtitle text.
   * @return The subtitle text widget.
   */
  Widget _subTitleText(double fontSize) {
    EdgeInsets padding = EdgeInsets.only(
      top: widget.posTopOfSubtitleVod,
    );

    return Container(
      width: _stackWidth,
      padding: padding,
      child: Text(
        widget.subTitleText,
        style: TextStyle(
          color: widget.streamingContentsHoverFontColor,
          fontSize: fontSize,
        ),
      ),
    );
  }

  /*
   * Returns the decoration for the image container based on the focus state.
   *
   * @return The decoration for the image container.
   */
  BoxDecoration? _decoImageContainer() {
    if (widget.isFocus) {
      return BoxDecoration(
        border: Border.all(
            color: widget.streamingContentHoveredBorderColor,
            width: widget.streamingContentBorderSize,
            strokeAlign: BorderSide.strokeAlignInside),
      );
    } else {
      return BoxDecoration(
        border: Border.all(
            color: widget.streamingContentBorderColor.withOpacity(widget.borderOpacity),
            width: widget.streamingContentBorderSize,
            strokeAlign: BorderSide.strokeAlignInside),
      );
    }
  }
}
