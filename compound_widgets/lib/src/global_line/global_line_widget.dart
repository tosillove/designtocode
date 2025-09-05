import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:plover/plover.dart';
import 'package:compound_widgets/src/global_line/account_label_widget.dart';
import 'package:compound_widgets/src/global_line/noti_counter_widget.dart';

const String accountButtonKey = 'account_button';

const List<Map<String, dynamic>> globalLineList = [
  {'type': 'tvGuide', 'label': "Go to 'Guide'", 'iconUrl': 'ic_tvguide_n.png', 'showButton': true, 'onTap': null},
  {'type': 'search', 'label': 'Go to Search', 'iconUrl': 'ic_search_n.png', 'showButton': true, 'onTap': null},
  {'type': 'settings', 'label': 'Go to Settings', 'iconUrl': 'ic_setting_n.png', 'showButton': true, 'onTap': null}
];

/*
 * A widget that displays a global line with various interactive items such as TV Guide, Search, and Settings.
 * It also includes a notification counter and an account label.
 */
class GlobalLineWidget extends StatefulWidget {
   /*
   * Creates a GlobalLineWidget.
   *
   * @param leftMargin The left margin of the widget. Defaults to 0.
   * @param rightMargin The right margin of the widget. Defaults to 0.
   * @param childMargin The margin between child items. Defaults to 48.
   * @param itemWidth The width of each item. Defaults to 126.0.
   * @param itemHeight The height of each item. Defaults to 126.0.
   * @param buttonColor The color of the buttons. Defaults to Color(0xffE6E6E6).
   * @param borderSize The size of the border. Defaults to 0.
   * @param borderColor The color of the border. Defaults to Colors.transparent.
   * @param hoveredButtonColor The color of the button when hovered. Defaults to Color(0xff4C5059).
   * @param hoveredBorderSize The size of the border when hovered. Defaults to 0.
   * @param hoveredBorderColor The color of the border when hovered. Defaults to Colors.transparent.
   * @param backgroundColor The background color of the widget. Defaults to Colors.transparent.
   * @param hoveredBackgroundColor The background color of the widget when hovered. Defaults to Color(0xffE6E6E6).
   * @param items The list of items to display in the global line. Defaults to globalLineList.
   * @param globalLineHeight The height of the global line. Defaults to 126.
   * @param globalLineWidth The width of the global line. Defaults to 822.
   * @param globalLineHorizontal Whether the global line is horizontal. Defaults to true.
   * @param globalLineBottomMargin The bottom margin of the global line if vertical. Defaults to 10.0.
   * @param imageFolderPath The folder path for the images. Defaults to 'assets/compound_images/4k/'.
   *
   * Notification parameters:
   * @param notiCount The count of notifications. Defaults to 1.
   * @param notiCounterIcon The icon for the notification counter. Defaults to 'ic_notice_n.png'.
   * @param notiCounterBadgeBackgroundColor The background color of the notification badge. Defaults to Color(0xffff5454).
   * @param notiCounterWidgetBadgeCurWidth The current width of the notification badge. Defaults to 42.
   * @param notiCounterWidgetBadgeCurWidthBigSize The big size width of the notification badge. Defaults to 66.
   * @param notiCounterWidgetBadgeCurLeftPos The left position of the notification badge. Defaults to 63.
   * @param notiCounterWidgetBadgeCurLeftPosBigSize The big size left position of the notification badge. Defaults to 57.
   * @param notiCounterWidgetBadgeTopPosition The top position of the notification badge. Defaults to 9.
   * @param notiCounterWidgetBadgeHeight The height of the notification badge. Defaults to 42.
   * @param notiCounterWidgetBadgeBorderRadius The border radius of the notification badge. Defaults to 21.
   * @param notiCounterWidgetBadgeFontSize The font size of the notification badge. Defaults to 30.
   * @param notiCounterWidgetBadgeFontColor The font color of the notification badge. Defaults to Color(0xffe6e6e6).
   * @param notiCounterWidgetBadgeFontWeight The font weight of the notification badge. Defaults to FontWeight.w600.
   * @param notiCounterIconOnTap The function to call when the notification icon is tapped.
   *
   * Account label parameters:
   * @param loginId The login ID of the user. Defaults to an empty string.
   * @param accountLabelWidgetAccountSize The size of the account label widget. Defaults to 96.
   * @param accountLabelWidgetAccountFontSize The font size of the account label widget. Defaults to 60.
   * @param accountLabelWidgetColor The color of the account label widget. Defaults to Color(0xffbf4658).
   * @param noSignedIcon The icon to display when not signed in. Defaults to 'ic_signin_n.png'.
   * @param noSignedaccountLabelOnTap The function to call when the account label is tapped and the user is not signed in.
   * @param signedAccountLabelOnTap The function to call when the account label is tapped and the user is signed in.
   */
  const GlobalLineWidget({
    super.key,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.childMargin = 48,
    this.itemWidth = 126.0,
    this.itemHeight = 126.0,
    this.buttonColor = const Color(0xffE6E6E6),
    this.borderSize = 0,
    this.borderColor = Colors.transparent,
    this.hoveredButtonColor = const Color(0xff4C5059),
    this.hoveredBorderSize = 0,
    this.hoveredBorderColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    this.hoveredBackgroundColor = const Color(0xffE6E6E6),
    this.items = globalLineList,
    this.globalLineHeight = 126,
    this.globalLineWidth = 822,
    this.globalLineHorizontal = true,
    this.globalLineBottomMargin = 10.0, //if vertical
    this.imageFolderPath = 'assets/compound_images/4k/',

    //Notification
    this.notiCount = 1,
    this.notiCounterIcon = 'ic_notice_n.png',
    this.notiCounterBadgeBackgroundColor = const Color(0xffff5454),
    this.notiCounterWidgetBadgeCurWidth = 42,
    this.notiCounterWidgetBadgeCurWidthBigSize = 66,
    this.notiCounterWidgetBadgeCurLeftPos = 63,
    this.notiCounterWidgetBadgeCurLeftPosBigSize = 57,
    this.notiCounterWidgetBadgeTopPosition = 9,
    this.notiCounterWidgetBadgeHeight = 42,
    this.notiCounterWidgetBadgeBorderRadius = 21,
    this.notiCounterWidgetBadgeFontSize = 30,
    this.notiCounterWidgetBadgeFontColor = const Color(0xffe6e6e6),
    this.notiCounterWidgetBadgeFontWeight = FontWeight.w600,
    this.notiCounterIconOnTap,
    this.notiCounterIconSemmanticLabel = '',

    //Account label
    this.loginId = '',
    this.accountLabelWidgetAccountSize = 96,
    this.accountLabelWidgetAccountFontSize = 60,
    this.accountLabelWidgetColor = const Color(0xffbf4658),
    this.noSignedIcon = 'ic_signin_n.png',
    this.noSignedaccountLabelOnTap,
    this.signedAccountLabelOnTap,
    this.accountLabelSemanticLabelSigned = '',
    this.accountLabelSemanticLabelNoSigned = ''});

