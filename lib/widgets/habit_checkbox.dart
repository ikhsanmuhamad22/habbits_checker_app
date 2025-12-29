import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HabitCheckbox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;

  const HabitCheckbox({
    super.key,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primary : Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isChecked ? AppColors.primary : AppColors.border,
            width: 2,
          ),
        ),
        child:
            isChecked
                ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
                : null,
      ),
    );
  }
}
