import 'package:flutter/material.dart';
import 'package:habbits_checker/models/habit_repeat.dart';
import 'package:habbits_checker/widgets/habit_name_input.dart';
import 'package:habbits_checker/widgets/habit_repeat_input.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final TextEditingController habitController = TextEditingController();

  @override
  void dispose() {
    habitController.dispose();
    super.dispose();
  }

  HabitRepeat repeat = HabitRepeat.daily;

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
