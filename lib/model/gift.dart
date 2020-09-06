class Gift {
  int id;
  String name;
}

class Invocation extends Gift {
  int priority;
  int numberUsed;
}

class Conjuration extends Gift {
  bool active;
}

class Status {
  int id;
  String name;
}
