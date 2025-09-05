import 'package:compound_widgets/src/now_streaming/streaming_tab_widget.dart';
import 'package:compound_widgets/src/now_streaming/streaming_content_widget.dart';
import 'package:compound_widgets/src/now_streaming/streaming_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * A widget that displays streaming content with various customizable properties.
 */
class NowStreamingWidget extends StatefulWidget {
  /*
   * Creates a NowStreamingWidget.
   *
   * @param contents The list of streaming contents.
   * @param tabList The list of tabs.
   * @param width The width of the widget. Defaults to 2688.
   * @param height The height of the widget. Defaults to 786.
   * @param spaceTabCategory The space between tabs and category. Defaults to 42.
   * @param streamingCategoryTitleHeight The height of the streaming category title. Defaults to 57.
   * @param spaceCategoryContents The space between category and contents. Defaults to 33.
   * @param streamingContentsHeight The height of the streaming contents. Defaults to 432.
   * @param hoveredStreamingContentsHeight The height of the streaming contents when hovered. Defaults to 498.
   * @param title The title of the widget. Defaults to an empty string.
   * @param streamingHeaderheight The height of the streaming header. Defaults to 63.
   * @param streamingHeaderPaddingLeft The left padding of the streaming header. Defaults to 30.
   * @param streamingHeaderPaddingTitleBottom The bottom padding of the streaming header title. Defaults to 39.
   * @param streamingHeaderPaddingTitleTop The top padding of the streaming header title. Defaults to 0.
   * @param streamingHeaderFontSize The font size of the streaming header. Defaults to 54.
   * @param streamingHeaderFontWeight The font weight of the streaming header. Defaults to FontWeight.w600.
   * @param streamingHeaderFontStyle The font style of the streaming header. Defaults to FontStyle.normal.
   * @param streamingHeaderFontColor The font color of the streaming header. Defaults to Color(0xffFFFFFF).
   * @param streamingHeaderFontOpacity The font opacity of the streaming header. Defaults to 1.0.
   * @param streamingHeaderLabelSemantic The semantic label of the streaming header.
   * @param isRtl Whether the widget is right-to-left. Defaults to false.
   * @param streamingHeaderAnimation Whether the streaming header has animation. Defaults to true.
   * @param streamingHeaderShelfTitleAnimOffset The animation offset of the streaming header shelf title. Defaults to 10.
   * @param streamingTabGroupLabel The label of the streaming tab group. Defaults to 'Tab_streaming'.
   * @param streamingTabHeight The height of the streaming tab. Defaults to 120.
   * @param streamingTabWidth The width of the streaming tab. Defaults to 588.
   * @param streamingTabListStartMargin The start margin of the streaming tab list. Defaults to 42.
   * @param tabTitleFontSize The font size of the tab title. Defaults to 48.
   * @param tabButtonHeight The height of the tab button. Defaults to 90.
   * @param tabButtonWidth The width of the tab button. Defaults to 558.
   * @param tabButtonTextHeight The text height of the tab button. Defaults to 57.
   * @param tabButtonTextWidth The text width of the tab button. Defaults to 504.
   * @param tabButtonBorderSize The border size of the tab button. Defaults to 4.
   * @param streamingTabListBgColor The background color of the streaming tab list. Defaults to Color(0xff2D3136).
   * @param streamingTabListBgColorOpacity The background color opacity of the streaming tab list. Defaults to 1.0.
   * @param streamingTabListBorderColor The border color of the streaming tab list. Defaults to Color(0xffAAAAAA).
   * @param streamingTabListBorderColorOpacity The border color opacity of the streaming tab list. Defaults to 1.0.
   * @param tabButtonFontColor The font color of the tab button. Defaults to Color(0xffE6E6E6).
   * @param tabButtonBorderColor The border color of the tab button. Defaults to Colors.transparent.
   * @param tabButtonBgColor The background color of the tab button. Defaults to Colors.transparent.
   * @param tabButtonHoveredBgColor The background color of the tab button when hovered. Defaults to Color(0xffE6E6E6).
   * @param tabButtonHoveredBgColorOpacity The background color opacity of the tab button when hovered. Defaults to 1.0.
   * @param tabButtonHoveredBorderColor The border color of the tab button when hovered. Defaults to Colors.transparent.
   * @param tabButtonHoveredFontColor The font color of the tab button when hovered. Defaults to Color(0xff4C5059).
   * @param tabButtonSelectedFontColor The font color of the selected tab button. Defaults to Color(0xffE6E6E6).
   * @param tabButtonSelectedBorderColor The border color of the selected tab button. Defaults to Color(0xffAAAAAA).
   * @param tabButtonSelectedBgColor The background color of the selected tab button. Defaults to Colors.transparent.
   * @param hoveredTabButtonRadius The radius of the hovered tab button. Defaults to 18.
   * @param is4K Whether the widget is in 4K resolution. Defaults to true.
   * @param onTap The callback function when the widget is tapped.
   * @param streamingContentsChildMargin The margin of the streaming contents child. Defaults to 48.
   * @param streamingContentsAnimatedScale The animated scale of the streaming contents. Defaults to 1.15.
   * @param categoryTitleTopPadding The top padding of the category title. Defaults to 0.
   * @param categoryTitleBottomPadding The bottom padding of the category title. Defaults to 33.
   * @param categoryTitleLeftPadding The left padding of the category title. Defaults to 0.
   * @param streamingCategoryTitleFontSize The font size of the streaming category title. Defaults to 48.
   * @param subTitleText The subtitle text. Defaults to '00h 00m'.
   * @param focuseContentsWidth The width of the focused contents. Defaults to 882.
   * @param maskImageHeight The height of the mask image. Defaults to 126.
   * @param maskImage The URL of the mask image. Defaults to 'compound_images/streaming/mask.png'.
   * @param streamingContentBorderSize The border size of the streaming content. Defaults to 2.0.
   * @param streamingContentBorderColor The border color of the streaming content. Defaults to Color(0xffFFFFFF).
   * @param borderOpacity The opacity of the border. Defaults to 0.3.
   * @param streamingContentHoveredBorderColor The border color of the streaming content when hovered. Defaults to Color(0xffE6E6E6).
   * @param streamingTitleTopMargin The top margin of the streaming title. Defaults to 42.
   * @param streamingTitleHeight The height of the streaming title. Defaults to 57.
   * @param streamingTitleFontSize The font size of the streaming title. Defaults to 48.
   * @param streamingContentsHoverFontColor The font color of the streaming contents when hovered. Defaults to Color(0xffE6E6E6).
   * @param streamingTitlePadding The padding of the streaming title. Defaults to 30.
   * @param posTopOfTitle The top position of the title. Defaults to 405.
   * @param posLeftOfTitle The left position of the title. Defaults to 60.
   * @param posBottomOfTitle The bottom position of the title. Defaults to 36.
   * @param posTopOfTitleVod The top position of the title when isVod is true. Defaults to 345.
   * @param posLeftOfTitleVod The left position of the title when isVod is true. Defaults to 24.
   * @param posBottomOfTitleVod The bottom position of the title when isVod is true. Defaults to 96.
   * @param posTopOfSubtitleVod The top position of the subtitle when isVod is true. Defaults to 414.
   * @param posLeftOfSubTitleVod The left position of the subtitle when isVod is true. Defaults to 24.
   * @param posBottomOfSubTitleVod The bottom position of the subtitle when isVod is true. Defaults to 42.
   * @param iconImageSize The size of the icon image. Defaults to 224.
   * @param iconSize The size of the icon. Defaults to 252.
   * @param iconImageBgColor The background color of the icon image container. Defaults to Color(0xff333333).
   * @param focusedIconImageSize The size of the focused icon image. Defaults to 268.44.
   * @param focusedIconSize The size of the focused icon. Defaults to 302.
   * @param iconImageRadius The radius of the icon image. Defaults to 18.51.
   * @param iconFocusedImage The URL of the focused icon image. Defaults to 'compound_images/streaming/Bitmap.png'.
   * @param iconFocusedImageWidth The width of the focused icon image. Defaults to 120.
   * @param iconFocusedImageHeight The height of the focused icon image. Defaults to 170.
   * @param iconFocusedImagLeftPos The left position of the focused icon image. Defaults to 280.
   * @param iconFocusedImagTopPos The top position of the focused icon image. Defaults to 266.
   */
  const NowStreamingWidget(
      {super.key,
      required this.contents,
      required this.tabList,
      this.width = 2688,
      this.height = 786,
      this.spaceTabCategory = 42,
      this.streamingCategoryTitleHeight = 57,
      this.spaceCategoryContents = 33,
      this.streamingContentsHeight = 432,
      this.hoveredStreamingContentsHeight = 498,
      this.title = '',
      this.streamingHeaderheight = 63,
      this.streamingHeaderPaddingLeft = 30,
      this.streamingHeaderPaddingTitleBottom = 39,
      this.streamingHeaderPaddingTitleTop = 0,
      this.streamingHeaderFontSize = 54,
      this.streamingHeaderFontWeight = FontWeight.w600,
      this.streamingHeaderFontStyle = FontStyle.normal,
      this.streamingHeaderFontColor = const Color(0xffFFFFFF),
      this.streamingHeaderFontOpacity = 1.0,
      this.streamingHeaderLabelSemantic = '',
      this.isRtl = false,
      this.streamingHeaderAnimation = true,
      this.streamingHeaderShelfTitleAnimOffset = 10,
      this.streamingTabGroupLabel = 'Tab_streaming',
      this.streamingTabHeight = 120,
      this.streamingTabWidth = 588,
      this.streamingTabListStartMargin = 42,
      this.tabTitleFontSize = 48,
      this.tabButtonHeight = 90,
      this.tabButtonWidth = 558,
      this.tabButtonTextHeight = 57,
      this.tabButtonTextWidth = 504,
      this.tabButtonBorderSize = 4,
      this.streamingTabListBgColor = const Color(0xff2D3136),
      this.streamingTabListBgColorOpacity = 1.0,
      this.streamingTabListBorderColor = const Color(0xffAAAAAA),
      this.streamingTabListBorderColorOpacity = 1.0,
      this.tabButtonFontColor = const Color(0xffE6E6E6),
      this.tabButtonBorderColor = Colors.transparent,
      this.tabButtonBgColor = Colors.transparent,
      this.tabButtonHoveredBgColor = const Color(0xffE6E6E6),
      this.tabButtonHoveredBgColorOpacity = 1.0,
      this.tabButtonHoveredBorderColor = Colors.transparent,
      this.tabButtonHoveredFontColor = const Color(0xff4C5059),
      this.tabButtonSelectedFontColor = const Color(0xffE6E6E6),
      this.tabButtonSelectedBorderColor = const Color(0xffAAAAAA),
      this.tabButtonSelectedBgColor = Colors.transparent,
      this.hoveredTabButtonRadius = 18,
      this.is4K = true,
      this.onTap,
      this.streamingContentsChildMargin = 48,
      this.streamingContentsAnimatedScale = 1.15,
      this.categoryTitleTopPadding = 0,
      this.categoryTitleBottomPadding = 33,
      this.categoryTitleLeftPadding = 0,
      this.streamingCategoryTitleFontSize = 48,
      this.subTitleText = '00h 00m',
      this.focuseContentsWidth = 882,
      this.maskImageHeight = 126,
      this.maskImage = 'assets/compound_images/streaming/mask.png',
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
      this.iconFocusedImage = 'assets/compound_images/streaming/Bitmap.png',
      this.iconFocusedImageWidth = 120,
      this.iconFocusedImageHeight = 170,
      this.iconFocusedImagLeftPos = 280,
      this.iconFocusedImagTopPos = 266});

