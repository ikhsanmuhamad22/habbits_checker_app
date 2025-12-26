import 'package:flutter/material.dart';
import 'package:habbits_checker/models/habit_repeat.dart';
import 'package:habbits_checker/models/habits_model.dart';
import 'package:habbits_checker/theme/app_colors.dart';
import 'package:habbits_checker/widgets/habit_name_input.dart';
import 'package:habbits_checker/widgets/habit_repeat_input.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  @override
  void dispose() {
    habitController.dispose();
    super.dispose();
  }

  final TextEditingController habitController = TextEditingController();

  HabitRepeat repeat = HabitRepeat.daily;

  @override
  Widget build(BuildContext context) {
    void saveHabit() {
      if (habitController.text.trim().isEmpty) return;
      final habit = Habit(title: habitController.text.trim(), repeat: repeat);
      Navigator.pop(context, habit);
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add New Habit',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Habit Name', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            HabitNameInput(controller: habitController),
            SizedBox(height: 16),
            Text('Repeat', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: HabitRepeatInput(
                selected: repeat,
                onChanged: (value) {
                  setState(() {
                    repeat = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.accent),
                ),
                onPressed: () => saveHabit(),
                child: Text(
                  'Save Habit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
