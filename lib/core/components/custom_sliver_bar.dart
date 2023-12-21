// import 'package:e_book/config/colors/app_colors.dart';
// import 'package:flutter/material.dart';
//
// import 'custom_flexible_space.dart';
//
// class CustomSliverAppBar extends StatelessWidget {
//   const CustomSliverAppBar({
//     super.key,
//     required this.image,
//     required this.height,
//     required this.onPressed,
//   });
//   final String image;
//   final double height;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       pinned: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(15),
//           bottomLeft: Radius.circular(15),
//         ),
//       ),
//       backgroundColor: const Color(AppColors.kScaffoldBackGroundColor),
//       leading: IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: const Icon(
//           color: Colors.grey,
//           Icons.arrow_back_ios_new_outlined,
//           size: 30,
//         ),
//       ),
//       expandedHeight: height,
//       flexibleSpace: CustomFlexibleSpaceBar(
//         onPressed: onPressed,
//         image: image,
//       ),
//     );
//   }
// }
