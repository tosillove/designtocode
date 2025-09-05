import 'package:flutter/material.dart';
import 'package:plover/plover.dart';
import 'package:compound_widgets/src/hero_banner/indicator_widget.dart';
import 'package:compound_widgets/src/hero_banner/sponsor_label_widget.dart';

const _herroBannerID = 'herro_banner';

class HeroBannerWidget extends StatefulWidget {
  /*
   * Creates an instance of HeroBannerWidget.
   *
   * @param heroBannerWidgetHeroBannerWidth The width of the hero banner widget.
   * @param heroBannerWidgetHeroBannerHeight The height of the hero banner widget.
   * @param heroBannerWidgetBackgroundColor The background color of the hero banner widget.
   * @param heroBannerShowNetworkGuide Whether to show the network guide.
   * @param heroBannerShowNetworkGuideContents The content image for the network guide.
   * @param heroBannerShowNetworkGuideErrLabel The error label for the network guide.
   * @param heroBannerShowNetworkGuideBtnTxt The button text for network settings.
   * @param heroBannerShowGeneralTerms Whether to show general terms.
   * @param heroBannerShowGeneralTermsContents The content image for general terms.
   * @param heroBannerShowGeneralTermsErrLabel The error label for general terms.
   * @param heroBannerShowGeneralTermsBtnTxt The button text for user agreements.
   * @param heroBannerShowPromotion Whether to show promotions.
   * @param heroBannerShowPromotionContents The content image for promotions.
   * @param heroBannerShowPromotionErrLabel The error label for promotions.
   * @param heroBannerShowPromotionBtnTxt The button text for going to apps.
   * @param heroBannerWidgetErrContentWidth The width of the error content.
   * @param heroBannerWidgetErrBtnWidth The width of the error button.
   * @param heroBannerWidgetErrBtnHeight The height of the error button.
   * @param heroBannerWidgetErrBtnFocusedColor The focused color of the error button.
   * @param heroBannerWidgetErrBtnNotFocusedColor The not focused color of the error button.
   * @param heroBannerWidgetErrBtnBorderColor The border color of the error button.
   * @param heroBannerWidgetErrBtnBorderRadius The border radius of the error button.
   * @param heroBannerWidgetErrBtnBorderWidth The border width of the error button.
   * @param heroBannerWidgetErrContentFontSize The font size of the error content.
   * @param heroBannerWidgetErrBtnMarginTop The margin top of the error button.
   * @param heroBannerWidgetErrContentFontColor The font color of the error content.
   * @param heroBannerWidgetErrBtnFocusedFontColor The focused font color of the error button.
   * @param heroBannerWidgetErrBtnNotFocusedFontColor The not focused font color of the error button.
   * @param heroBannerWidgetErrBtnFontSize The font size of the error button.
   * @param heroBannerWidgetAdsContentWidth The width of the ads content.
   * @param heroBannerWidgetAdsContentHeight The height of the ads content.
   * @param heroBannerWidgetAdsContentStartMargin The start margin of ads content.
   * @param heroBannerWidgetHeroBannerContents The content image for the hero banner.
   * @param heroBannerWidgetBorderSize The border size of the hero banner widget.
   * @param heroBannerWidgetBorderColor The border color of the hero banner widget.
   * @param heroBannerWidgetContentPaddingLeft The left padding of the hero banner widget content.
   * @param heroBannerWidgetContentPaddingRight The right padding of the hero banner widget content.
   * @param heroBannerWidgetSponsoredText The text displayed for sponsored content.
   * @param heroBannerWidgetSponsorLabelStartMargin The start margin for the sponsor label.
   * @param heroBannerWidgetSponsorLabelPositionBottom The bottom position of the sponsor label.
   * @param heroBannerWidgetSponseredTextFontColor The font color of the sponsored text.
   * @param heroBannerWidgetSponseredTextFontShadowColor The shadow color of the sponsored text.
   * @param heroBannerWidgetOvalBottomPadding The bottom padding of oval indicator.
   * @param heroBannerWidgetOvalWidth The width of the oval indicator.
   * @param heroBannerWidgetOvalHeight The height of the oval indicator.
   * @param heroBannerWidgetOvalTotal The total number of oval indicators.
   * @param heroBannerWidgetOvalSelectedIndex The currently selected index of the oval indicator.
   * @param heroBannerWidgetOvalStrokeWidth The stroke width of the oval indicator.
   * @param heroBannerWidgetOvalSelectedFillsColor The fill color of the selected oval indicator.
   * @param heroBannerWidgetOvalSelectedBordersColor The border color of the selected oval indicator.
   * @param heroBannerWidgetOvalOverLayColor The overlay color of the oval indicator.
   * @param heroBannerWidgetOverLayPositionRight The right position of the overlay button.
   * @param heroBannerWidgetOverLayPositionBottom The bottom position of the overlay button.
   * @param heroBannerWidgetOverLayButtonWidth The width of the overlay button.
   * @param heroBannerWidgetOverLayButtonHeight The height of the overlay button.
   * @param heroBannerWidgetOverlayBtnBorderRadius The border radius of the overlay button.
   * @param heroBannerWidgetOverlayBtnOpacity The opacity of the overlay button.
   * @param heroBannerWidgetOverlayBtnFillsColor The fill color of the overlay button.
   * @param heroBannerWidgetOverlayBtnBorderWidth The border width of the overlay button.
   * @param heroBannerWidgetOverLayButtonMinWidth The minimum width of the overlay button.
   * @param heroBannerWidgetOverLayButtonMaxWidth The maximum width of the overlay button.
   * @param heroBannerWidgetOverlayBtnBorderColor The border color of the overlay button.
   * @param heroBannerWidgetOverlayText The text displayed on the overlay button.
   * @param heroBannerWidgetOverlayTextFontSize The font size of the overlay button text.
   * @param heroBannerWidgetOverlayTextFontColor The font color of the overlay button text.
  */

