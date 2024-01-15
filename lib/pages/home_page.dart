import 'package:flutter/material.dart';
import 'package:peemoti/application/application.dart';
import 'package:peemoti/pages/main_page_view/about_page_view.dart';
import 'package:peemoti/pages/main_page_view/home_page_view.dart';
import 'package:peemoti/pages/main_page_view/project_page_view.dart';
import 'package:peemoti/widgets/change_language_mode.dart';
import 'package:peemoti/widgets/change_theme_mode.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = const [HomePageView(), AboutPageView(), ProjectPageView()];

  late PageController _pageController;
  final actions = [const ChangeLanguageMode(), const ChangeThemeMode()];
  int index = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            AssetsConstants.logo,
            width: 60,
            height: 60,
          ),
        ),
        actions: [
          if (getSize(context) == 1)
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.secondaryContainer
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  )),
              child: Builder(builder: (ctx) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                  child: const Center(
                    child: Icon(Icons.menu),
                  ),
                );
              }),
            ),
          if (getSize(context) > 1) ...actions
        ],
        title: getSize(context) > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: index == 0 ? null : BorderSide.none),
                      onPressed: () => _animateToPage(0),
                      child: Text(AppLocalizations.of(context)!.home)),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: index == 1 ? null : BorderSide.none),
                      onPressed: () => _animateToPage(1),
                      child: Text(AppLocalizations.of(context)!.about)),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: index == 2 ? null : BorderSide.none),
                      onPressed: () => _animateToPage(2),
                      child: Text(AppLocalizations.of(context)!.projects)),
                ],
              )
            : Text(
                _getTitle(),
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
      ),
      drawer: (getSize(context) > 1)
          ? null
          : Container(
              width: size.width * 0.6,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.surfaceVariant),
              child: Column(
                children: <Widget>[
                  const DrawerHeader(
                      child: Center(
                          child:
                              Text('Quốc gia hưng vong\nThất phu hữu trách'))),
                  ListTile(
                    title: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: index == 0
                                ? Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant)
                                : null),
                        child: Center(
                            child: Text(AppLocalizations.of(context)!.home))),
                    onTap: () => _animateToPage(0),
                  ),
                  ListTile(
                    title: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: index == 1
                                ? Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant)
                                : null),
                        child: Center(
                            child: Text(AppLocalizations.of(context)!.about))),
                    onTap: () => _animateToPage(1),
                  ),
                  ListTile(
                    title: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: index == 2
                                ? Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant)
                                : null),
                        child: Center(
                            child:
                                Text(AppLocalizations.of(context)!.projects))),
                    onTap: () => _animateToPage(2),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: actions,
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return _pages[index];
        },
      ),
    );
  }

  _animateToPage(int index) {
    setState(() {
      this.index = index;
    });
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOutBack);
  }

  String _getTitle() {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.home;
      case 1:
        return AppLocalizations.of(context)!.about;
      case 2:
        return AppLocalizations.of(context)!.projects;
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
