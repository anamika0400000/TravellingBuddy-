import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Privacy Policy'),
        backgroundColor: Colors.transparent, // Match your app's theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy for Travelling Buddy',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'At Travelling Buddy, we are committed to protecting your privacy. This privacy policy explains how we collect, use, and protect your personal information when you use our app and services.\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'Information We Collect\n\n'
                '- We collect information you provide when you create an account, such as your name, email address, and password.\n'
                '- We collect information about your travels, such as your destinations, travel dates, and preferences.\n'
                '- We collect information about your device, such as your IP address and operating system.\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'Use of Information\n\n'
                '- We use your information to provide and improve our services, such as matching you with travel buddies and providing personalized recommendations.\n'
                '- We use your information to communicate with you, such as sending you notifications and updates.\n'
                '- We use your information to protect your account and prevent fraud.\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'Sharing of Information\n\n'
                '- We do not share your personal information with third parties, except as necessary to provide our services.\n'
                '- We may share anonymous and aggregated information with third parties, such as travel industry partners.\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'Security\n\n'
                '- We take reasonable measures to protect your personal information from loss, theft, and unauthorized access.\n'
                '- We use encryption and other security technologies to protect your information.\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'Choices\n\n'
                '- You can choose to opt-out of certain communications and notifications.\n'
                '- You can choose to delete your account and personal information at any time.\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'Changes to This Policy\n\n'
                '- We may update this privacy policy from time to time.\n'
                '- We will notify you of any significant changes to this policy.\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'Contact Us\n\n'
                '- If you have any questions or concerns about this privacy policy, please contact us at [insert contact information].\n\n',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
              Text(
                'By using our app and services, you consent to this privacy policy.\n\n'
                'Note that this is just a basic privacy policy, and you should have a lawyer review and customize it to fit your specific app and needs. Additionally, you may need to add or remove sections depending on your app\'s functionality and requirements.',
                style: TextStyle(fontSize: 16,color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
