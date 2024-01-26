import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_resposive/navigation/destination.dart';
import 'package:test_resposive/navigation/custom_navigation.dart';
import 'package:test_resposive/navigation/navigation_provider.dart';

class CustomModalDrawer extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomModalDrawer({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(children: [
            ...primaryDestinations.map((e) => DrawerItem(
                  destination: e,
                  onTap: () => onPrimaryTap(context, e),
                )),
            const Divider(),
            ...secondaryDestinations.map((e) => DrawerItem(
                  destination: e,
                  onTap: () => onSecondaryTap(context, e),
                )),
          ]),
        ),
      ),
    );
  }

  void onPrimaryTap(BuildContext context, Destination destination) {
    var index = primaryDestinations.indexOf(destination);

    context.read<NavigationProvider>().selectedIndex = index;
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);

    context.pop();
  }

  void onSecondaryTap(BuildContext context, Destination destination) {
    context.push(context.namedLocation(destination.label));
    context.pop();
  }
}

class CustomStandardDrawer extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomStandardDrawer({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SizedBox(
        height: double.infinity,
        width: 300,//360
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => context.read<NavigationProvider>().toggle(),
              ),
              ...primaryDestinations.map((e) => DrawerItem(
                    destination: e,
                    onTap: () => onPrimaryTap(context, e),
                  )),
              const Divider(),
              ...secondaryDestinations.map((e) => DrawerItem(
                    destination: e,
                    onTap: () => onSecondaryTap(context, e),
                  )),
            ]),
          ),
        ),
      ),
    );
  }

  void onPrimaryTap(BuildContext context, Destination destination) {
    var index = primaryDestinations.indexOf(destination);

    context.read<NavigationProvider>().selectedIndex = index;
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  void onSecondaryTap(BuildContext context, Destination destination) {
    context.push(context.namedLocation(destination.label));
  }
}

class DrawerItem extends StatelessWidget {
  final Destination destination;

  final void Function()? onTap;

  const DrawerItem({super.key, required this.destination, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(destination.label),
      leading: Icon(destination.icon, size: 24),
      onTap: onTap,
    );
  }
}
