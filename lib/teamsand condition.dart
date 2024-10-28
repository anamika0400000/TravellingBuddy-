import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1D24),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
            Text(
              'Terms and Conditions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 40),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                '1. Introduction\n\n'
                'Welcome to Travelling Buddy! These terms and conditions ("Terms") govern your use of our app and services.\n\n'
                '2. Eligibility\n\n'
                '- You must be at least 18 years old to use our app.\n'
                '- You must have a valid email address and password to create an account.\n\n'
                '3. Account Responsibility\n\n'
                '- You are responsible for maintaining the confidentiality of your account and password.\n'
                '- You agree to notify us immediately of any unauthorized use of your account.\n\n'
                '4. User Conduct\n\n'
                '- You agree to use our app and services for lawful purposes only.\n'
                '- You agree to respect other users\' privacy and personal information.\n\n'
                '5. Content Ownership\n\n'
                '- We do not claim ownership of any content you submit to our app.\n'
                '- You grant us a non-exclusive license to use, modify, and distribute your content.\n\n'
                '6. Disclaimers\n\n'
                '- Our app and services are provided on an "as-is" and "as-available" basis.\n'
                '- We disclaim all warranties and liabilities for any damages or losses.\n\n'
                '7. Limitation of Liability\n\n'
                '- We shall not be liable for any indirect, incidental, special, or consequential damages.\n'
                '- Our liability shall be limited to the maximum extent permitted by law.\n\n'
                '8. Governing Law\n\n'
                '- These Terms shall be governed by and construed in accordance with the laws of [insert jurisdiction].\n\n'
                '9. Changes to Terms\n\n'
                '- We reserve the right to modify or update these Terms at any time.\n'
                '- Your continued use of our app and services constitutes acceptance of any changes.\n\n'
                '10. Contact Us\n\n'
                '- If you have any questions or concerns, please contact us at [insert contact information].\n\n'
                'Note that these are just basic terms and conditions, and you should have a lawyer review and customize them to fit your specific app and needs. Additionally, you may need to add or remove sections depending on your app\'s functionality and requirements.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
