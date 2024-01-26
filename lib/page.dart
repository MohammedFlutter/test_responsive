import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_resposive/responsive/window.dart';
import 'package:test_resposive/routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: WindowClass.getWindowSize(context) == WindowClass.compact
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            : null,
        title: const Text('home'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
          color: Colors.amberAccent,
          child: const Center(
              child: Text(
            'Home page',
          ))),
    );
  }
}

class School extends StatelessWidget {
  const School({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: WindowClass.getWindowSize(context) == WindowClass.compact
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            : null,
        title: const Text('School'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
          color: Colors.amberAccent,
          child: const Center(
              child: Text(
            'School page',
          ))),
    );
  }
}

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: WindowClass.getWindowSize(context) == WindowClass.compact
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )
            : null,
        title: const Text('Business'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
          color: Colors.amberAccent,
          child: const Center(
              child: Text(
            'Business page',
          ))),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notification')),
        body: const Center(child: Text('Notification page')));
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: const Center(child: Text('Settings page')));
  }
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const Text('Logout'),
        ElevatedButton(
            onPressed: () => context.goNamed(ConstantRoute.home),
            child: const Text('go to home'))
      ],
    )));
  }
}
