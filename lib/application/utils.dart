import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

int getSize(BuildContext context) {
  final size = MediaQuery.of(context).size;
  if (size.width < 600) {
    return 1;
  } else if (size.width >= 600 && size.width <= 840) {
    return 2;
  } else {
    return 3;
  }
}

launchUrlString(String url) async {
  await launchUrl(Uri.parse(url));
}
