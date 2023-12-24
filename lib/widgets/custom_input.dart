import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    required this.hintText,
    this.onChanged,
    this.controller,
    this.textInputAction,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      style: TextStyle(fontSize: 12.sp),
      autofocus: false,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12.sp),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 22, 199, 46), width: 0.6.w)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
    );
  }
}
