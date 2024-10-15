import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.isObscure,
    this.icon,
    this.focusedIcon,
    required this.controller,
    this.valid,
    this.borderColor = Colors.blue, // Default border color
    this.defaultBorderColor = Colors.black54, // Default icon color
    this.focusedIconColor = Colors.black87, // Color when icon is clicked
    this.clickedBorderColor = Colors.blue,
    this.onTapIcon,
    this.prefixIcon,
  });

  final String labelText;
  final bool? isObscure;
  final Icon? icon;
  final Icon? prefixIcon;
  final Icon? focusedIcon;
  final TextEditingController controller;
  final String? Function(String?)? valid;
  final Color? borderColor;
  final Color? defaultBorderColor;
  final Color? focusedIconColor;
  final Color? clickedBorderColor;
  final void Function()? onTapIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isObscured = true; // To toggle password visibility

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });

    // Initialize obscured state if it's a password field
    _isObscured = widget.isObscure ?? false;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: TextFormField(
        cursorColor: Colors.blue,
        focusNode: _focusNode,
        validator: widget.valid,
        controller: widget.controller,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black87),
        obscureText: widget.isObscure == true ? _isObscured : false,
        // Toggle obscure text
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.clickedBorderColor!, width: 2.0),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: widget.defaultBorderColor!, width: 1.5),
            borderRadius: BorderRadius.circular(30),
          ),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(widget.labelText),
          ),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey[700]),
          suffixIcon: widget.isObscure == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  child: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: _focusNode.hasFocus
                        ? widget.focusedIconColor
                        : Colors.grey[700],
                  ),
                )
              : GestureDetector(
                  onTap: widget.onTapIcon,
                  child: IconTheme(
                    data: IconThemeData(
                      color: _focusNode.hasFocus
                          ? widget.focusedIconColor
                          : Colors.grey[700],
                    ),
                    child:
                        _focusNode.hasFocus ? widget.focusedIcon! : widget.icon!,
                  ),
                ),
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
