import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BorderlessTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String labelText;
  final bool isError;
  final String? hintText;

  const BorderlessTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    required this.labelText,
    this.isError = false,
    this.hintText,
  });

  @override
  State<StatefulWidget> createState() => BorderlessTextFieldState();
}

class BorderlessTextFieldState extends State<BorderlessTextField> {
  bool isError = true;

  @override
  void initState() {
    super.initState();
    isError = widget.isError;
  }

  @override
  void didUpdateWidget(covariant BorderlessTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    isError = widget.isError;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F9),
        border: isError ? Border.all(color: Colors.red) : null,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        onChanged: (value) {
          if (isError) {
            setState(() {
              isError = false;
            });
          }
        },
        style: const TextStyle(
          color: Color(0xFF14142B),
          fontWeight: FontWeight.w400,
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          labelText: widget.labelText,
          labelStyle:
              TextStyle(color: isError ? Colors.red : const Color(0xFFA9ABB7)),
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF14142B),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
