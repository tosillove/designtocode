import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

/*
 * SponsorLabelWidget class: A widget that displays a sponsored label with customizable text and style.
 * This widget is useful for indicating sponsorship in a visually appealing way.
 */
class SponsorLabelWidget extends StatefulWidget {
  /*
   * Creates an instance of SponsorLabelWidget.
   *
   * @param sponseredText The text to display as the sponsored label (default: 'SPONSORED')
   * @param sponseredTextFontSize The font size of the sponsored text (default: 36)
   * @param sponseredTextFontColor The color of the sponsored text (default: Colors.white)
   * @param sponseredTextFontShadowColor The shadow color of the sponsored text (default: Colors.black)
   */
  const SponsorLabelWidget({
    super.key,
    this.sponseredText = 'SPONSORED',
    this.sponseredTextFontSize = 36,
    this.sponseredTextFontColor = Colors.white,
    this.sponseredTextFontShadowColor = Colors.black,
  });

  final String sponseredText;
  final double sponseredTextFontSize;
  final Color sponseredTextFontColor;
  final Color sponseredTextFontShadowColor;

  @override
  State<SponsorLabelWidget> createState() => _SponsorLabel();
}

class _SponsorLabel extends State<SponsorLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
            widget.sponseredText,
            style: WFont.instance.bold.copyWith(
                color: widget.sponseredTextFontColor,
                fontSize: widget.sponseredTextFontSize,
                shadows: [
                  Shadow(
                    blurRadius: 6.0,
                    color: widget.sponseredTextFontShadowColor.withOpacity(0.8),
                    offset: const Offset(0, 2),
                  ),
                ],
            ),
          );
  }
}
