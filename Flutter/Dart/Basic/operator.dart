void main() {
  int a = 10;
  int b = 20;

  // Arithmetic Operators
  print('Addition: ${a + b}'); // 30
  print('Subtraction: ${b - a}'); // 10
  print('Multiplication: ${a * b}'); // 200
  print('Division: ${b / a}'); // 2.0
  print('Integer Division: ${b ~/ a}'); // 2
  print('Modulus: ${b % a}'); // 0

  // Relational Operators
  print('Equal: ${a == b}'); // false
  print('Not Equal: ${a != b}'); // true
  print('Greater Than: ${b > a}'); // true
  print('Less Than: ${a < b}'); // true
  print('Greater Than or Equal: ${b >= a}'); // true
  print('Less Than or Equal: ${a <= b}'); // true

  // Logical Operators
  bool x = true;
  bool y = false;
  print('Logical AND: ${x && y}'); // false
  print('Logical OR: ${x || y}'); // true
  print('Logical NOT: ${!x}'); // false

  // Assignment Operators
  int c = a; // c = 10
  c += b; // c = c + b -> c = 30
  print('c after += : $c');
  c -= a; // c = c - a -> c = 20
  print('c after -= : $c');
  c *= 2; // c = c * 2 -> c = 40
  print('c after *= : $c');
  c ~/= 4; // c = c ~/ 4 -> c = 10
  print('c after ~/= : $c');
}
