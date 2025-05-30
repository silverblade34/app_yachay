import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDivider extends StatelessWidget {
  final String text;

  const AuthDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ignore: deprecated_member_use
        Expanded(child: Divider(color: Colors.white.withOpacity(0.2))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12.sp,
            ),
          ),
        ),
        // ignore: deprecated_member_use
        Expanded(child: Divider(color: Colors.white.withOpacity(0.2))),
      ],
    );
  }
}
