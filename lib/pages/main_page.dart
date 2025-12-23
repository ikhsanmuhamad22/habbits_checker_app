import 'package:flutter/material.dart';
import 'package:habbits_checker/models/habits_model.dart';
import 'package:habbits_checker/theme/app_colors.dart';
import 'package:habbits_checker/widgets/habit_checkbox.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(PhosphorIcons.list()),
        title: Text(
          'Habit Chekcer',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Icon(PhosphorIcons.sun()),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "Today's Habits",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Divider(color: AppColors.textPrimary),
            Expanded(
              child: ListView.builder(
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                habit.title,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            HabitCheckbox(
                              isChecked: habit.isDone,
                              onTap: () {
                                setState(() {
                                  habit.isDone = !habit.isDone;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(color: const Color.fromARGB(255, 217, 208, 208)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
