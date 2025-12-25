import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../models/habit_repeat.dart';

class HabitRepeatInput extends StatelessWidget {
  final HabitRepeat selected;
  final ValueChanged<HabitRepeat> onChanged;

  const HabitRepeatInput({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          HabitRepeat.values.map((repeat) {
            final bool isActive = repeat == selected;

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => onChanged(repeat),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isActive
                            ? AppColors.primary.withOpacity(0.15)
                            : AppColors.border.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isActive ? AppColors.primary : AppColors.border,
                    ),
                  ),
                  child: Text(
                    _label(repeat),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          isActive
                              ? AppColors.primary
                              : AppColors.textSecondary,
                      fontWeight: isActive ? FontWeight.w500 : null,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  String _label(HabitRepeat repeat) {
    switch (repeat) {
      case HabitRepeat.daily:
        return 'Daily';
      case HabitRepeat.weekly:
        return 'Weekly';
      case HabitRepeat.mountly:
        return 'mountly';
    }
  }
}
