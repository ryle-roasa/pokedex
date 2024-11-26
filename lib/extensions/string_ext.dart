import 'package:pokedex/constants/constants.dart';

extension StringExt on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String addLeadingZeros() => '#${padLeft(4, '0')}';
}

extension ListStringExt on List<String> {
  String joinWithComma() {
    if (isEmpty) return emptyString;
    if (length == 1) return first;

    // Remove all brackets in String.
    return toString().replaceAll(RegExp(r'\[|\]'), '');
  }
}
