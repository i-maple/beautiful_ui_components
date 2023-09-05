import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  const TextInputField(
      {Key? key,
      this.placeholder = '',
      this.isPassword = false,
      this.borderColor = Colors.transparent,
      this.keyboardType = TextInputType.text,
      this.borderWidth = 1,
      this.validator,
      this.controller})
      : super(key: key);
  final String placeholder;
  final bool isPassword;
  final Color borderColor;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final double borderWidth;
  final String? Function(String?)? validator;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          keyboardType: widget.keyboardType,
          obscureText: showPassword,
          controller: widget.controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: widget.borderColor, width: widget.borderWidth)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: widget.borderColor, width: widget.borderWidth)),
              label: Text(
                widget.placeholder,
                style: TextStyle(color: widget.borderColor),
              )),
          validator: widget.validator ?? (value) {
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
                            showPassword = showPassword;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: showPassword
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
