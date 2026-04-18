import 'package:cairo_clinics_finder/core/utils/spacing.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneItemOfMyClinic extends StatelessWidget {
  const OneItemOfMyClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          Container(
            width: 52.r,
            height: 52.r,
            decoration: BoxDecoration(
              color: const Color(0xFFe0f2f1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.local_hospital_outlined,
              color: Colors.teal,
              size: 26.r,
            ),
          ),
          spaceW(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Ahmed Clinic',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                spaceH(4),
                Text(
                  'Cardiology • Cairo',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                ),
                spaceH(6),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14.r),
                    spaceW(4),
                    Text(
                      '4.6',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    spaceW(10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'Open',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.grey[600]),
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'edit', child: Text('Edit')),
              PopupMenuItem(value: 'delete', child: Text('Delete')),
              PopupMenuItem(value: 'view', child: Text('View')),
            ],
            onSelected: (value) {},
          ),
        ],
      ),
    );
  }
}
