import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  TextInputType? keyboardType;
  final controller;

  MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(),
      ),
      child: TextField(
        keyboardType: keyboardType,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          label: Text(labelText),
        ),
      ),
    );
  }
}
