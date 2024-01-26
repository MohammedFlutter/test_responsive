import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_resposive/navigation/navigation_provider.dart';
import 'package:test_resposive/responsive/window.dart';

import 'routes.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRoute.router,
    );
  }
}

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late WindowClass _windowClass = WindowClass.getWindowSize(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _windowClass = WindowClass.getWindowSize(context);
  }

  @override
  Widget build(BuildContext context) {
    return WindowFactory().getWindow(
        primaryPane: SizedBox(child: widget.navigationShell),
        windowClass: _windowClass,
        navigationShell: widget.navigationShell);


  }
}
