import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:suitmedia_assignment/presentations/second_screen.dart';
import 'package:suitmedia_assignment/widgets/custom_buttom.dart';
import 'package:suitmedia_assignment/widgets/custom_dialog.dart';
import 'package:suitmedia_assignment/widgets/custom_input.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  static const routeName = '/first';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55.w,
            width: 50.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("images/welcome.png"))),
          ),
          SizedBox(height: 5.h),
          CustomInput(
            controller: _nameController,
            hintText: "Enter Your Name",
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 2.h),
          CustomInput(
            controller: _palindromeController,
            hintText: "Enter Palindrome Text",
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 4.h),
          CustomButton(
            text: "CHECK",
            onPressed: () => _palindromeController.text.isEmpty
                ? () {}
                : showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        isPalindrome(_palindromeController.text)
                            ? const CustomDialog(
                                title: "Is Palindrome",
                                text: "This text is palindrome")
                            : const CustomDialog(
                                title: "Not Palindrome",
                                text: "This text is not palindrome")),
          ),
          SizedBox(height: 2.h),
          CustomButton(
              text: "NEXT",
              onPressed: () => _nameController.text.isEmpty
                  ? () {}
                  : Navigator.of(context).pushNamed(SecondScreen.routeName,
                      arguments: _nameController.text)),
        ],
      ),
    )));
  }
}

bool isPalindrome(String text) {
  String lowerText = text.toLowerCase();
  String reverseText = lowerText.split('').reversed.join('');
  return lowerText == reverseText;
}
