class MyTask {
  final int numTask;
  final String contenu;
  bool checked;

  MyTask({
    required this.numTask,
    required this.contenu,
    required this.checked,
  });
}

class TasksList {
  final List<MyTask> myTasks;

  TasksList({
    required this.myTasks,
  });
}