  const HeroBannerWidget({
    super.key,
    this.heroBannerWidgetHeroBannerWidth = 3060,
    this.heroBannerWidgetHeroBannerHeight = 690,
    this.heroBannerWidgetBackgroundColor = Colors.black,

    this.heroBannerShowNetworkGuide = false,
    this.heroBannerShowNetworkGuideContents = 'assets/compound_images/herobanner/bg_banner_img_network.webp',
    this.heroBannerShowNetworkGuideErrLabel = "Enjoy the device's smart functions by connecting to a network.",
    this.heroBannerShowNetworkGuideBtnTxt = 'Network Settings',
    this.heroBannerShowGeneralTerms = false,
    this.heroBannerShowGeneralTermsContents = 'assets/compound_images/herobanner/bg_banner_img_network.webp',
    this.heroBannerShowGeneralTermsErrLabel = 'Enjoy popular and personalized content by agreeing to the terms and conditions.',
    this.heroBannerShowGeneralTermsBtnTxt = 'User Agreements',
    this.heroBannerShowPromotion = false,
    this.heroBannerShowPromotionContents = 'assets/compound_images/herobanner/bg_banner_img.webp',
    this.heroBannerShowPromotionErrLabel = 'Start a new experience with webOS.',
    this.heroBannerShowPromotionBtnTxt = 'Go to Apps',

    this.heroBannerWidgetErrContentWidth = 1352,
    this.heroBannerWidgetErrBtnWidth = 480,
    this.heroBannerWidgetErrBtnHeight = 84,
    this.heroBannerWidgetErrBtnFocusedColor = const Color(0xffE6E6E6),
    this.heroBannerWidgetErrBtnNotFocusedColor = Colors.transparent,
    this.heroBannerWidgetErrBtnBorderColor = Colors.white,
    this.heroBannerWidgetErrBtnBorderRadius = 24,
    this.heroBannerWidgetErrBtnBorderWidth = 3,
    this.heroBannerWidgetErrContentFontSize = 72,
    this.heroBannerWidgetErrBtnMarginTop = 92,
    this.heroBannerWidgetErrContentFontColor = Colors.white,
    this.heroBannerWidgetErrBtnFocusedFontColor = const Color(0xff4C5059),
    this.heroBannerWidgetErrBtnNotFocusedFontColor = const Color(0xffE6E6E6),
    this.heroBannerWidgetErrBtnFontSize = 42,

    this.heroBannerWidgetAdsContentWidth = 2688,
    this.heroBannerWidgetAdsContentHeight = 690,
    this.heroBannerWidgetAdsContentStartMargin = 186,
    this.heroBannerWidgetHeroBannerContents = 'assets/compound_images/herobanner/image_area.webp',
    this.heroBannerWidgetBorderSize = 12,
    this.heroBannerWidgetBorderColor = Colors.white,
    this.heroBannerWidgetContentPaddingLeft = 186,
    this.heroBannerWidgetContentPaddingRight = 186,

    this.heroBannerWidgetSponsoredText = 'SPONSORED',
    this.heroBannerWidgetSponsorLabelStartMargin = 48,
    this.heroBannerWidgetSponsorLabelPositionBottom = 48,
    this.heroBannerWidgetSponseredTextFontColor = Colors.white,
    this.heroBannerWidgetSponseredTextFontShadowColor = Colors.black,

    this.heroBannerWidgetOvalBottomPadding = 60,
    this.heroBannerWidgetOvalWidth = 24,
    this.heroBannerWidgetOvalHeight = 24,
    this.heroBannerWidgetOvalTotal = 5,
    this.heroBannerWidgetOvalSelectedIndex = 1,
    this.heroBannerWidgetOvalStrokeWidth = 2,
    this.heroBannerWidgetOvalSelectedFillsColor = Colors.white,
    this.heroBannerWidgetOvalSelectedBordersColor = Colors.black,
    this.heroBannerWidgetOvalOverLayColor = const Color(0xff8E8E8E),

    this.heroBannerWidgetOverLayPositionRight = 48,
    this.heroBannerWidgetOverLayPositionBottom = 48,
    this.heroBannerWidgetOverLayButtonWidth = 420,
    this.heroBannerWidgetOverLayButtonHeight = 96,
    this.heroBannerWidgetOverlayBtnBorderRadius = 24,
    this.heroBannerWidgetOverlayBtnOpacity = 0.3,
    this.heroBannerWidgetOverlayBtnFillsColor = Colors.black,
    this.heroBannerWidgetOverlayBtnBorderWidth = 3,
    this.heroBannerWidgetOverLayButtonMinWidth = 420,
    this.heroBannerWidgetOverLayButtonMaxWidth = 846,
    this.heroBannerWidgetOverlayBtnBorderColor = Colors.white,
    this.heroBannerWidgetOverlayText = 'Watch more',
    this.heroBannerWidgetOverlayTextFontSize = 42,
    this.heroBannerWidgetOverlayTextFontColor = const Color(0xFFE6E6E6),

    this.heroBannerWidgetButtonWidth = 126,
    this.heroBannerWidgetButtonHeight = 126,
    this.heroBannerWidgetButtonTopMargin = 282,
    this.heroBannerWidgetButtonLeftMargin = 0,
    this.heroBannerWidgetButtonRightMargin = 0,

    this.heroBannerWidgetLeftArrowFocusedContents = 'assets/compound_images/herobanner/arrow_more_l_f.png',
    this.heroBannerWidgetLeftArrowNotFocusedContents = 'assets/compound_images/herobanner/arrow_more_l_n.png',
    this.heroBannerWidgetRightArrowFocusedContents = 'assets/compound_images/herobanner/arrow_more_r_f.png',
    this.heroBannerWidgetRightArrowNotFocusedContents = 'assets/compound_images/herobanner/arrow_more_r_n.png',
  });

