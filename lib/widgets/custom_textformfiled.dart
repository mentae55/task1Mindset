import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormFiled({
    super.key,
    this.validator,
    required this.title,
    required this.hint,
    required this.controller,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hint,
              errorStyle: TextStyle(color: Colors.red),
              hintStyle: TextStyle(color: Colors.black54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
