import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback onTap;
  const SideBarButton({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(94, 121, 85, 72),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