  final double heroBannerWidgetHeroBannerWidth;
  final double heroBannerWidgetHeroBannerHeight;
  final Color heroBannerWidgetBackgroundColor;

  final bool heroBannerShowNetworkGuide;
  final String heroBannerShowNetworkGuideContents;
  final String heroBannerShowNetworkGuideErrLabel;
  final String heroBannerShowNetworkGuideBtnTxt;
  final bool heroBannerShowGeneralTerms;
  final String heroBannerShowGeneralTermsContents;
  final String heroBannerShowGeneralTermsErrLabel;
  final String heroBannerShowGeneralTermsBtnTxt;
  final bool heroBannerShowPromotion;
  final String heroBannerShowPromotionContents;
  final String heroBannerShowPromotionErrLabel;
  final String heroBannerShowPromotionBtnTxt;

  final double heroBannerWidgetErrContentWidth;
  final double heroBannerWidgetErrBtnWidth;
  final double heroBannerWidgetErrBtnHeight;
  final Color heroBannerWidgetErrBtnFocusedColor;
  final Color heroBannerWidgetErrBtnNotFocusedColor;
  final Color heroBannerWidgetErrBtnBorderColor;
  final double heroBannerWidgetErrBtnBorderRadius;
  final double heroBannerWidgetErrBtnBorderWidth;
  final double heroBannerWidgetErrContentFontSize;
  final double heroBannerWidgetErrBtnMarginTop;
  final Color heroBannerWidgetErrContentFontColor;
  final Color heroBannerWidgetErrBtnFocusedFontColor;
  final Color heroBannerWidgetErrBtnNotFocusedFontColor;
  final double heroBannerWidgetErrBtnFontSize;

