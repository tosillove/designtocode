import 'package:flutter/material.dart';
import 'dart:async';

import 'package:plover/plover.dart';

/*
 * A widget that displays the current time with customizable properties.
 *
 * This widget supports various styling options and handles both 12-hour and 24-hour formats.
 */
class TimeInfoWidget extends StatefulWidget {
  /*
   * Create a TimeInfoWidget
   *
   * @param timeInfoWidth The width of the time info widget.
   * @param timeInfoHeight The height of the time info widget.
   * @param fontColor The color of the font.
   * @param fontSize The size of the font.
   * @param fontWeight The weight of the font.
   * @param letterSpacingHourMin The letter spacing for the hour and minute text.
   * @param letterSpacingAmpm The letter spacing for the AM/PM text.
   * @param hourMinuteWidth The width of the hour and minute text container.
   * @param hourMinuteHeight The height of the hour and minute text container.
   * @param ampmWidth The width of the AM/PM text container.
   * @param ampmHeight The height of the AM/PM text container.
   * @param format24Hour Indicates whether to use 24-hour format.
   * @param bgColor The background color of the widget.
   * @param borderSize The size of the border.
   * @param borderRadius The radius of the border.
   * @param borderColor The color of the border.
   * @param bgOpacity The opacity of the background color.
   */
  const TimeInfoWidget(
      {super.key,
      this.timeInfoHeight = 105,
      this.timeInfoWidth = 316,
      this.fontColor = const Color(0xffffffff),
      this.fontSize = 72.0,
      this.fontWeight = FontWeight.w300,
      this.letterSpacingHourMin = 3.0,
      this.letterSpacingAmpm = 6.0,
      this.hourMinuteWidth = 200,
      this.hourMinuteHeight = 84,
      this.ampmWidth = 116,
      this.ampmHeight = 105,
      this.format24Hour = false,
      this.bgColor = Colors.transparent,
      this.borderSize = 0,
      this.borderRadius = 0,
      this.borderColor = Colors.transparent,
      this.bgOpacity = 1.0,
      this.semanticLabel = ''});

  final double timeInfoWidth;
  final double timeInfoHeight;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double letterSpacingHourMin;
  final double letterSpacingAmpm;
  final double hourMinuteWidth;
  final double hourMinuteHeight;
  final double ampmWidth;
  final double ampmHeight;
  final bool format24Hour;
  final Color bgColor;
  final double borderSize;
  final double borderRadius;
  final Color borderColor;
  final double bgOpacity;

  final String semanticLabel;

  @override
  State<TimeInfoWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<TimeInfoWidget> {
  late Timer _timer;
  String _hour = '00';
  String _minute = '00';
  String _amPm = 'AM';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
  }

  void _updateTime(Timer timer) {
    setState(() {
      final now = DateTime.now();
      _hour = _formatHour(now.hour);
      _minute = _formatMinute(now.minute);
      _amPm = _formatAmPm(now.hour);
    });
  }

  String _formatHour(int hour) {
    if (widget.format24Hour) {
      return (hour % 24).toString().padLeft(2, '0');
    }
    return hour % 12 == 0 ? '12' : (hour % 12).toString().padLeft(2, '0');
  }

  String _formatMinute(int minute) {
    return minute.toString().padLeft(2, '0');
  }

  String _formatAmPm(int hour) {
    if (widget.format24Hour) {
      return '';
    } else {
      return hour >= 12 ? 'PM' : 'AM';
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topMargin = (widget.timeInfoHeight - widget.hourMinuteHeight) / 2.ceil();
    double bottomMargin = (widget.timeInfoHeight - widget.hourMinuteHeight) / 2.floor();
    return Semantics(
        label: widget.semanticLabel,
        child: Container(
          decoration: BoxDecoration(
              color: widget.bgColor.withOpacity(widget.bgColor == Colors.transparent ? 0 : widget.bgOpacity),
              border: Border.all(width: widget.borderSize, color: widget.borderColor),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          alignment: Alignment.topLeft,
          width: widget.timeInfoWidth,
          height: widget.timeInfoHeight,
          child: Row(
            children: [
              Container(
                width: widget.hourMinuteWidth,
                height: widget.hourMinuteHeight,
                margin: EdgeInsets.fromLTRB(0, topMargin, 0, bottomMargin),
                alignment: Alignment.centerLeft,
                child: Text('$_hour:$_minute',
                    style: TextStyle(
                        height: 1,
                        fontFamily: WFont.defaultFont().first,
                        fontSize: widget.fontSize,
                        fontWeight: widget.fontWeight,
                        letterSpacing: widget.letterSpacingHourMin,
                        color: widget.fontColor,
                        shadows: [
                          Shadow(offset: const Offset(6, 6), blurRadius: 6, color: Colors.black.withOpacity(0.4))
                        ])),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  width: widget.ampmWidth,
                  height: widget.ampmHeight,
                  child: Text(
                    _amPm,
                    style: TextStyle(
                        height: 1,
                        fontFamily: WFont.defaultFont().first,
                        fontSize: widget.fontSize,
                        fontWeight: widget.fontWeight,
                        letterSpacing: widget.letterSpacingAmpm,
                        color: widget.fontColor,
                        shadows: [
                          Shadow(offset: const Offset(6, 6), blurRadius: 6, color: Colors.black.withOpacity(0.4))
                        ]),
                  )),
            ],
          ),
        ));
  }
}