  final double leftMargin;
  final double rightMargin;
  final double childMargin;
  final double itemWidth;
  final double itemHeight;
  final Color buttonColor;
  final double borderSize;
  final Color borderColor;
  final Color hoveredButtonColor;
  final double hoveredBorderSize;
  final Color hoveredBorderColor;
  final Color backgroundColor;
  final Color hoveredBackgroundColor;
  final List<Map<String, dynamic>> items;
  final double globalLineHeight;
  final double globalLineWidth;
  final bool globalLineHorizontal;
  final double globalLineBottomMargin;
  final String imageFolderPath;

  //Notification icon
  final int notiCount;
  final String notiCounterIcon;
  final double notiCounterWidgetBadgeCurWidth;
  final double notiCounterWidgetBadgeCurWidthBigSize;
  final double notiCounterWidgetBadgeCurLeftPos;
  final double notiCounterWidgetBadgeCurLeftPosBigSize;
  final double notiCounterWidgetBadgeTopPosition;
  final double notiCounterWidgetBadgeHeight;
  final Color notiCounterBadgeBackgroundColor;
  final double notiCounterWidgetBadgeBorderRadius;
  final double notiCounterWidgetBadgeFontSize;
  final Color notiCounterWidgetBadgeFontColor;
  final FontWeight notiCounterWidgetBadgeFontWeight;
  final void Function()? notiCounterIconOnTap;
  final String notiCounterIconSemmanticLabel;

