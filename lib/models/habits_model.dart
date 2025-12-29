import 'package:habbits_checker/models/habit_repeat.dart';

class Habit {
  final String title;
  bool isDone;
  final HabitRepeat repeat;

  Habit({required this.title, this.isDone = false, required this.repeat});
}

List<Habit> habits = [
  Habit(title: 'Drink Water', repeat: HabitRepeat.daily),
  Habit(title: 'Read Book', repeat: HabitRepeat.daily),
  Habit(title: 'Exercise', repeat: HabitRepeat.daily),
  Habit(title: 'Sleep Early', repeat: HabitRepeat.daily),
];
