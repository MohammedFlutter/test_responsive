import 'package:flutter/material.dart';

class Destination {
  final String label;
  final IconData icon;

  const Destination({required this.label, required this.icon});
}

const primaryDestinations = [
  Destination(
    icon: Icons.home,
    label: 'Home',
  ),
  Destination(
    icon: Icons.business,
    label: 'Business',
  ),
  Destination(
    icon: Icons.school,
    label: 'School',
  ),
];

const secondaryDestinations = [
  Destination(
    icon: Icons.notifications,
    label: 'Notifications',
  ),
  Destination(
    icon: Icons.settings,
    label: 'Settings',
  ),
  Destination(
    icon: Icons.logout,
    label: 'Logout',
  ),
];
