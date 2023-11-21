// import 'dart:io';

// import 'package:flutter/material.dart';

// class ImageFile extends StatelessWidget {
//   const ImageFile({
//     super.key,
//     required this.image,required this.imageAssets,
//   });

//   final String? image;
//   final String? imageAssets;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 150,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: image != null
//             ? Image.file(File(image!))
//             : Image.asset('$imageAssets'),
//       ),
//     );
//   }
// }