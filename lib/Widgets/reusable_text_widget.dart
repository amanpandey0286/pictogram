import 'package:flutter/material.dart';

class ReusableTextWidget extends StatelessWidget {
  final TextEditingController textController;
  final bool isPass;
  final String hint;
  final TextInputType keyType;

  const ReusableTextWidget({
    super.key,
    required this.hint,
    required this.textController,
    required this.isPass,
    required this.keyType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
      ),
      obscureText: isPass,
      keyboardType: keyType,
    );
  }
}
