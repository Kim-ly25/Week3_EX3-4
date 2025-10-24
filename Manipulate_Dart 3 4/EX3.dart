class CustomDuration {
  final int _milliseconds;

  CustomDuration(this._milliseconds) {
    if (_milliseconds < 0) {
      throw ArgumentError("Duration cannot be negative");
    }
  }

  CustomDuration._(this._milliseconds);
  // constructor
  CustomDuration.fromHours(int hours)
    : this._milliseconds = hours * 3600 * 1000;
  CustomDuration.fromminutes(int minutes)
    : this._milliseconds = minutes * 60 * 1000;
  CustomDuration.fromSeconds(int seconds) : this._milliseconds = seconds * 1000;

  //getters
  int get inMilliscenonds => _milliseconds;

  // Overloaded operators
  bool operator >(CustomDuration other) => _milliseconds > other._milliseconds;

  CustomDuration operator +(CustomDuration other) =>
      CustomDuration._(_milliseconds + other._milliseconds);

  CustomDuration operator -(CustomDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception("Resulting duration cannot be negative");
    }
    return CustomDuration._(result);
  }
 
  int get inSeconds => _milliseconds ~/ 1000;
  int get inMinutes => _milliseconds ~/ (60 * 1000);
  int get inHours => _milliseconds ~/ (3600 * 1000);

  @override
  String toString() {
    int totalSeconds = _milliseconds ~/ 1000;
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return "${hours}h ${minutes}m ${seconds}s";
  }
}
void main() {
  var duration1 = CustomDuration.fromHours(2);
  var duration2 = CustomDuration.fromminutes(90);

  print("Duration1: $duration1"); //Duration 1: 2h 0m 0s
  print("Duration2: $duration2"); //Duration 2: 1h 30m 0s

  // Comparison
  print("Is Duration 1 greater than Duration 2? ${duration1 > duration2}"); // true

  // Addition
  var sumDuration = duration1 + duration2;
  print("Sum Duration: $sumDuration"); //Total Duration: 3h 30m 0s

  // Subtraction
  var minusDuration = duration1 - duration2;
  print("Minus Duration: $minusDuration"); // Duration: 0h 30m 0s

  try{
    var invalid = duration2 - duration1;
    print(invalid);
  } catch (e) {
    print(e);
  }
}
