//随机生成的工具
import 'dart:math';

import 'dart:ui';

import 'package:flutter/material.dart';

class RandomUtils {
  static final List<String> numbersAndLetters = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  static final List<String> numbers = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9'
  ];
  static final List<String> letters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  static final List<String> capitalLetters = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  static final List<String> lowerCaseLetters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  RandomUtils._internal();

  /*
  * 在数字和英文字母中获取一个定长的随机字符串
  *
  * @param length 长度
  * @return 随机字符串
  * @see RandomUtils#getRandom(String source, int length)
  */
  static String getRandomNumbersAndLetters(int length) {
    return getRandom(numbersAndLetters, length);
  }

  /*
  * 在数字中获取一个定长的随机字符串
  *
  * @param length 长度
  * @return 随机数字符串
  * @see RandomUtils#getRandom(String source, int length)
  */
  static String getRandomNumbers(int length) {
    return getRandom(numbers, length);
  }

  /*
  * 在英文字母中获取一个定长的随机字符串
  *
  * @param length 长度
  * @return 随机字母字符串
  * @see RandomUtils#getRandom(String source, int length)
  */
  static String getRandomLetters(int length) {
    return getRandom(letters, length);
  }

  /*
  * 在大写英文字母中获取一个定长的随机字符串
  *
  * @param length 长度
  * @return 随机字符串 只包含大写字母
  * @see RandomUtils#getRandom(String source, int length)
  */
  static String getRandomCapitalLetters(int length) {
    return getRandom(capitalLetters, length);
  }

  /*
  * 在小写英文字母中获取一个定长的随机字符串
  *
  * @param length 长度
  * @return 随机字符串 只包含小写字母
  * @see RandomUtils#getRandom(String source, int length)
  */
  static String getRandomLowerCaseLetters(int length) {
    return getRandom(lowerCaseLetters, length);
  }

  static String getRandom(List<String> sourceChar, int length) {
    if (sourceChar == null || sourceChar.length == 0 || length < 0) {
      return null;
    }

    String target = "";
    Random random = new Random();
    for (int i = 0; i < length; i++) {
      target += sourceChar[random.nextInt(sourceChar.length)];
    }
    return target;
  }

  // 取随机颜色
  static Color getRandomColor() {
    var red = Random.secure().nextInt(255);
    var greed = Random.secure().nextInt(255);
    var blue = Random.secure().nextInt(255);
    return Color.fromARGB(255, red, greed, blue);
  }

}
