// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_book/config/colors/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
//
// import '../constant/app_constant.dart';
//
// class CustomFlexibleSpaceBar extends StatelessWidget {
//   CustomFlexibleSpaceBar({
//     super.key,
//     required this.image,
//     this.onPressed,
//   });
//
//   final String image;
//   VoidCallback? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return FlexibleSpaceBar(
//       background: Stack(
//         alignment: Alignment.bottomRight,
//         children: [
//           Container(
//             width: AppConstant.deviceWidth(context),
//             height: AppConstant.deviceHeight(context) / 2,
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//             decoration: BoxDecoration(
//               color: const Color(AppColors.kScaffoldBackGroundColor),
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(15),
//                 bottomLeft: Radius.circular(15),
//               ),
//               image: DecorationImage(
//                 image: CachedNetworkImageProvider(
//                   image,
//                 ),
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 onPressed?.call();
//               },
//               icon: const Icon(
//                 IconlyBroken.heart,
//                 size: 28,
//               )),
//         ],
//       ),
//     );
//   }
// }