  //Account label
  final String loginId;
  final double accountLabelWidgetAccountSize;
  final double accountLabelWidgetAccountFontSize;
  final Color accountLabelWidgetColor;
  final String noSignedIcon;
  final void Function()? noSignedaccountLabelOnTap;
  final void Function()? signedAccountLabelOnTap;
  final String accountLabelSemanticLabelSigned;
  final String accountLabelSemanticLabelNoSigned;

  @override
  State<GlobalLineWidget> createState() => _GlobalLineWidgetState();
}

class _GlobalLineWidgetState extends State<GlobalLineWidget> {
  @override
  Widget build(BuildContext context) {
    String countryGroup = 'EU';

    List<Widget> childrenList = [
      ...() {
        return widget.items.mapIndexed(
          (index, entry) {
            return _createButton(
              entry,
              ((countryGroup == 'EU' && entry['showButton'] == true) ||
                  (countryGroup != 'EU' && (entry['type']) != 'tvGuide') && entry['showButton'] == true),
              index == 0,
              index == widget.items.length - 1,
              matchTextDirection: entry['type'] == 'tvGuide',
              id: entry['type'] is String ? entry['type']! as String : null,
            );
          },
        );
      }(),
      Container(
        margin: EdgeInsets.only(
          left: widget.globalLineHorizontal? widget.childMargin : 0,
          bottom: widget.globalLineHorizontal ? 0 : widget.globalLineBottomMargin,
        ),
        width: widget.itemWidth,
        height: widget.itemHeight,
        child: Stack(
          children: [
            _btn(
              defaultImage: widget.notiCounterIcon,
              label: widget.notiCounterIconSemmanticLabel,
              onTap: widget.notiCounterIconOnTap,
            ),
            NotiCounterWidget(
                notiCount: widget.notiCount,
                notiCounterWidgetBadgeCurWidth: widget.notiCounterWidgetBadgeCurWidth,
                notiCounterWidgetBadgeCurWidthBigSize: widget.notiCounterWidgetBadgeCurWidthBigSize,
                notiCounterWidgetBadgeCurLeftPos: widget.notiCounterWidgetBadgeCurLeftPos,
                notiCounterWidgetBadgeCurLeftPosBigSize: widget.notiCounterWidgetBadgeCurLeftPosBigSize,
                notiCounterWidgetBadgeTopPosition: widget.notiCounterWidgetBadgeTopPosition,
                notiCounterWidgetBadgeHeight: widget.notiCounterWidgetBadgeHeight,
                notiCounterWidgetBadgeBorderRadius: widget.notiCounterWidgetBadgeBorderRadius,
                notiCounterWidgetBadgeFontSize: widget.notiCounterWidgetBadgeFontSize,
                notiCounterBadgeBackgroundColor: widget.notiCounterBadgeBackgroundColor,
                notiCounterWidgetBadgeFontColor: widget.notiCounterWidgetBadgeFontColor)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          left: widget.globalLineHorizontal? widget.childMargin : 0,
          bottom: widget.globalLineHorizontal ? 0 : widget.globalLineBottomMargin,
        ),
        width: widget.itemWidth,
        height: widget.itemHeight,
        child: AccountLabel(
          itemSize: widget.itemWidth,
          notSignedInWidget: _btn(defaultImage: widget.noSignedIcon, label: widget.accountLabelSemanticLabelNoSigned, onTap: widget.noSignedaccountLabelOnTap),
          loginId: widget.loginId,
          accountLabelWidgetAccountSize: widget.accountLabelWidgetAccountSize,
          onClickOnAccountImage: widget.signedAccountLabelOnTap,
          accountLabelWidgetAccountFontSize: widget.accountLabelWidgetAccountFontSize,
          accountLabelWidgetColor: widget.accountLabelWidgetColor,
          accountLabelBackgroundWidgetColor: widget.backgroundColor,
          hoveredAccountLabelBackgroundWidgetColor: widget.hoveredBackgroundColor,
          semanticLabel: widget.accountLabelSemanticLabelSigned,
        ),
      ),
    ];
    return WFocusableScope(
      focusOnHover: false,
      focusOnTap: false,
      tapByEnter: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.leftMargin,
          right: widget.rightMargin,
        ),
        child: SizedBox(
          height: widget.globalLineHorizontal ? widget.globalLineHeight : widget.globalLineWidth,
          width: widget.globalLineHorizontal ? widget.globalLineWidth : widget.globalLineHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.globalLineHorizontal) Row(children: childrenList) else Column(children: childrenList),
            ],
          ),
        ),
      ),
    );
  }

  /*
   * Creates a button widget with the specified parameters.
   *
   * @param label The label for the button.
   * @param defaultImage The default image for the button.
   * @param onTap The function to call when the button is tapped.
   * @param matchTextDirection Whether to match the text direction. Defaults to false.
   * @param focusNode The focus node for the button.
   * @return A button widget.
   */
  Widget _btn({
    required String label,
    required String defaultImage,
    required Function()? onTap,
    bool matchTextDirection = false,
    WFocusNode? focusNode,
  }) {
    /*
     * Gets the image path based on whether the button is hovered.
     *
     * @param isHovered Whether the button is hovered.
     * @param defaultImage The default image for the button.
     * @return The image path.
     */
    String getPath(bool isHovered, String defaultImage) {
      if (isHovered) {
        var names = defaultImage.split('.');
        defaultImage = '${names[0].substring(0, names[0].length - 1)}f.${names[1]}';
      }
      return defaultImage;
    }

    return WButton(
      size: Size(widget.itemWidth, widget.itemHeight),
      focusNode: focusNode,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(width: widget.borderSize, color: widget.borderColor),
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      decorationHovered: BoxDecoration(
        border: Border.all(width: widget.hoveredBorderSize, color: widget.hoveredBorderColor),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.3),
            blurRadius: 24,
            spreadRadius: 0.0,
            offset: const Offset(0, 40),
          )
        ],
        color: widget.hoveredBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: (color, isHovered, isFocus) => Image.asset('${widget.imageFolderPath}${getPath(isHovered, defaultImage)}',
          fit: BoxFit.fitHeight, color: (isHovered ? widget.hoveredButtonColor : widget.buttonColor)),
      semanticButtonLabel: label,
      onPressed: onTap,
    );
  }

  /*
   * Creates a button widget based on the provided entry and parameters.
   *
   * @param entry The entry containing the button details.
   * @param showTvGuideButton Whether to show the TV Guide button.
   * @param isFirstBtn Whether the button is the first button.
   * @param isLastBtn Whether the button is the last button.
   * @param matchTextDirection Whether to match the text direction. Defaults to false.
   * @param id The ID of the button.
   * @return A button widget.
   */
  Widget _createButton(
    Map<String, dynamic> entry,
    //String imageFolderPath,
    bool showTvGuideButton,
    bool isFirstBtn,
    bool isLastBtn, {
    bool matchTextDirection = false,
    String? id,
  }) {
    if (!showTvGuideButton) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: widget.globalLineHorizontal
          ? !isFirstBtn
              ? EdgeInsets.only(left: widget.childMargin)
              : null
          : !isLastBtn
              ? const EdgeInsets.only(bottom: 10)
              : null,
      width: widget.itemWidth,
      height: widget.itemHeight,
      child: _btn(
        matchTextDirection: matchTextDirection,
        defaultImage: entry['iconUrl'],
        label: entry['label'],
        onTap: entry['onTap'],
      ),
    );
  }
}
