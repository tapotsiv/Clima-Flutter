import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 complete');
}

void task2() {
  String result = 'Task 2 data';
  Duration threeSeconds = Duration(seconds: 20);
  Future.delayed(threeSeconds, () {
    print('Task 2 complete');
  });
}

void task3() {
  String result = 'Task 3 data';
  print('Task 3 complete now');
}
