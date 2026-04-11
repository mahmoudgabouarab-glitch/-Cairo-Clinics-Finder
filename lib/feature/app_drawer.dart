import 'package:cairo_clinics_finder/core/routing/routing_key.dart';
import 'package:cairo_clinics_finder/core/widgets/custom_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFF0F4F8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerItem(
            icon: Icons.person_outline,
            title: 'My Profile',
            onTap: () => context.push(GoTo.profile),
          ),
          DrawerItem(
            icon: Icons.add_business_outlined,
            title: 'Add Clinic',
            onTap: () {},
          ),
          DrawerItem(
            icon: Icons.favorite_outline,
            title: 'Saved Clinics',
            onTap: () {},
          ),
          DrawerItem(icon: Icons.info_outline, title: 'About', onTap: () {}),
          DrawerItem(
            icon: Icons.logout,
            title: 'Logout',
            isDestructive: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// class _DrawerHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
//       decoration: BoxDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 32.r,
//             backgroundColor: Colors.black12,
//             child: Icon(Icons.person, size: 32.r, color: Colors.white),
//           ),
//           spaceH(12),
//           Text(
//             "state.name",
//             maxLines: 1,
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 18.sp,
//               fontWeight: FontWeight.w700,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Text(
//             "state.email",
//             maxLines: 1,
//             style: TextStyle(
//               color: Colors.black87,
//               fontSize: 13.sp,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           spaceH(10),
//           Divider(color: Colors.blueGrey),
//         ],
//       ),
//     );
//   }
// }
