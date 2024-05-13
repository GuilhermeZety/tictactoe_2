// import 'package:flutter/material.dart';
// import 'package:tictactoe/app/core/common/constants/app_colors.dart';
// import 'package:pinput/pinput.dart';

// class CustomPinput extends StatelessWidget {
//   const CustomPinput({super.key, required this.controller, this.onCompleted});

//   final TextEditingController controller;
//   final void Function(String)? onCompleted;

//   @override
//   Widget build(BuildContext context) {
//     return Pinput(
//       length: 6,
//       onTapOutside: (event) {
//         FocusScope.of(context).unfocus();
//       },
//       pinAnimationType: PinAnimationType.slide,
//       controller: controller,
//       keyboardType: TextInputType.number,
//       onCompleted: onCompleted,
//       defaultPinTheme: const PinTheme(
//         width: 56,
//         height: 56,
//         textStyle: TextStyle(
//           fontSize: 22,
//           color: Color.fromRGBO(30, 60, 87, 1),
//         ),
//         decoration: BoxDecoration(),
//       ),
//       showCursor: true,
//       cursor: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             width: 56,
//             height: 3,
//             decoration: BoxDecoration(
//               color: const Color.fromRGBO(30, 60, 87, 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ],
//       ),
//       preFilledWidget: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             width: 56,
//             height: 3,
//             decoration: BoxDecoration(
//               color: AppColors.grey_200,
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ],
//       ),
//       autofocus: true,
//     );
//   }
// }
