import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:misterblast_flutter/src/themes/theme.dart';

class MainScaffold extends ConsumerStatefulWidget {
  const MainScaffold({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  int _selectedIndex = 0;

  final List _navItem = [
    {
      "icon": Icons.home_rounded,
      "title": "bottombar.home",
      "route": '/home',
    },
    {
      "icon": Icons.add_task_sharp,
      "title": "bottombar.activity",
      "route": '/activity',
    },
    {
      "icon": Icons.explore,
      "title": "bottombar.exploration",
      "route": '/exploration',
    },
    {
      "icon": Icons.person_rounded,
      "title": "bottombar.profile",
      "route": '/profile',
    },
  ];

  void _tap(int index) {
    if (index == _selectedIndex) {
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
    context.go(_navItem[index]["route"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -3),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: GNav(
              gap: 8,
              iconSize: 24,
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              activeColor: Theme.of(context).colorScheme.primary,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: AppColors.grey,
              tabs: _navItem
                  .map(
                    (item) => GButton(
                      icon: item["icon"],
                      text: context.tr(item["title"]),
                      backgroundColor: AppColors.white,
                    ),
                  )
                  .toList(),
              selectedIndex: _selectedIndex,
              onTabChange: _tap,
            ),
          ),
        ),
      ),
    );
  }
}
