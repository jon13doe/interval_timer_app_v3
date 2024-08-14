class PresetClass {
  final String name;
  final DateTime date;
  final Map<int, SetClass> setsList;

  PresetClass({
    required this.name,
    required this.date,
    required this.setsList,
  });

  double calculateTotalPresetTime() {
    double totalTime = 0.0;

    for (final loop in setsList.values) {
      totalTime += loop.calculateTotalLoopTime();
    }

    return totalTime;
  }

  static PresetClass fromMap(Map<String, dynamic> map) {
    final String name = map['name'];
    final DateTime date = DateTime.parse(map['date']);

    final Map<int, SetClass> setsList = {};
    map['setsList'].forEach((key, value) {
      setsList[int.parse(key)] = SetClass.fromMap(value);
    });

    return PresetClass(
      name: name,
      date: date,
      setsList: setsList,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> setsList = {};
    setsList.forEach((key, value) {
      setsList[key.toString()] = value.toMap();
    });

    return {
      'name': name,
      'date': date.toString(),
      'setsList': setsList,
    };
  }
}

class SetClass {
  int repeats;
  Map<int, TaskClass> taskList;

  SetClass({
    required this.repeats,
    required this.taskList,
  });

  void updaterepeats(int newValue) {
    repeats = newValue;
  }

  void updatetaskList(Map<int, TaskClass> newValue) {
    taskList = newValue;
  }

  int calculateTotalLoopTime() {
    int totalTime = 0;

    taskList.forEach((key, value) {
      totalTime += value.time;
    });

    return repeats * totalTime;
  }

  static SetClass fromMap(Map<String, dynamic> map) {
    final int repeats = map['repeats'];

    final Map<int, TaskClass> taskList = {};
    map['taskList'].forEach((key, value) {
      taskList[int.parse(key)] = TaskClass.fromMap(value);
    });

    return SetClass(
      repeats: repeats,
      taskList: taskList,
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> taskMap = {};
    taskList.forEach((key, value) {
      taskMap[key.toString()] = value.toMap();
    });

    return {
      'repeats': repeats,
      'taskList': taskMap,
    };
  }
}

class TaskClass {
  String name;
  int time;

  TaskClass({
    required this.name,
    required this.time,
  });

  void updateName(String newValue) {
    name = newValue;
  }

  void updateTime(int newValue) {
    time = newValue;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'time': time,
    };
  }

  static TaskClass fromMap(Map<String, dynamic> map) {
    return TaskClass(
      name: map['name'],
      time: map['time'],
    );
  }
}