  final List<Map<String, Object>> contents;
  final List tabList;
  // width of whole streaming contents
  final double width;
  // height of whole streaming widget
  final double height;
  // space between streaming TAB and Category title
  final double spaceTabCategory;
  // height of category title
  final double streamingCategoryTitleHeight;
  // space between category title and contents
  final double spaceCategoryContents;
  // height of contents image
  final double streamingContentsHeight;
  // height of hovered contents image
  final double hoveredStreamingContentsHeight;

  final bool isRtl;

  ////StreamingHeaderWidget
  final String title;
  final double streamingHeaderheight;
  final double streamingHeaderPaddingLeft;
  final double streamingHeaderPaddingTitleBottom;
  final double streamingHeaderPaddingTitleTop;
  final double streamingHeaderFontSize;
  final Color streamingHeaderFontColor;
  final double streamingHeaderFontOpacity;
  final FontWeight streamingHeaderFontWeight;
  final FontStyle streamingHeaderFontStyle;
  final String streamingHeaderLabelSemantic;
  final bool streamingHeaderAnimation;
  final double streamingHeaderShelfTitleAnimOffset;

  ///StreamingTabWidget
  final String streamingTabGroupLabel;
  final double streamingTabHeight;
  final double streamingTabWidth;
  final double streamingTabListStartMargin;
  final Color streamingTabListBgColor;
  final double streamingTabListBgColorOpacity;
  final Color streamingTabListBorderColor;
  final double streamingTabListBorderColorOpacity;

