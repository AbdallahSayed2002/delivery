import 'package:delivery/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.loginPageColor,
      appBar: AppBar(
        title: const SafeArea(child: Text('Help Center')),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'How can we help you?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ExpansionTile(
            title: const Text('Account Issues'),
            leading: const Icon(CupertinoIcons.person_fill),
            iconColor: Colors.lightBlue[300],
            children: [
              ListTile(
                title: const Text('How to reset my password?'),
                onTap: () {
                  _showHelpDetail(context, 'How to reset my password?', 'To reset your password, go to the login page, tap "Forgot Password", and follow the instructions.');
                },
              ),
              ListTile(
                title: const Text('How to change my email address?'),
                onTap: () {
                  _showHelpDetail(context, 'How to change my email address?', 'To change your email address, go to account settings and update your email.');
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Payment Issues'),
            leading: const Icon(Icons.payment),
            iconColor: Colors.lightBlue[300],
            children: [
              ListTile(
                title: const Text('How to update my payment method?'),
                onTap: () {
                  _showHelpDetail(context, 'How to update my payment method?', 'To update your payment method, go to settings and select "Payment Methods" to make changes.');
                },
              ),
              ListTile(
                title: const Text('How to view my billing history?'),
                onTap: () {
                  _showHelpDetail(context, 'How to view my billing history?', 'You can view your billing history in the "Billing" section under account settings.');
                },
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Technical Issues'),
            leading: const Icon(Icons.bug_report),
            iconColor: Colors.lightBlue[300],
            children: [
              ListTile(
                title: const Text('App crashes or won\'t open'),
                onTap: () {
                  _showHelpDetail(context, 'App crashes or won\'t open', 'If the app crashes or won\'t open, try restarting the app or reinstalling it.');
                },
              ),
              ListTile(
                title: const Text('Unable to receive notifications'),
                onTap: () {
                  _showHelpDetail(context, 'Unable to receive notifications', 'Check your notification settings to ensure that the app has permission to send notifications.');
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'Contact Support',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email Support'),
            subtitle: const Text('support@deliveryapp.com'),
            onTap: () {
              _contactSupport('Email');
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Call Support'),
            subtitle: const Text('+1 800 123 4567',style: TextStyle(fontFamily: "sana"),),
            onTap: () {
              _contactSupport('Phone');
            },
          ),
        ],
      ),
    );
  }

  void _showHelpDetail(BuildContext context, String title, String message) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      textConfirm: "Close",
      buttonColor: Colors.blue,
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );
  }

  void _contactSupport(String method) {
    Get.snackbar("Contact Support", "You chose to contact via $method.", snackPosition: SnackPosition.BOTTOM);
  }
}