  final String heroBannerWidgetHeroBannerContents;
  final double heroBannerWidgetBorderSize;
  final Color heroBannerWidgetBorderColor;
  final double heroBannerWidgetAdsContentWidth;
  final double heroBannerWidgetAdsContentHeight;
  final double heroBannerWidgetAdsContentStartMargin;
  final double heroBannerWidgetContentPaddingLeft;
  final double heroBannerWidgetContentPaddingRight;

  final double heroBannerWidgetSponsorLabelStartMargin;
  final double heroBannerWidgetSponsorLabelPositionBottom;
  final String heroBannerWidgetSponsoredText;
  final Color heroBannerWidgetSponseredTextFontColor;
  final Color heroBannerWidgetSponseredTextFontShadowColor;

  final double heroBannerWidgetOvalBottomPadding;
  final double heroBannerWidgetOvalWidth;
  final double heroBannerWidgetOvalHeight;
  final int heroBannerWidgetOvalTotal;
  final int heroBannerWidgetOvalSelectedIndex;
  final double heroBannerWidgetOvalStrokeWidth;
  final Color heroBannerWidgetOvalSelectedFillsColor;
  final Color heroBannerWidgetOvalSelectedBordersColor;
  final Color heroBannerWidgetOvalOverLayColor;

  final double heroBannerWidgetOverLayPositionRight;
  final double heroBannerWidgetOverLayPositionBottom;
  final double heroBannerWidgetOverLayButtonWidth;
  final double heroBannerWidgetOverLayButtonHeight;
  final double heroBannerWidgetOverlayBtnBorderRadius;
  final double heroBannerWidgetOverlayBtnOpacity;
  final Color heroBannerWidgetOverlayBtnFillsColor;
  final double heroBannerWidgetOverlayBtnBorderWidth;
  final double heroBannerWidgetOverLayButtonMinWidth;
  final double heroBannerWidgetOverLayButtonMaxWidth;
  final Color heroBannerWidgetOverlayBtnBorderColor;
  final String heroBannerWidgetOverlayText;
  final double heroBannerWidgetOverlayTextFontSize;
  final Color heroBannerWidgetOverlayTextFontColor;

  final double heroBannerWidgetButtonWidth;
  final double heroBannerWidgetButtonHeight;
  final double heroBannerWidgetButtonTopMargin;
  final double heroBannerWidgetButtonLeftMargin;
  final double heroBannerWidgetButtonRightMargin;

  final String heroBannerWidgetLeftArrowFocusedContents;
  final String heroBannerWidgetLeftArrowNotFocusedContents;
  final String heroBannerWidgetRightArrowFocusedContents;
  final String heroBannerWidgetRightArrowNotFocusedContents;