  final double tabTitleFontSize;

  final double tabButtonHeight;
  final double tabButtonWidth;
  final double tabButtonTextHeight;
  final double tabButtonTextWidth;
  final double tabButtonBorderSize;

  final Color tabButtonFontColor;
  final Color tabButtonBorderColor;
  final Color tabButtonBgColor;

  final Color tabButtonHoveredBgColor;
  final double tabButtonHoveredBgColorOpacity;
  final Color tabButtonHoveredBorderColor;
  final Color tabButtonHoveredFontColor;

  final Color tabButtonSelectedBgColor;
  final Color tabButtonSelectedBorderColor;
  final Color tabButtonSelectedFontColor;

  final double hoveredTabButtonRadius;

  ///StreamingContentWidget
  final bool is4K;
  final void Function(String id, int index)? onTap;
  final double streamingContentsChildMargin;
  final double streamingContentsAnimatedScale;

  ///// properties of ItemStreamingContents widget ///
  // padding of category title
  final double categoryTitleTopPadding;
  final double categoryTitleBottomPadding;
  final double categoryTitleLeftPadding;
  // font size of category title
  final double streamingCategoryTitleFontSize;

  // time info when isVod is true
  final String subTitleText;
  // width of focused
  final double focuseContentsWidth;
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
  State<NowStreamingWidget> createState() => _NowStreamingWidgetState();
}

