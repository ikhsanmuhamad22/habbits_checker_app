import 'package:flutter/material.dart';
import 'package:habbits_checker/models/habits_model.dart';
import 'package:habbits_checker/pages/add_habit_page.dart';
import 'package:habbits_checker/theme/app_colors.dart';
import 'package:habbits_checker/widgets/custom_drawer.dart';
import 'package:habbits_checker/widgets/habit_checkbox.dart';
import 'package:habbits_checker/widgets/habit_progress.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    void openAddHabitPage() async {
      final Habit? newHabit = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AddHabitPage()),
      );

      if (newHabit != null) {
        setState(() {
          habits.add(newHabit);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          'Habit Chekcer',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      drawer: CustomDrawer(),
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: HabitProgress(
                completed: habits.where((h) => h.isDone).length,
                total: habits.length,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 36, right: 16, left: 16),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.accent),
                ),
                onPressed: () => openAddHabitPage(),
                child: Text(
                  '+ Add Habit',
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
