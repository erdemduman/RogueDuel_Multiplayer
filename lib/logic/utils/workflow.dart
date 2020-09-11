class Workflow {
  List<Function> _workList;
  bool _completeThemAll;
  int _index;

  Workflow(List<Function> workList, {bool completeThemAll = false}) {
    _workList = workList;
    _completeThemAll = completeThemAll;
    _index = 0;
  }

  void start() {
    if (_completeThemAll) {
      _workList.forEach((work) {
        work();
      });
    } else {
      _workList[_index]();
    }
  }

  void next() {
    _index++;
    _workList[_index]();
  }
}
