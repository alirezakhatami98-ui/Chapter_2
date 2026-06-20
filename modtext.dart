import 'dart:io';

void main() async {
  var file = File('words.txt');
  await file.writeAsString(
    'Find the perfect sound or royalty free music track with SoundDogs. Browse through our collection of over 1000000 tracks online today.',
  );
  print('File is written.');

  String contents = await file.readAsString();
  int numWords = contents.split(' ').length;
  print('Number of words of file: $numWords');
}
