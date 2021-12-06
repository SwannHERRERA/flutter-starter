class Calculator {
  final List<num> _inputs = [];
  late num res;

  void push(num element) {
    _inputs.add(element);
  }

  num addAll() {
    res = _inputs.reduce((value, element) => value + element);
    return res;
  }

  num getResult() {
    return res;
  }
}
