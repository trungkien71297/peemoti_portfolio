import 'package:flutter/material.dart';

class AssetsConstants {
  static const logo = 'assets/logo.png';
  static const fishing = 'assets/fishing.jpeg';
  static const self = 'assets/self.JPG';
  static const dart = 'assets/dart.png';
  static const flutter = 'assets/flutter.png';
  static const ios = 'assets/ios.png';
  static const swift = 'assets/swift.png';
}

class AppConstants {
  static const musicUrl =
      'https://embed.music.apple.com/vn/playlist/pl.u-PDb40pAseDEXvML';
  static const githubUrl = 'https://github.com/trungkien71297';
  static const linkedInUrl = 'https://www.linkedin.com/in/peemoti/';
  static const twitterUrl = 'https://twitter.com/peemoti';
  static const phoneUrl = 'tel:+84987347404';
  static const mailUrl = 'mailto:trungkien71297@outlook.com';

  static const fontMain = 'Kanit';
  static const font1 = 'Rubik Glitch';
  static const font2 = 'Dancing Script';
  static const introduceParagraph =
      'Hello! I\'m Kien, a mobile developer specializing in Flutter and iOS Swift. With a passion for creating seamless user experiences, I bring expertise in crafting cross-platform applications with Flutter and native iOS apps with Swift. Let\'s connect and explore the world of mobile development together!';
}

class StyleConstant {
  static const header1 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const header2 = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
}

enum LanguageSystem {
  en(Locale('en'), 'English'),
  vi(Locale('vi'), 'Tiếng Việt');

  const LanguageSystem(this.value, this.name);
  final Locale value;
  final String name;
}
