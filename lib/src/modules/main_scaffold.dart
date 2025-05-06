import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey[400],
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            items: _navItem
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item["icon"]),
                    label: item["title"]?.toString().tr(),
                    backgroundColor: AppColors.white,
                  ),
                )
                .toList(),
            currentIndex: _selectedIndex,
            onTap: (index) => _tap(index),
          ),
        ),
      ),
    );
  }
}
