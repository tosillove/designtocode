// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import '/mock/mock_compound_content.dart';
import '/providers/shelves_content_provider.dart';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class Discovery extends StatelessWidget {
  const Discovery({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            width: 3840.0,
            height: 3800.0,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.only(
              left: 0.0,
              top: 100.0,
              right: 0.0,
              bottom: 100.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF000000),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeroBannerWidget(
                      heroBannerWidgetHeroBannerWidth: 3060.0,
                      heroBannerWidgetHeroBannerHeight: 710.0,
                      heroBannerWidgetBackgroundColor: Color(0xFF000000),
                      heroBannerShowNetworkGuide: false,
                      heroBannerShowNetworkGuideContents:
                          '''assets/compound_images/herobanner/bg_banner_img_network.webp''',
                      heroBannerShowNetworkGuideErrLabel:
                          '''Enjoy the device's smart functions by connecting to a network.''',
                      heroBannerShowNetworkGuideBtnTxt: '''Network Settings''',
                      heroBannerShowGeneralTerms: false,
                      heroBannerShowGeneralTermsContents:
                          '''assets/compound_images/herobanner/bg_banner_img_network.webp''',
                      heroBannerShowGeneralTermsErrLabel: '''''',
                      heroBannerShowGeneralTermsBtnTxt: '''User Agreements''',
                      heroBannerShowPromotion: false,
                      heroBannerShowPromotionContents: '''assets/compound_images/herobanner/bg_banner_img.webp''',
                      heroBannerShowPromotionErrLabel: '''Start a new experience with webOS.''',
                      heroBannerShowPromotionBtnTxt: '''Go to Apps''',
                      heroBannerWidgetErrContentWidth: 1352.0,
                      heroBannerWidgetErrBtnWidth: 480.0,
                      heroBannerWidgetErrBtnHeight: 84.0,
                      heroBannerWidgetErrBtnFocusedColor: Color(0xFFE6E6E6),
                      heroBannerWidgetErrBtnNotFocusedColor: Color(0xFF4C5059),
                      heroBannerWidgetErrBtnBorderColor: Color(0xFFFFFFFF),
                      heroBannerWidgetErrBtnBorderRadius: 24.0,
                      heroBannerWidgetErrBtnBorderWidth: 3.0,
                      heroBannerWidgetErrContentFontSize: 72.0,
                      heroBannerWidgetErrBtnMarginTop: 92.0,
                      heroBannerWidgetErrContentFontColor: Color(0xFFFFFFFF),
                      heroBannerWidgetErrBtnFocusedFontColor: Color(0xFF4C5059),
                      heroBannerWidgetErrBtnNotFocusedFontColor: Color(0xFFE6E6E6),
                      heroBannerWidgetErrBtnFontSize: 42.0,
                      heroBannerWidgetAdsContentWidth: 2688.0,
                      heroBannerWidgetAdsContentHeight: 690.0,
                      heroBannerWidgetAdsContentStartMargin: 186.0,
                      heroBannerWidgetHeroBannerContents: '''assets/compound_images/herobanner/image_area.webp''',
                      heroBannerWidgetBorderSize: 12.0,
                      heroBannerWidgetBorderColor: Color(0xFFFFFFFF),
                      heroBannerWidgetContentPaddingLeft: 186.0,
                      heroBannerWidgetContentPaddingRight: 186.0,
                      heroBannerWidgetSponsoredText: '''SPONSORED''',
                      heroBannerWidgetSponsorLabelStartMargin: 48.0,
                      heroBannerWidgetSponsorLabelPositionBottom: 48.0,
                      heroBannerWidgetSponseredTextFontColor: Color(0xFFFFFFFF),
                      heroBannerWidgetSponseredTextFontShadowColor: Color(0xFF000000),
                      heroBannerWidgetOvalBottomPadding: 60.0,
                      heroBannerWidgetOvalWidth: 24.0,
                      heroBannerWidgetOvalHeight: 24.0,
                      heroBannerWidgetOvalTotal: 5,
                      heroBannerWidgetOvalSelectedIndex: 1,
                      heroBannerWidgetOvalStrokeWidth: 2.0,
                      heroBannerWidgetOvalSelectedFillsColor: Color(0xFFFFFFFF),
                      heroBannerWidgetOvalSelectedBordersColor: Color(0xFF000000),
                      heroBannerWidgetOvalOverLayColor: Color(0xFF8E8E8E),
                      heroBannerWidgetOverLayPositionRight: 48.0,
                      heroBannerWidgetOverLayPositionBottom: 48.0,
                      heroBannerWidgetOverLayButtonWidth: 420.0,
                      heroBannerWidgetOverLayButtonHeight: 96.0,
                      heroBannerWidgetOverlayBtnBorderRadius: 24.0,
                      heroBannerWidgetOverlayBtnOpacity: 0.3,
                      heroBannerWidgetOverlayBtnFillsColor: Color(0xFF000000),
                      heroBannerWidgetOverlayBtnBorderWidth: 3.0,
                      heroBannerWidgetOverLayButtonMinWidth: 420.0,
                      heroBannerWidgetOverLayButtonMaxWidth: 846.0,
                      heroBannerWidgetOverlayBtnBorderColor: Color(0xFFFFFFFF),
                      heroBannerWidgetOverlayText: '''Watch more''',
                      heroBannerWidgetOverlayTextFontSize: 42.0,
                      heroBannerWidgetOverlayTextFontColor: Color(0xFFE6E6E6),
                      heroBannerWidgetButtonWidth: 126.0,
                      heroBannerWidgetButtonHeight: 126.0,
                      heroBannerWidgetLeftArrowFocusedContents:
                          '''assets/compound_images/herobanner/arrow_more_l_f.png''',
                      heroBannerWidgetLeftArrowNotFocusedContents:
                          '''assets/compound_images/herobanner/arrow_more_l_n.png''',
                      heroBannerWidgetRightArrowFocusedContents:
                          '''assets/compound_images/herobanner/arrow_more_r_f.png''',
                      heroBannerWidgetRightArrowNotFocusedContents:
                          '''assets/compound_images/herobanner/arrow_more_r_n.png'''),
                  Container(
                    height: 50.0,
                  ),
                  ...ShelvesContentProvider.children
                      .map((e) => Container(
                          alignment: Alignment.topLeft,
                          width: 2688.0,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
                          child: e.value))
                      .toList(),
                  Container(
                    height: 50.0,
                  ),
                  Button(
                    autoFocus: false,
                    backgroundOpacity: ButtonBackgroundOpacity.opaque,
                    buttonColor: Color(0xFF7D848C),
                    customIconSize: 60.0,
                    customSize: null,
                    disabled: false,
                    enableAnimation: true,
                    enableVoiceControl: false,
                    focusOnHover: false,
                    groupLabel: '''groupLabel''',
                    icon: null,
                    iconFlip: IconFlip.auto,
                    iconPosition: IconPosition.before,
                    id: '''''',
                    interactionTextStyle: const TextStyle(
                        fontFamily: null,
                        fontSize: 60.0,
                        height: 1.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF)),
                    minWidth: true,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/x_shelves_reorderable_page');
                    },
                    selected: false,
                    semanticsLabel: '''semanticsLabel''',
                    semanticButton: false,
                    size: ButtonSize.small,
                    text: '''Reorder''',
                    textStyle: const TextStyle(
                        fontFamily: null,
                        fontSize: 60.0,
                        height: 1.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF)),
                    tooltipType: WTooltipType.balloon,
                  )
                ])));
  }
}
