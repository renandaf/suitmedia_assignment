import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:suitmedia_assignment/presentations/third_screen.dart';
import 'package:suitmedia_assignment/provider/preferences_provider.dart';
import 'package:suitmedia_assignment/widgets/custom_buttom.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.name});
  static const routeName = '/second';
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Second Screen",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            )),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "Welcome",
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ]),
              const Spacer(),
              Column(children: [
                Consumer<PreferencesProvider>(
                    builder: (context, provider, child) {
                  return Text(
                    provider.user,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  );
                }),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                    text: "Choose a user",
                    onPressed: () {
                      Navigator.of(context).pushNamed(ThirdScreen.routeName);
                    }),
              ]),
            ],
          ),
        ));
  }
}
