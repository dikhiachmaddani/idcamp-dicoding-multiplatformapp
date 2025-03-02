enum MyWorkmanager {
  oneOff("task-identifier", "task-identifier"),
  periodic("com.magoten.notificationApp", "com.magoten.notificationApp");

  final String uniqueName;
  final String taskName;

  const MyWorkmanager(this.uniqueName, this.taskName);
}
