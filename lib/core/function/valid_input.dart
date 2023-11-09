validInput(String val, int min, int max) {
  if (val.isEmpty) {
    return "Can't be empty";
  }
  if (val.length < min) {
    return 'The Min number Of Letters for Search is $min';
  }
  if (val.length > max) {
    return 'The Max number Of Letters for Search is $max';
  }
}
