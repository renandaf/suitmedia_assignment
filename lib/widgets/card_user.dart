import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:suitmedia_assignment/data/model/userlist.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    required this.user,
    Key? key,
    this.onTap,
  }) : super(key: key);

  final User user;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.h),
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 6.w),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
              radius: 11.w,
            ),
            SizedBox(
              width: 3.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50.w,
                  child: Text(
                    "${user.firstName} ${user.lastName}",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    user.email,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 10.sp, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
