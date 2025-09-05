import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * A widget that displays an account label. If the user is not signed in, it displays a provided widget.
 * If the user is signed in, it displays the user's initial inside a styled circle.
 */
class AccountLabel extends StatelessWidget {
  /*
   * Creates an AccountLabel widget.
   *
   * @param itemSize The size of the widget.
   * @param notSignedInWidget The widget to display if the user is not signed in.
   * @param onClickOnAccountImage The function to call when the account image is clicked.
   * @param loginId The login ID of the user. Defaults to an empty string.
   * @param accountLabelWidgetAccountSize The size of the account label widget. Defaults to 96.
   * @param accountLabelWidgetAccountFontSize The font size of the account label widget. Defaults to 60.
   * @param accountLabelWidgetColor The color of the account label widget. Defaults to Color(0xffBF4658).
   * @param accountLabelWidgetFontColor The font color of the account label widget. Defaults to Color(0xffE6E6E6).
   * @param accountLabelWidgetFontWeight The font weight of the account label widget. Defaults to FontWeight.w600.
   * @param accountLabelBackgroundWidgetColor The background color of the account label widget. Defaults to Colors.transparent.
   * @param hoveredAccountLabelBackgroundWidgetColor The background color of the account label widget when hovered. Defaults to Color(0xffE6E6E6).
   */
  const AccountLabel(
      {required this.itemSize,
      required this.notSignedInWidget,
      this.onClickOnAccountImage,
      this.loginId = '',
      this.accountLabelWidgetAccountSize = 96,
      this.accountLabelWidgetAccountFontSize = 60,
      this.accountLabelWidgetColor = const Color(0xffBF4658),
      this.accountLabelWidgetFontColor = const Color(0xffE6E6E6),
      this.accountLabelWidgetFontWeight = FontWeight.w600,
      this.accountLabelBackgroundWidgetColor = Colors.transparent,
      this.hoveredAccountLabelBackgroundWidgetColor = const Color(0xffE6E6E6),
      this.semanticLabel = '',
      super.key});

  final double itemSize;
  final Widget notSignedInWidget;
  final Function? onClickOnAccountImage;
  final String loginId;
  final double accountLabelWidgetAccountSize;
  final double accountLabelWidgetAccountFontSize;
  final Color accountLabelWidgetColor;
  final Color accountLabelWidgetFontColor;
  final FontWeight accountLabelWidgetFontWeight;
  final Color accountLabelBackgroundWidgetColor;
  final Color hoveredAccountLabelBackgroundWidgetColor;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    if (loginId == '') {
      return notSignedInWidget;
    } else {
      return Semantics(
          label: semanticLabel,
          child: SizedBox(
            width: itemSize,
            height: itemSize,
            child: Center(
              child: WButton(
                size: Size(
                  itemSize,
                  itemSize,
                ),
                animation: true,
                animationDuration: 300,
                animationScale: 1.05,
                animationCurve: Curves.bounceInOut,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12), color: accountLabelBackgroundWidgetColor),
                decorationHovered: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: hoveredAccountLabelBackgroundWidgetColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.3),
                      blurRadius: 24,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 40),
                    )
                  ],
                ),
                onPressed: () {
                  onClickOnAccountImage?.call();
                },
                child: (color, isHovered, focused) => Container(
                  width: accountLabelWidgetAccountSize,
                  height: accountLabelWidgetAccountSize,
                  decoration: BoxDecoration(
                    color: accountLabelWidgetColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      loginId != '' ? loginId[0] : '',
                      textAlign: TextAlign.center,
                      style: WFont.instance.semiBold.copyWith(
                        fontFamily: WFont.defaultFont().first,
                        fontFamilyFallback: WFont.defaultFont(),
                        fontWeight: accountLabelWidgetFontWeight,
                        fontSize: accountLabelWidgetAccountFontSize,
                        color: accountLabelWidgetFontColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
    }
  }
}
