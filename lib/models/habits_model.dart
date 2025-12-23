class Habit {
  final String title;
  bool isDone;

  Habit({required this.title, this.isDone = false});
}

List<Habit> habits = [
  Habit(title: 'Drink Water'),
  Habit(title: 'Read Book'),
  Habit(title: 'Exercise'),
  Habit(title: 'Sleep Early'),
];
