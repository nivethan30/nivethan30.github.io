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
