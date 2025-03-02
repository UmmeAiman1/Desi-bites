import 'package:desibites/Screens/bottomnavigation.dart';
import 'package:flutter/material.dart';

import 'package:desibites/styles/colors.dart';
import 'package:desibites/widgets/gradient_button.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepPurple,
         
        title: const Text(
          'Order Confirmed',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bj.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank you for your order!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your order has been placed successfully.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 50),
            GradientButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const BottomNavigation(),
                  ),
                  (route) => false,
                );
              },
              text: 'Go to Home',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
