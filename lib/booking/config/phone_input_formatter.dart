import 'package:flutter/services.dart';

class NumberTextInputFormatter extends TextInputFormatter {
  String addChar(String value) {
    String nums = value.replaceAll(RegExp(r'\D'), '');
    if (nums.isNotEmpty && !nums.startsWith('7')) nums = '7$nums';

    String placeholder = '+7 (***) ***-**-**';

    for (int i = 1; i < nums.length; i++) {
      placeholder = placeholder.replaceFirst('*', nums[i]);
    }

    return placeholder;
  }

  String removeChar(String value, bool isNumberErased) {
    String nums = value.replaceAll(RegExp(r'\D'), '');
    if (nums.isNotEmpty && !nums.startsWith('7')) nums = '7$nums';

    String placeholder = '+7 (***) ***-**-**';
    final corrector = isNumberErased ? 0 : 1;

    for (int i = 1; i < nums.length - corrector; i++) {
      placeholder = placeholder.replaceFirst('*', nums[i]);
    }

    return placeholder;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = '';
    if (newValue.text.length > oldValue.text.length) {
      text = addChar(newValue.text);
    } else {
      text = removeChar(
          newValue.text,
          newValue.text.replaceAll(RegExp(r'\d'), '').length ==
              oldValue.text.replaceAll(RegExp(r'\d'), '').length);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
      //composing: TextRange(start: 0, end: 18),
    );
  }
}
