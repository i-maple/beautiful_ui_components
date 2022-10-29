import 'package:flutter/material.dart';

class FilledDropdown extends StatefulWidget {
  FilledDropdown(
      {Key? key,
      required this.items,
      required this.initValue,
      this.color = Colors.green,
      this.iconColor = Colors.white,
      this.textColor = Colors.white})
      : super(key: key);

  final List items;
  String initValue;
  final Color color;
  final Color textColor;
  final Color iconColor;

  @override
  State<FilledDropdown> createState() => _FilledDropdownState();
}

class _FilledDropdownState extends State<FilledDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
        value: widget.initValue,
        style: TextStyle(color: widget.textColor, fontSize: 16),
        icon: Icon(
          Icons.arrow_drop_down_circle_sharp,
          color: widget.iconColor,
        ),
        dropdownColor: widget.color,
        focusColor: widget.color,
        items: widget.items
            .map((value) => DropdownMenuItem(value: value, child: Text(value)))
            .toList(),
        onChanged: (value) {
          setState(() {
            widget.initValue = value.toString();
          });
        },
      ),
    );
  }
}
