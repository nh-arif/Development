void main() {
  int ID = 75;
  double CGPA = 3.62;
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
  var fullNameAndAge = [name, "Hasan", "Arif", age];
  var address = {
    "city": ["Rangpur Sadar", "Rangpur"],
    "country": "Bangladesh",
    "zip": 5400,
    "url":
        "https://cdn-media-1.freecodecamp.org/images/MiAWLAfns7pPgptcHFFPe8UAwMhPTPp3WWgt",
  };

  print(fullNameAndAge);
  print(address);
}
