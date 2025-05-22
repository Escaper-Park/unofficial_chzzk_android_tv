abstract class VirtualKeyboardData {
  const VirtualKeyboardData._();

  static const List<String> qwertyLowerCaseKeys = [
    ..._lowerNumericKeys,
    ..._lowerTopRowKeys,
    ..._lowerMiddleRowKeys,
    ..._lowerBottomRowKeys,
    '한/영',
  ];

  static const List<String> qwertyUpperCaseKeys = [
    ..._specialCharacterKeys,
    ..._upperTopRowKeys,
    ..._upperMiddleRowKeys,
    ..._upperBottomRowKeys,
    '한/영',
  ];

  static const List<String> qwertyLowerCaseKoreanKeys = [
    ..._lowerNumericKeys,
    ..._lowerKoreanTopRowKeys,
    ..._lowerKoreanMiddleRowKeys,
    ..._lowerKoreanBottonRowKeys,
    '한/영',
  ];

  static const List<String> qwertyUpperCaseKoreanKeys = [
    ..._specialCharacterKeys,
    ..._upperKoreanTopRowKeys,
    ..._upperKoreanMiddleRowKeys,
    ..._upperKoreanBottomRowKeys,
    '한/영',
  ];

  static const List<String> _specialCharacterKeys = [
    "!",
    "@",
    "#",
    r"$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "_",
    "+",
  ];

  static const List<String> _lowerNumericKeys = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "-",
    "=",
  ];

  static const List<String> _lowerTopRowKeys = [
    "q",
    "w",
    "e",
    "r",
    "t",
    "y",
    "u",
    "i",
    "o",
    "p",
    "[",
    "]",
  ];

  static const List<String> _lowerMiddleRowKeys = [
    "a",
    "s",
    "d",
    "f",
    "g",
    "h",
    "j",
    "k",
    "l",
    ";",
    "'",
    "BACK",
  ];

  static const List<String> _lowerBottomRowKeys = [
    "SHIFT",
    "z",
    "x",
    "c",
    "v",
    "b",
    "n",
    "m",
    ",",
    ".",
    "/",
    "ENTER",
  ];

  static const List<String> _upperTopRowKeys = [
    'Q',
    'W',
    'E',
    'R',
    'T',
    'Y',
    'U',
    'I',
    'O',
    'P',
    '{',
    '}',
  ];

  static const List<String> _upperMiddleRowKeys = [
    'A',
    'S',
    'D',
    'F',
    'G',
    'H',
    'J',
    'K',
    'L',
    ':',
    '"',
    'BACK',
  ];

  static const List<String> _upperBottomRowKeys = [
    'SHIFT',
    'Z',
    'X',
    'C',
    'V',
    'B',
    'N',
    'M',
    '<',
    ">",
    '?',
    'ENTER',
  ];

  static const List<String> _lowerKoreanTopRowKeys = [
    "ㅂ",
    "ㅈ",
    "ㄷ",
    "ㄱ",
    "ㅅ",
    "ㅛ",
    "ㅕ",
    "ㅑ",
    "ㅐ",
    "ㅔ",
    "[",
    "]",
  ];

  static const List<String> _lowerKoreanMiddleRowKeys = [
    "ㅁ",
    "ㄴ",
    "ㅇ",
    "ㄹ",
    "ㅎ",
    "ㅗ",
    "ㅓ",
    "ㅏ",
    "ㅣ",
    ";",
    "'",
    'BACK',
  ];

  static const List<String> _lowerKoreanBottonRowKeys = [
    "SHIFT",
    "ㅋ",
    "ㅌ",
    "ㅊ",
    "ㅍ",
    "ㅠ",
    "ㅜ",
    "ㅡ",
    ",",
    ".",
    "/",
    "ENTER",
  ];

  static const List<String> _upperKoreanTopRowKeys = [
    'ㅃ',
    'ㅉ',
    'ㄸ',
    'ㄲ',
    'ㅆ',
    'ㅛ',
    'ㅕ',
    'ㅑ',
    'ㅒ',
    'ㅖ',
    '{',
    '}',
  ];

  static const List<String> _upperKoreanMiddleRowKeys = [
    'ㅁ',
    'ㄴ',
    'ㅇ',
    'ㄹ',
    'ㅎ',
    'ㅗ',
    'ㅓ',
    'ㅏ',
    'ㅣ',
    ':',
    '"',
    'BACK',
  ];

  static const List<String> _upperKoreanBottomRowKeys = [
    'SHIFT',
    'ㅋ',
    'ㅌ',
    'ㅊ',
    'ㅍ',
    'ㅠ',
    'ㅜ',
    'ㅡ',
    '<',
    '>',
    '?',
    'ENTER',
  ];
}
