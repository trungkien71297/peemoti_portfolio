import 'package:flutter/material.dart';
import 'package:peemoti/application/app.dart';
import 'package:peemoti/application/color_schemes.g.dart';
import 'package:peemoti/application/constants.dart';
import 'package:peemoti/pages/home_page.dart';
import 'package:peemoti/pages/loading_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: App.instance,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Peemoti',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: App.instance.languageSystem.value,
          theme: ThemeData(
            fontFamily: AppConstants.fontMain,
            colorScheme: lightColorScheme,
            scaffoldBackgroundColor: lightColorScheme.background,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            fontFamily: AppConstants.fontMain,
            colorScheme: darkColorScheme,
            scaffoldBackgroundColor: darkColorScheme.background,
            useMaterial3: true,
          ),
          themeMode: App.instance.themeMode,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            const begin = Offset(0, -1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            switch (settings.name) {
              case '/':
                return PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: const LoadingPage(),
                  );
                });

              case '/home':
                return PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: const HomePage(),
                  );
                });
              default:
                return PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: const HomePage(),
                  );
                });
            }
          },
        );
      },
    );
  }
}
