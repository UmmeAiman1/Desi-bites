
import 'package:desibites/Screens/account_screen.dart';
import 'package:desibites/Screens/cart_screen.dart';
import 'package:desibites/Screens/home_screen.dart';
import 'package:desibites/styles/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;

  const BottomNavigation({super.key, this.initialIndex = 0});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int currentindex;

  @override
  void initState() {
    super.initState();
    currentindex = widget.initialIndex;
  }

  final screen = [
     HomeScreen(),
    const CartScreen(),

    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentindex,
        children: screen,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(
               25),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)
            ],),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.deepPurple,
          selectedItemColor: Colors.white54,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          currentIndex: currentindex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.trolley), label: "Cart"),
          
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
        ),
      ),
    );
  }
}