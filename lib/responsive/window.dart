import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_resposive/navigation/custom_drawer.dart';
import 'package:test_resposive/navigation/custom_navigation.dart';
import 'package:test_resposive/navigation/navigation_provider.dart';

enum WindowClass {
  compact, ///mobile in portrait
  medium, ///mobile in landscape and tablet in portrait
  expanded ///tablet in landscape and windows and web
  ;

  static WindowClass _getWindowClass(double width) {
    if (width < 600) {
      return WindowClass.compact;
    } else if (width < 840) {
      return WindowClass.medium;
    } else {
      return WindowClass.expanded;
    }
  }

  static WindowClass getWindowSize(BuildContext context) =>
      _getWindowClass(MediaQuery.of(context).size.width);
}

abstract class Window extends StatelessWidget {
  final AppBar? appBar;
  final Widget? navigation;
  final Widget? drawer;
  final Widget primaryPane;

  const Window({
    super.key,
    required this.primaryPane,
    this.appBar,
    this.drawer,
    // this.secondaryPane,
    this.navigation,
  });
}

class ExpandedWindow extends Window {
  const ExpandedWindow({
    super.key,
    required super.primaryPane,
    super.appBar,
    super.drawer,
    super.navigation,
    // super.secondaryPane
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Builder(
            builder: (context) {
              if (drawer != null && navigation != null) {
                return (context
                        .watch<NavigationProvider>()
                        .standardDrawerActive)
                    ? drawer!
                    : navigation!;
              }
              return navigation ?? drawer ?? const SizedBox();
            },
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(child: primaryPane),
          const SizedBox(
            width: 24,
          ),
          // if (widget.secondaryPane != null)
          //   Row(
          //     children: [
          //       widget.secondaryPane!,
          //       const SizedBox(
          //         width: 24,
          //       )
          //     ],
          //   ),
        ],
      ),
    );
  }
}

class MediumWindow extends Window {
  const MediumWindow({
    super.key,
    required super.primaryPane,
    super.appBar,
    required super.drawer,
    required super.navigation,
  });

  // factory MediumScreen.copy(MediumScreen screen) {
  //   return screen;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Row(
        children: [
          navigation ?? const SizedBox(),

          // const SizedBox(
          //   width: 24,
          // ),
          Expanded(child: primaryPane),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }
}

class CompactWindow extends Window {
  const CompactWindow({
    super.key,
    required super.primaryPane,
    required super.drawer,
    required super.navigation,
    super.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: navigation,
      body: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(child: primaryPane),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}

class WindowFactory {
  Window getWindow({
    required Widget primaryPane,
    // required AppBar appBar,
    required WindowClass windowClass,
    required StatefulNavigationShell navigationShell,
  }) =>
      switch (windowClass) {
        WindowClass.compact => CompactWindow(
            primaryPane: primaryPane,
            // appBar: appBar,
            drawer: CustomModalDrawer(navigationShell: navigationShell),
            navigation:
                CustomBottomNavigationBar(navigationShell: navigationShell),
          ),
        WindowClass.medium => MediumWindow(
            primaryPane: primaryPane,
            // appBar: appBar,
            drawer: CustomModalDrawer(navigationShell: navigationShell),
            navigation: CustomNavigationRail(navigationShell: navigationShell),
          ),
        WindowClass.expanded => ExpandedWindow(
            primaryPane: primaryPane,
            // appBar: appBar,
            drawer: CustomStandardDrawer(navigationShell: navigationShell),
            navigation: CustomNavigationRail(navigationShell: navigationShell),
          ),
      };
}
// class ResponsiveScreen extends StatefulWidget {
//   const ResponsiveScreen(
//       {super.key,
//       this.appBar,
//       this.drawer,
//       required this.primaryPane,
//       this.secondaryPane});
//
//   final AppBar? appBar;
//   final Drawer? drawer;
//   final Widget primaryPane;
//   final Widget? secondaryPane;
//
//   @override
//   State<ResponsiveScreen> createState() => _ResponsiveScreenState();
// }
//
// class _ResponsiveScreenState extends State<ResponsiveScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final WindowClass windowClass = getWindowSize(context);
//     final double gap = windowClass == WindowClass.compact ? 16 : 24;
//     return Scaffold(
//         appBar: widget.appBar,
//         drawer: widget.drawer,
//         bottomNavigationBar: switch (windowClass) {
//           WindowClass.compact => CustomNavigation(
//               isBottom: true,
//             ),
//           _ => null
//         },
//         body: SafeArea(
//           child: Row(
//             children: [
//               if (windowClass != WindowClass.compact)
//                 CustomNavigation(isBottom: false),
//               SizedBox(
//                 width: gap,
//               ),
//               Expanded(child: widget.primaryPane),
//               SizedBox(
//                 width: gap,
//               ),
//               if (windowClass == WindowClass.expanded &&
//                   widget.secondaryPane != null)
//                 Expanded(child: widget.secondaryPane!)
//             ],
//           ),
//         ));
//   }
//
//   WindowClass getWindowSize(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return WindowClass.getWindowClass(width);
//   }
// }
