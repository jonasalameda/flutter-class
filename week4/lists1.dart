import 'dart:collection';

void main() {
  List<int> nums = [10, 182, 77];
  List<String> names = ["jon", "rafael", "biel"];
  var mixed = [123, "rafael", true, null];

  var list = List<int>.filled(5, 0);
  // cant change
  final List<String> NAMES = ["paulo", "polaco"];

  var combinedList = [...names, ...NAMES];

  print(combinedList);

  bool sad = true;
  var cart = ["milk", "soy", if (sad) 'one thousand beers'];
  print(cart);

  cart = cart.where((element) => element == "milk").toList();

  HashMap map1 = new HashMap<int, String>();
  LinkedHashMap map2 = new LinkedHashMap<int, String>();
  SplayTreeMap map3 = new SplayTreeMap<int, String>();

  map1[0] = "biel";
  map1[1] = "rafael";
  map1[2] = "paul";

  map1.putIfAbsent(3, () => 'biel');
  map1.update(0, (e) => "$e tauz");
  print(map1);
}
