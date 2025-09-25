late String globalLateVariable =
    "Will be initialize if used"; // initialized later before use, function call will not happen if not used -> saves memory & time

void main() {
  final int ID = 75;
  const double CGPA = 3.62;
  bool isRegistered = true;
  String? Name; // nullable variable
  Name ??= "Nahid"; // if name is null then assign "Nahid"
  Object? nullableObject = null;
  nullableObject = {
    "name": Name,
    "id": ID,
    "CGPA": CGPA,
    "Registration": isRegistered,
    "year": 2025,
  };

  print(nullableObject);

  var name = "Nahid Hasan Arif";
  var age = 24;
  var fullNameAndAge = [name, "Hasan", "Arif", age]; //list
  var address = {
    //map
    "city": ["Rangpur Sadar", "Rangpur"],
    "country": "Bangladesh",
    "zip": 5400,
    "url":
        "https://cdn-media-1.freecodecamp.org/images/MiAWLAfns7pPgptcHFFPe8UAwMhPTPp3WWgt",
  };

  print(fullNameAndAge);
  print(address);

  //globalLateVariable = "Initialized late variable";
  print(globalLateVariable);

  var foo = const [];
  foo = [1, 2, 3]; // ✅ allowed
  foo.add(4); // ❌ error, because the original list was const
  foo[0] = 2;
  foo[0] = 4;
  print(foo);

  final bar = const [];
  //bar = [1, 2, 3]; // ❌ error (can’t reassign a final variable)
  //bar.add(4); // ❌ error (const list is immutable)
  print(bar);

  const baz = const [];
  //baz = [1, 2, 3]; // ❌ error (can’t reassign a const variable)
  //baz.add(4); // ❌ error (const list is immutable)
  print(baz);
}
