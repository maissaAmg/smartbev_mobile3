import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';

class FilterButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  const FilterButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(108, 43),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: GlobalColor.textColor, width: 1),
        ),
        backgroundColor:
            widget.isSelected ? GlobalColor.textColor : GlobalColor.mainColor,
        foregroundColor:
            widget.isSelected ? Colors.white : GlobalColor.textColor,
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color:
              widget.isSelected ? GlobalColor.mainColor : GlobalColor.textColor,
        ),
      ),
    );
  }
}
