import 'package:flutter/material.dart';

import '../../constants/styles.dart' show AppColors;

class RichIconText extends StatelessWidget {
  /// A widget that allows combining both icons and text in a RichText-like fashion.
  const RichIconText({
    super.key,
    required this.elements,
    this.style,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
  });

  /// List of elements to display (IconElement or TextElement)
  final List<RichIconTextElement> elements;

  /// The default text style to apply to text elements
  final TextStyle? style;

  /// How the text should be aligned horizontally
  final TextAlign textAlign;

  /// Text direction (RTL or LTR)
  final TextDirection? textDirection;

  /// How to handle overflow
  final TextOverflow overflow;

  /// Maximum number of lines
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: elements.map((element) => element.toInlineSpan()).toList(),
      ),
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: TextScaler.linear(1.0),
    );
  }
}

/// Base abstract class for RichIconText elements
abstract class RichIconTextElement {
  InlineSpan toInlineSpan();
}

/// Class for text elements within a RichIconText
class TextElement extends RichIconTextElement {
  /// The text to display
  final String text;

  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;

  TextElement({
    required this.text,
    this.fontSize = 10.0,
    this.fontColor = AppColors.whiteColor,
    this.fontWeight = FontWeight.w600,
  });

  @override
  InlineSpan toInlineSpan() {
    return TextSpan(
      text: text,
      style: TextStyle(
        height: 1.4,
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
      ),
    );
  }
}

/// Class for icon elements within a RichIconText
class IconElement extends RichIconTextElement {
  /// The icon to display
  final IconData icon;

  /// Color of the icon
  final Color? iconColor;

  /// Size of the icon (height)
  final double? iconSize;

  /// Optional padding around the icon
  final double rightPadding;

  final PlaceholderAlignment alignment;

  IconElement({
    required this.icon,
    this.iconColor = AppColors.whiteColor,
    this.iconSize = 12.0,
    this.rightPadding = 5.0,
    this.alignment = PlaceholderAlignment.middle,
  });

  @override
  InlineSpan toInlineSpan() {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(
        padding: EdgeInsets.only(right: rightPadding),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}

/// Class for widget elements within a RichIconText
class WidgetElement extends RichIconTextElement {
  WidgetElement({
    required this.widget,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
    this.alignment = PlaceholderAlignment.middle,
  });

  /// The widget to embed
  final Widget widget;

  /// Optional padding around the widget
  final double horizontalPadding;
  final double verticalPadding;

  /// Alignment within the text line
  final PlaceholderAlignment alignment;

  @override
  InlineSpan toInlineSpan() {
    return WidgetSpan(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: widget,
      ),
    );
  }
}

class PaddingElement extends RichIconTextElement {
  PaddingElement({
    this.horizontalPadding = 5.0,
    this.alignment = PlaceholderAlignment.middle,
  });

  final double horizontalPadding;

  /// Alignment within the text line
  final PlaceholderAlignment alignment;

  @override
  InlineSpan toInlineSpan() {
    return WidgetSpan(
      alignment: alignment,
      child: SizedBox(
        width: horizontalPadding,
      ),
    );
  }
}
