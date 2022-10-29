import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  TextInputField(
      {Key? key,
      required this.placeholder,
      this.isPassword = false,
      required this.borderColor,
      this.showPassword = false,
      this.keyboardType = TextInputType.text,
      required this.controller})
      : super(key: key);
  final String placeholder;
  final bool isPassword;
  final Color borderColor;
  final TextEditingController controller;
  final TextInputType keyboardType;
  bool showPassword;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          keyboardType: widget.keyboardType,
          obscureText: widget.showPassword,
          controller: widget.controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: widget.borderColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: widget.borderColor)),
              label: Text(
                widget.placeholder,
                style: TextStyle(color: widget.borderColor),
              )),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget.placeholder} can\'t be null';
            }
            if (widget.isPassword == true && value.length <= 6) {
              return 'Password should be at least 6 characters';
            }
            return null;
          },
        ),
        widget.isPassword
            ? Positioned(
                right: 10,
                top: 5,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            widget.showPassword = !widget.showPassword;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: widget.showPassword
                              ? Colors.grey
                              : widget.borderColor,
                        )),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
