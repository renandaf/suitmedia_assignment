import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.onPressed,
    required this.text,
    this.color = const Color.fromARGB(255, 23, 174, 43),
    Key? key,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            minimumSize: Size(0, 6.5.h)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        )));
  }
}
