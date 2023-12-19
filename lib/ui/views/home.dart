import 'package:flutter/material.dart';
import 'package:tour_app/ui/views/bottom_nav_controller.dart';
import 'package:tour_app/ui/views/drawer_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Drawer_Screen(), 
          BottomNavController()],
      ),
    );
  }
}
