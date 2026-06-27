class Subject {
  
  
  Subject({required this.name, required int mark})
    : assert(mark >= 0 && mark <= 100),
      _mark = mark;

  final String name;
  final int _mark;

  int get mark => _mark;

  String get grade {
    if (_mark >= 80) {
      return 'A';
    }
    if (_mark >= 65) {
      return 'B';
    }
    if (_mark >= 50) {
      return 'C';
    }
    return 'F';
  }

  bool get isPassing => grade != 'F';
}
