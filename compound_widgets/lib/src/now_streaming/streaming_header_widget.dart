import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plover/plover.dart';
/*
 * A widget that displays a streaming header with customizable properties.
 * This widget is designed to show a header with a title and various styling options.
 */
class StreamingHeaderWidget extends ConsumerWidget {
  /*
   * Creates a StreamingHeaderWidget
   *
   * @param title The title text to be displayed.
   * @param height The height of the header.
   * @param paddingLeft The left padding of the title.
   * @param paddingTitleBottom The bottom padding of the title.
   * @param paddingTitleTop The top padding of the title.
   * @param fontSize The font size of the title.
   * @param fontColor The color of the title text.
   * @param fontOpacity The opacity of the title text color.
   * @param fontWeight The font weight of the title text.
   * @param fontStyle The font style of the title text.
   * @param labelSemantic The semantic label for the title.
   * @param isRtl Indicates whether the text direction is right-to-left.
   * @param animation Indicates whether the title should be animated.
   * @param shelfTitleAnimOffset The offset for the title animation.
   */
  const StreamingHeaderWidget({
    super.key,
    this.title = '',
    this.height = 63,
    this.paddingLeft = 30,
    this.paddingTitleBottom = 39,
    this.paddingTitleTop = 0,
    this.fontSize = 54,
    this.fontWeight = FontWeight.w600,
    this.fontStyle = FontStyle.normal,
    this.fontColor = const Color(0xffFFFFFF),
    this.fontOpacity = 1.0,
    this.labelSemantic = '',
    this.isRtl = false,
    required this.animation,
    this.shelfTitleAnimOffset = 10,
  });

  final String title;
  final double height;
  final double paddingLeft;
  final double paddingTitleBottom;
  final double paddingTitleTop;
  final double fontSize;
  final Color fontColor;
  final double fontOpacity;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String labelSemantic;
  final bool isRtl;
  final bool animation;
  final double shelfTitleAnimOffset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextStyle titleStyle = TextStyle(
        color: fontColor.withOpacity(fontOpacity), fontSize: fontSize, fontFamily: WFont.defaultFont().first, fontStyle: fontStyle, fontWeight: fontWeight);
    Size titleTextSize = calcTextSize(title, titleStyle, isRtl);
    if (title.isEmpty) {
      return SizedBox(
        height: height + paddingTitleTop + paddingTitleBottom,
      );
    }
    return AnimatedContainer(
      height: height + paddingTitleBottom,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsetsDirectional.only(start: paddingLeft, top: paddingTitleTop, bottom: paddingTitleBottom),
      transform: Matrix4.translationValues(0.0, animation ? -shelfTitleAnimOffset : 0.0, 0.0),
      child: Container(
        width: 0,
        transform: isRtl ? Matrix4.translationValues(-titleTextSize.width, 0.0, 0.0) : null,
        child: Text(
          title,
          semanticsLabel: labelSemantic,
          overflow: TextOverflow.visible,
          softWrap: false,
          style: WFont.instance.semiBold.copyWith(fontSize: fontSize, color: fontColor),
        ),
      ),
    );
  }

  /*
   * Calculates the size of the text based on the given style and text direction.
   *
   * @param text The text to measure.
   * @param style The text style to apply.
   * @param isRtl Indicates whether the text direction is right-to-left.
   * @return The size of the text.
   */
  Size calcTextSize(String text, TextStyle style, bool isRtl) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
    )..layout();
    return textPainter.size;
  }
}
