import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isBorder;
  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isBorder = false,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isHover = false;
  @override
  /// Build the button widget based on the current state of the widget.
  ///
  /// The button is a [MouseRegion] that changes its background color when
  /// hovered. When the button is pressed, the [onPressed] callback is called.
  ///
  /// The button is also wrapped in an [InkWell] that creates a ripple effect
  /// when the button is tapped.
  ///
  /// The button's decoration is a [BoxDecoration] with a gradient that changes
  /// color when the button is hovered. The border of the button is a 2px wide
  /// teal border if [isBorder] is true.
  ///
  /// The button's child is a [Text] widget that displays the text passed in
  /// as [text].
  ///
  /// The button is padded with 8px of space on all sides.
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHover = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHover = false;
            });
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: widget.onPressed,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: isHover
                      ? LinearGradient(
                          colors: [Colors.teal, Colors.teal.shade100])
                      : null,
                  borderRadius: BorderRadius.circular(10),
                  border: widget.isBorder
                      ? Border.all(color: Colors.teal.shade100, width: 2)
                      : null),
              child: Text(
                widget.text,
                style: const TextStyle(letterSpacing: 1.2),
              ),
            ),
          )),
    );
  }
}
