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
  print('Task 1 complete');
}

void task2() {
  Duration threeSeconds = Duration(seconds: 20);
  Future.delayed(threeSeconds);
  print('Task 2 complete');
}

void task3() {
  print('Task 3 complete now');
}
