import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:test_resposive/main.dart';

import 'page.dart';

class AppRoute {
  static final _rootNavigator = GlobalKey<NavigatorState>();
  static final _homeNavigator = GlobalKey<NavigatorState>();
  static final _schoolNavigator = GlobalKey<NavigatorState>();
  static final _businessNavigator = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigator,
    routes: [
      StatefulShellRoute.indexedStack(
          builder:(context, state, navigationShell) => MainWrapper(navigationShell: navigationShell) ,
          branches: <StatefulShellBranch>[
            StatefulShellBranch(navigatorKey: _homeNavigator, routes: [
              GoRoute(
                path: '/',
                name: 'Home',
                builder: (BuildContext context, GoRouterState state) {
                  return const Home();
                },
              ),
            ]),
            StatefulShellBranch(navigatorKey: _businessNavigator, routes: [
              GoRoute(
                path: '/business',
                name:'Business' ,
                builder: (BuildContext context, GoRouterState state) {
                  return const Business();
                },
              ),
            ]),
            StatefulShellBranch(navigatorKey: _schoolNavigator, routes: [
              GoRoute(
                path: '/school',
                name: 'School',
                builder: (BuildContext context, GoRouterState state) {
                  return const School();
                },
              ),
            ]),
          ]),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        name: 'Notifications',
        path: '/notification',
        builder: (BuildContext context, GoRouterState state) {
          return const Notifications();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        name:'Settings',
        path: '/settings',
        builder: (BuildContext context, GoRouterState state) {
          return const Settings();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigator,
        name: 'Logout',
        path: '/logout',
        builder: (BuildContext context, GoRouterState state) {
          return const Logout();
        },
      ),
    ],
  );

}

class ConstantRoute{
  static const home ='Home';
  static const school= 'School';
  static const business= 'Business';
  static const settings= 'Settings';
  static const logout= 'Logout';
  static const notification = 'Notifications';
}