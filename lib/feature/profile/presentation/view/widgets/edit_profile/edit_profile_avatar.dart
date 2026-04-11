import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 52.r,
          backgroundColor: const Color(0xFFe0f2f1),
          child: Icon(Icons.person, size: 52.r, color: Colors.teal),
        ),
        Container(
          width: 32.r,
          height: 32.r,
          decoration: BoxDecoration(
            color: Colors.teal,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Icon(Icons.edit, color: Colors.white, size: 16.r),
        ),
      ],
    );
  }
}
