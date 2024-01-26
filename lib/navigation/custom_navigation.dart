import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_resposive/navigation/destination.dart';
import 'package:test_resposive/navigation/navigation_provider.dart';

// class CustomNavigator {
//   int _selectedIndex = 0;
//
//   int get selectedIndex => _selectedIndex;
//
//   set selectedIndex(int value) {
//     _selectedIndex = value;
//   }
// }


class CustomNavigationRail extends StatelessWidget {
  const CustomNavigationRail({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).hasDrawer
            ? Scaffold.of(context).openDrawer()
            : context.read<NavigationProvider>().toggle(),
      ),
      destinations: primaryDestinations
          .map((e) => NavigationRailDestination(
              label: Text(e.label), icon: Icon(e.icon)))
          .toList(),
      labelType: NavigationRailLabelType.all,
      selectedIndex: context.watch<NavigationProvider>().selectedIndex,
      onDestinationSelected: (index) => onDestinationSelected(context, index),
    );
  }

  void onDestinationSelected(BuildContext context, int index) {
    context.read<NavigationProvider>().selectedIndex = index;
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomBottomNavigationBar({
    super.key,
    required this.navigationShell,
  });

  // static const List<NavigationRailDestination>  _d= ;
  // final _navigationKey =GlobalKey<State<BottomNavigationBar>>();
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: primaryDestinations
          .map((e) => NavigationDestination(icon: Icon(e.icon), label: e.label))
          .toList(),
      selectedIndex: context.watch<NavigationProvider>().selectedIndex,
      onDestinationSelected: (index) => onDestinationSelected(context, index),
    );
  }

  void onDestinationSelected(BuildContext context, int index) {
    context.read<NavigationProvider>().selectedIndex = index;
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

}
