import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Handle backspace/delete
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    int? intValue = int.tryParse(
      newValue.text.replaceAll('.', ''),
    );
    String? newString = intValue?.toString();
    if (newString != null && newString.isNotEmpty) {
      final formatter = NumberFormat('#,###');
      formatter.maximumFractionDigits = 0;
      newString = formatter.format(intValue);
    } else {
      newString = '';
    }

    return TextEditingValue(
      text: newString.replaceAll(',', '.'),
      selection: TextSelection.collapsed(
        offset: newString.length,
      ),
    );
  }
}
