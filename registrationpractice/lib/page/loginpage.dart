import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:registrationpractice/page/adminpage.dart';
import 'package:registrationpractice/merchandiser/merchandiserpage.dart';
import 'package:registrationpractice/page/registrationpage.dart';
import 'package:registrationpractice/service/authservice.dart';
import 'package:registrationpractice/service/merchandiser_manager_service.dart';

class Login extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _obscurePassword = true;

  final storage = new FlutterSecureStorage();
  AuthService authService = AuthService();
  MerchandiserManagerService merchandiserManagerService =
      MerchandiserManagerService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "example@gamil.com",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: "password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.password),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginUser(context);
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w800),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.orangeAccent,
              ),
            ),
            SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text(
                'Registration',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      final response = await authService.login(email.text, password.text);

      // Successful login , role-based navigation
      final role = await authService.getUserRole();
      if (role == 'ADMIN') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminPage()),
        );
      } else if (role == 'MERCHANDISERMANAGER') {
        final profile = await merchandiserManagerService
            .getMerchandiserManagerProfile();
        if(profile != null){
          Navigator.pushReplacement(
              context,
          MaterialPageRoute(
              builder: (context) => MerchandiserPage(profile: profile),
          ),
          );

        } else {
          print('Unknown role: $role');
        }

      }
    }

    catch (error) {
      print('Login Failed: $error');
    }
  }
}
