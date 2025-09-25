void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);

  List<String> game = [
    'chess',
    'football',
    'free fire',
    'pubg',
    'call of duty',
  ];

  print(game.length);
  print(game.isNotEmpty);
  print(game.first);
  print(game.last);
  print(numbers.reversed);

  game.add('cricket');
  print(game);

  game.remove('free fire');
  print(game);

  game.removeAt(4);
  print(game);

  game.insert(2, "hacker a vorpur game");
  print(game);

  // fixed length list
  List<int> fixedList = List.filled(5, 0);
  fixedList[0] = 10;
  fixedList[1] = 20;
  fixedList[2] = 30;
  fixedList[3] = 40;
  fixedList[4] = 50;
  print(fixedList);
  // fixedList.add(50); // error

  List<int> fixedList2 = List<int>.filled(5, 2);
  print(fixedList2);

  // growable list
  List<int> growableList1 = List<int>.empty(growable: true);
  growableList1.add(100);
  growableList1.add(200);
  print(growableList1);

  List<int> growableList2 = [];
  growableList2.add(300);
  growableList2.add(400);
  print(growableList2);

  List<int> growableList3 = [1, 2, 3];
  growableList3.add(500);
  growableList3.add(600);
  print(growableList3);

  List<int> growableList4;
  // growableList4.add(700);  // error: The non-nullable local variable 'growableList4' must be assigned before it can be used.
  growableList4 = [7, 8, 9];
  growableList4.add(800);
  print(growableList4);
}
