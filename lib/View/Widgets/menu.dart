import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leftIcon;
  final IconData rightIcon;
  final VoidCallback onLeftIconPressed;
  final VoidCallback onRightIconPressed;

  const Menu({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    required this.onLeftIconPressed,
    required this.onRightIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      color: GlobalColor.mainColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(leftIcon),
              ),
              onPressed: onLeftIconPressed,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(rightIcon),
              ),
              onPressed: onRightIconPressed,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
