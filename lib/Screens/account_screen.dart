import 'package:desibites/Screens/register_screen.dart';
import 'package:desibites/styles/colors.dart';
import 'package:desibites/widgets/gradient_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      print('User signed out successfully');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);

 
       Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()));
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.deepPurple,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bj.jpg'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'User Information',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'Umme Aiman',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'UmmeAiman29',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                title: Text(
                  'aiman@gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Email Address',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  '+1 234 567 890',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Phone Number',
                  style: TextStyle(color: Colors.white54),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                title: const Text(
                  'Change Password',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                title: const Text(
                  'Notification Preferences',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              Center(
                child: GradientButton(
                    onPressed: () {
                      _signOut(context);
                    },
                    text: 'Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
