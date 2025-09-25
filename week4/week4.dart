void main() {
  print(0 ?? 1);
  print(1 ?? null);
  print(null ?? null ?? 2);

  // with no initialization it CANNOT be used
  int i;

  // j = null;
  var j;
  j ??= 10;
  // should be 10, changed from null
  print(j);
  j ??= 5;
  // still 10, no change because it will only change null
  print(j);

  var word;
  // will crash
  // print(word.toLowerCase());
  // output should be null
  print(word?.toLowerCase?.toUpperCase());

  // k becomes nullable, it takes null and int values
  int biel = 2123;
  int? k = 1;
  k = null;
  // valid, biel is non-nullable, possible nullable with assertion "!"
  biel = k!;
}
