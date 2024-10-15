import 'package:delivery/routes_name.dart';
import 'package:delivery/view/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/colors.dart';
import '../../../widgets/home_screen/profile/profile_menu.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';

  final List<String> _languages = ['English', 'Arabic'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      appBar: AppBar(
        title: const Text('Setting'),
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Get.offAll(() => const HomeScreen(page: 3));
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          const Text(
            '  General Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Notification Switch
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationsEnabled,
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.transparent,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            secondary: Icon(_notificationsEnabled ? Icons.notifications : Icons.notifications_off),
          ),

          // Dark Mode Toggle
          SwitchListTile(
            title: const Text('Enable Dark Mode'),
            value: _darkModeEnabled,
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.transparent,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
              // You can toggle the app's theme here using a provider or GetX
              Get.changeThemeMode(_darkModeEnabled ? ThemeMode.dark : ThemeMode.light);
            },
            secondary: Icon(_darkModeEnabled ? Icons.dark_mode : Icons.light_mode),
          ),

          // Language Selection Dropdown
          ListTile(
            title: const Text('Language'),
            subtitle: Text(_selectedLanguage),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: _languages.map<DropdownMenuItem<String>>((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 30),

          // Account Section
          const Text(
            '  Account Settings',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Account Information
          ProfileMenu(
            text: 'Edit Profile',
            color: Colors.white,
            iconColor: Colors.blue,
            icon: CupertinoIcons.person_fill,
            onPressed: () {
              Get.toNamed(AppRoutes.myAccount);
            },
          ),

          // Change Password
          ProfileMenu(
            text: 'Change Password',
            color: Colors.white,
            iconColor: Colors.blue,
            icon: Icons.lock,
            onPressed: () {
              Get.toNamed(AppRoutes.forgetPassword);
            },
          ),
        ],
      ),
    );
  }
}