class _NowStreamingWidgetState extends State<NowStreamingWidget> {
  String selectedId = '';
  /*
   * Updates the selected tab ID and triggers a state update.
   *
   * @param id The ID of the selected tab.
   */
  void updateTabId(String id) {
    setState(() {
      selectedId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<StreamingTab> streamingTabList = [];
    for (int i = 0; i < widget.tabList.length; i++) {
      streamingTabList.add(StreamingTab(widget.tabList[i]['title'],
          widget.tabList[i]['id'], widget.tabList[i]['focus_id'], tabCallback));
    }

    return WFocusableScope(
        tapByEnter: false,
        focusOnTap: false,
        focusOnHover: false,
        onFocusChange: (p0) {
          if (p0) {
            debugPrint('onFocusChangeNowStreamingWidget:$p0');
          }
        },
        child: Container(
            width: widget.width,
            height: widget.height +
                (widget.hoveredStreamingContentsHeight -
                    widget.streamingContentsHeight),
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: StreamingHeaderWidget(
                      title: 'Now Streaming',
                      height: widget.streamingHeaderheight,
                      paddingLeft: widget.streamingHeaderPaddingLeft,
                      paddingTitleBottom:
                          widget.streamingHeaderPaddingTitleBottom,
                      paddingTitleTop: widget.streamingHeaderPaddingTitleTop,
                      fontSize: widget.streamingHeaderFontSize,
                      fontColor: widget.streamingHeaderFontColor,
                      fontOpacity: widget.streamingHeaderFontOpacity,
                      fontWeight: widget.streamingHeaderFontWeight,
                      fontStyle: widget.streamingHeaderFontStyle,
                      labelSemantic: widget.streamingHeaderLabelSemantic,
                      isRtl: widget.isRtl,
                      animation: widget.streamingHeaderAnimation,
                      shelfTitleAnimOffset:
                          widget.streamingHeaderShelfTitleAnimOffset),
                ),
                StreamingTabWidget(
                    streamingTabs: streamingTabList,
                    streamingTabHeight: widget.streamingTabHeight,
                    streamingTabWidth: widget.streamingTabWidth,
                    streamingTabListWidth: widget.width,
                    streamingTabListStartMargin:
                        widget.streamingTabListStartMargin,
                    streamingTabListBgColor: widget.streamingTabListBgColor,
                    streamingTabListBgColorOpacity:
                        widget.streamingTabListBgColorOpacity,
                    streamingTabListBorderColor:
                        widget.streamingTabListBorderColor,
                    streamingTabListBorderColorOpacity:
                        widget.streamingTabListBorderColorOpacity,
                    tabTitleFontSize: widget.tabTitleFontSize,
                    tabButtonHeight: widget.tabButtonHeight,
                    tabButtonWidth: widget.tabButtonWidth,
                    tabButtonTextHeight: widget.tabButtonTextHeight,
                    tabButtonTextWidth: widget.tabButtonTextWidth,
                    tabButtonBorderSize: widget.tabButtonBorderSize,
                    tabButtonFontColor: widget.tabButtonFontColor,
                    tabButtonBorderColor: widget.tabButtonBorderColor,
                    tabButtonBgColor: widget.tabButtonBgColor,
                    tabButtonHoveredBgColor: widget.tabButtonHoveredBgColor,
                    tabButtonHoveredBgColorOpacity:
                        widget.tabButtonHoveredBgColorOpacity,
                    tabButtonHoveredBorderColor:
                        widget.tabButtonHoveredBorderColor,
                    tabButtonHoveredFontColor: widget.tabButtonHoveredFontColor,
                    tabButtonSelectedBgColor: widget.tabButtonSelectedBgColor,
                    tabButtonSelectedBorderColor:
                        widget.tabButtonSelectedBorderColor,
                    tabButtonSelectedFontColor:
                        widget.tabButtonSelectedFontColor,
                    hoveredTabButtonRadius: widget.hoveredTabButtonRadius),
                Container(
                  alignment: Alignment.topLeft,
                  height: widget.spaceTabCategory +
                      widget.streamingCategoryTitleHeight +
                      widget.spaceCategoryContents +
                      widget.streamingContentsHeight,
                  width: widget.width,
                  child: StreamingContentWidget(
                      selectedId: selectedId == ''
                          ? widget.contents[0]['id'].toString()
                          : selectedId,
                      contentsListAll: widget.contents,
                      is4K: widget.is4K,
                      onTap: widget.onTap,
                      childMargin: widget.streamingContentsChildMargin,
                      animatedScale: widget.streamingContentsAnimatedScale,
                      screenWidth: widget.width,
                      isRtl: widget.isRtl,
                      categoryTitleTopPadding: widget.categoryTitleTopPadding,
                      categoryTitleBottomPadding:
                          widget.categoryTitleBottomPadding,
                      categoryTitleLeftPadding: widget.categoryTitleLeftPadding,
                      streamingCategoryTitleFontSize:
                          widget.streamingCategoryTitleFontSize,
                      subTitleText: widget.subTitleText,
                      contentsHeight: widget.streamingContentsHeight,
                      focusedWidth: widget.focuseContentsWidth,
                      maskImageHeight: widget.maskImageHeight,
                      maskImage: widget.maskImage,
                      streamingContentBorderSize:
                          widget.streamingContentBorderSize,
                      streamingContentBorderColor:
                          widget.streamingContentBorderColor,
                      borderOpacity: widget.borderOpacity,
                      streamingContentHoveredBorderColor:
                          widget.streamingContentHoveredBorderColor,
                      streamingTitleTopMargin: widget.streamingTitleTopMargin,
                      streamingTitleHeight: widget.streamingTitleHeight,
                      streamingTitleFontSize: widget.streamingTitleFontSize,
                      streamingContentsHoverFontColor:
                          widget.streamingContentsHoverFontColor,
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
                      iconFocusedImagTopPos: widget.iconFocusedImagTopPos),
                ),
              ],
            )));
  }

  /*
   * Callback function for tab selection.
   *
   * @param id The ID of the selected tab.
   */
  void tabCallback(String id) {
    debugPrint('streaming tab Callback id: $id');
    updateTabId(id);
  }
}

/*
 * for testing (now_streaming_test.dart)
 */
extension NowStreamingWidgetExtension on NowStreamingWidget {
  String get selectedId =>
      (createState() as _NowStreamingWidgetState).selectedId;
}
