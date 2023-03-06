// extension on String

import 'package:d_once/data/mapper/mapper.dart';
import 'package:easy_localization/easy_localization.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

extension ConvertMonthIntToString on int {
  String convertMonthIntToString() {
    DateTime date = DateTime(2022, this);
    String monthText = DateFormat("MMMM").format(date);
    return monthText;
  }
}
