// import 'package:flutter/material.dart';
//
// abstract class CustomStatelessWidget extends StatefulWidget {
//   const CustomStatelessWidget({
//     Key? key,
//     this.requiresAuth = false,
//     this.dismissKeyboardOnTapOutside = true,
//   }) : super(key: key);
//
//   final bool requiresAuth;
//   final bool dismissKeyboardOnTapOutside;
//
//   Widget build(BuildContext context);
//
//   @override
//   State<CustomStatelessWidget> createState() => _CustomStatelessWidgetState();
// }
//
// class _CustomStatelessWidgetState extends State<CustomStatelessWidget> {
//   @override
//   Widget build(BuildContext context) {
//     if (widget.dismissKeyboardOnTapOutside) {
//       return GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: widget.build(context),
//       );
//     } else {
//       return widget.build(context);
//     }
//   }
// }