  @override
  State<HeroBannerWidget> createState() => _HeroBannerWidgetState();
}

class _HeroBannerWidgetState extends State<HeroBannerWidget> with TickerProviderStateMixin
{
  WFocusNode bannerFocusNode = WFocusNode(id: _herroBannerID);

  // demo code for fade transition
  int _currentIndex = 0;
  final List<String> _options = [
    'default',
    'isNetwork',
    'isGeneralTerms',
    'isPromotion',
    'default',
  ];
  // demo code for fade transition

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.heroBannerWidgetOvalSelectedIndex;

    repeatOnce();
  }

  @override
  void dispose() {
    _animationController.dispose();
    bannerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String contents;
    String? overlayText;
    String errLabel = '';
    String errBtnTxt = 'Go to Apps';
    VoidCallback onPressed = () {};

    bool isNetwork = widget.heroBannerShowNetworkGuide;
    bool isGeneralTerms = widget.heroBannerShowGeneralTerms;
    bool isPromotion = widget.heroBannerShowPromotion;

    if (isNetwork) {
      contents = widget.heroBannerShowNetworkGuideContents;
      errLabel = widget.heroBannerShowNetworkGuideErrLabel;
      errBtnTxt = widget.heroBannerShowNetworkGuideBtnTxt;
      onPressed = _onNetworkSetting;
    } else if (isGeneralTerms) {
      contents = widget.heroBannerShowGeneralTermsContents;
      errLabel = widget.heroBannerShowGeneralTermsErrLabel;
      errBtnTxt = widget.heroBannerShowGeneralTermsBtnTxt;
      onPressed = _onUserAgreements;
    } else if (isPromotion) {
      contents = widget.heroBannerShowPromotionContents;
      errLabel = widget.heroBannerShowPromotionErrLabel;
      errBtnTxt = widget.heroBannerShowPromotionBtnTxt;
      onPressed = _onApps;
    } else {
      contents = widget.heroBannerWidgetHeroBannerContents;
      overlayText = widget.heroBannerWidgetOverlayText;
    }

    // demo code for fade transition
    if (_currentIndex == 0) {
      contents = widget.heroBannerWidgetHeroBannerContents;
      overlayText = widget.heroBannerWidgetOverlayText;
    } else if (_currentIndex == 1) {
      isNetwork = true;
      isGeneralTerms = false;
      isPromotion = false;
      contents = widget.heroBannerShowNetworkGuideContents;
      errLabel = widget.heroBannerShowNetworkGuideErrLabel;
      errBtnTxt = widget.heroBannerShowNetworkGuideBtnTxt;
      onPressed = _onNetworkSetting;
      overlayText = null;
    } else if (_currentIndex == 2) {
      isNetwork = false;
      isGeneralTerms = false;
      isPromotion = true;
      contents = widget.heroBannerShowPromotionContents;
      errLabel = widget.heroBannerShowPromotionErrLabel;
      errBtnTxt = widget.heroBannerShowPromotionBtnTxt;
      onPressed = _onApps;
      overlayText = null;
    } else if (_currentIndex == 3) {
      isNetwork = false;
      isGeneralTerms = true;
      isPromotion = false;
      contents = widget.heroBannerShowGeneralTermsContents;
      errLabel = widget.heroBannerShowGeneralTermsErrLabel;
      errBtnTxt = widget.heroBannerShowGeneralTermsBtnTxt;
      onPressed = _onUserAgreements;
      overlayText = null;
    } else if (_currentIndex == 4) {
      contents = widget.heroBannerWidgetHeroBannerContents;
      overlayText = widget.heroBannerWidgetOverlayText;
    } else {
      contents = widget.heroBannerWidgetHeroBannerContents;
      overlayText = widget.heroBannerWidgetOverlayText;
    }
    // demo code for fade transition

    return Container(
            width: widget.heroBannerWidgetHeroBannerWidth,
            height: widget.heroBannerWidgetHeroBannerHeight,
            color: widget.heroBannerWidgetBackgroundColor,
            child: Stack(
              children: [
                Positioned(
                  left: widget.heroBannerWidgetAdsContentStartMargin,
                  child: FadeTransition(
                    opacity: _animation,
                    child: WButton(
                      focusNode: bannerFocusNode,
                      size: Size(widget.heroBannerWidgetAdsContentWidth, widget.heroBannerWidgetAdsContentHeight),
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          width: widget.heroBannerWidgetBorderSize,
                          color: Colors.transparent,
                          strokeAlign: BorderSide.strokeAlignOutside
                        ),
                      ),
                      decorationHovered: BoxDecoration(
                        border: Border.all(
                          width: widget.heroBannerWidgetBorderSize,
                          color: widget.heroBannerWidgetBorderColor,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: (color, focus, isHovered) => Image.asset(
                          contents,
                          color: null,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: widget.heroBannerWidgetSponsorLabelStartMargin + widget.heroBannerWidgetContentPaddingLeft,
                  bottom: widget.heroBannerWidgetSponsorLabelPositionBottom,
                  child: SponsorLabelWidget(
                    sponseredText: widget.heroBannerWidgetSponsoredText,
                    key: UniqueKey(),
                    sponseredTextFontColor: widget.heroBannerWidgetSponseredTextFontColor,
                    sponseredTextFontShadowColor: widget.heroBannerWidgetSponseredTextFontShadowColor,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: widget.heroBannerWidgetOvalBottomPadding),
                    child: IndicatorWidget(
                      width: widget.heroBannerWidgetOvalWidth,
                      height: widget.heroBannerWidgetOvalHeight,
                      total: widget.heroBannerWidgetOvalTotal,
                      selectedIndex: _currentIndex,
                      strokeWidth: widget.heroBannerWidgetOvalStrokeWidth,
                      ovalSelectedBordersColor: widget.heroBannerWidgetOvalSelectedFillsColor,
                      ovalSelectedFillsColor: widget.heroBannerWidgetOvalSelectedBordersColor,
                      ovalOverLayColor: widget.heroBannerWidgetOvalOverLayColor,
                    ),
                  ),
                ),

                if(isNetwork | isGeneralTerms | isPromotion)
                  Positioned(
                    right: widget.heroBannerWidgetOverLayPositionRight + widget.heroBannerWidgetContentPaddingLeft,
                    child: SizedBox(
                      width: widget.heroBannerWidgetErrContentWidth,
                      height: widget.heroBannerWidgetHeroBannerHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            errLabel,
                            maxLines: 3,
                            textAlign: TextAlign.right,
                            softWrap: true,
                            style: WFont.instance.regular.copyWith(
                                fontSize: widget.heroBannerWidgetErrContentFontSize,
                                color: widget.heroBannerWidgetErrContentFontColor,
                                ),
                          ),
                          SizedBox(
                            height: widget.heroBannerWidgetErrBtnMarginTop,
                          ),

                          if (errBtnTxt.isNotEmpty)
                            Semantics(
                              excludeSemantics: true,
                              label: errBtnTxt,
                              child: WButton(
                                size: Size(widget.heroBannerWidgetErrBtnWidth, widget.heroBannerWidgetErrBtnHeight),
                                decoration: BoxDecoration(
                                  color: widget.heroBannerWidgetErrBtnNotFocusedColor,
                                  borderRadius: BorderRadius.circular(widget.heroBannerWidgetErrBtnBorderRadius),
                                  border: Border.all(
                                    width: widget.heroBannerWidgetErrBtnBorderWidth,
                                    color: widget.heroBannerWidgetErrBtnBorderColor.withOpacity(0.5),
                                  ),
                                ),
                                decorationHovered: BoxDecoration(
                                    color: widget.heroBannerWidgetErrBtnFocusedColor,
                                    borderRadius: BorderRadius.circular(widget.heroBannerWidgetErrBtnBorderRadius),
                                    border: Border.all(
                                      width: widget.heroBannerWidgetErrBtnBorderWidth,
                                      color: widget.heroBannerWidgetErrBtnFocusedColor,
                                    ),
                                ),
                                onPressed: onPressed,
                                child: (color, isFocus, isHovered) =>
                                  Text(
                                    errBtnTxt,
                                    style: WFont.instance.semiBold.copyWith(
                                      fontSize: widget.heroBannerWidgetErrBtnFontSize,
                                      color: isHovered ? widget.heroBannerWidgetErrBtnFocusedFontColor : widget.heroBannerWidgetErrBtnNotFocusedFontColor,
                                    ),
                                  ),
                              ),
                            ),
                          ],
                      ),
                    ),
                  ),

                if(overlayText != null)
                  Positioned(
                    right: widget.heroBannerWidgetOverLayPositionRight + widget.heroBannerWidgetContentPaddingLeft,
                    bottom: widget.heroBannerWidgetOverLayPositionBottom,
                    child: Container(
                      width: widget.heroBannerWidgetOverLayButtonWidth,
                      height: widget.heroBannerWidgetOverLayButtonHeight,
                      decoration: BoxDecoration(
                        color: widget.heroBannerWidgetOverlayBtnFillsColor.withOpacity(widget.heroBannerWidgetOverlayBtnOpacity),
                        borderRadius: BorderRadius.all(
                          Radius.circular(widget.heroBannerWidgetOverlayBtnBorderRadius)
                        ),
                        border: Border.all(
                          width: widget.heroBannerWidgetOverlayBtnBorderWidth,
                          color: widget.heroBannerWidgetOverlayBtnBorderColor,
                        ),
                      ),
                      constraints: BoxConstraints(
                        maxWidth: widget.heroBannerWidgetOverLayButtonMaxWidth,
                        minWidth: widget.heroBannerWidgetOverLayButtonMinWidth,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.heroBannerWidgetOverlayBtnBorderRadius
                        ),
                        child: WMarquee(
                          text: overlayText,
                          style: WFont.instance.semiBold.copyWith(
                            fontSize: widget.heroBannerWidgetOverlayTextFontSize,
                            color: widget.heroBannerWidgetOverlayTextFontColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: widget.heroBannerWidgetButtonLeftMargin,
                    top: widget.heroBannerWidgetButtonTopMargin,
                    child: WButton(
                      focusNode: bannerFocusNode,
                      size: Size(widget.heroBannerWidgetButtonWidth, widget.heroBannerWidgetButtonHeight),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      onPressed: () {
                        onClickPrevious();
                      },
                      child: (color, isFocus, isHovered) => Image.asset(
                          isFocus? widget.heroBannerWidgetLeftArrowFocusedContents : widget.heroBannerWidgetLeftArrowNotFocusedContents,
                          color: null,
                      ),
                    ),
                  ),
                  Positioned(
                    right: widget.heroBannerWidgetButtonRightMargin,
                    top: widget.heroBannerWidgetButtonTopMargin,
                    child: WButton(
                      focusNode: bannerFocusNode,
                      size: Size(widget.heroBannerWidgetButtonWidth, widget.heroBannerWidgetButtonHeight),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                    ),
                    onPressed: () {
                      onClickNext();
                    },
                    child: (color, isFocus, isHovered) => Image.asset(
                      isFocus? widget.heroBannerWidgetRightArrowFocusedContents : widget.heroBannerWidgetRightArrowNotFocusedContents,
                      color: null,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  void onClickPrevious() {
    debugPrint('onClickPrevious');
    setState(() {
      _currentIndex = (_currentIndex - 1) % _options.length;
      repeatOnce();
    });
  }

  void onClickNext() {
    debugPrint('onClickNext');
    setState(() {
      _currentIndex = (_currentIndex + 1 + _options.length) % _options.length;
      repeatOnce();
    });
  }

  void _onNetworkSetting() {
    //to do
    debugPrint('_onNetworkSetting');
  }

  void _onUserAgreements() {
    //to do
    debugPrint('_onUserAgreements');
  }

  void _onApps() {
    //to do
    debugPrint('_onApps');
  }

  Future<void> repeatOnce() async {
    _animationController.reset();
    await _animationController.forward();
  }
}