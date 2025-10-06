import 'package:flutter/material.dart';
import 'package:registrationpractice/page/loginpage.dart';
import 'package:registrationpractice/service/authservice.dart';

class MerchandiserPage extends StatelessWidget {
  final Map<String, dynamic> profile;
  final AuthService _authService = AuthService();

  MerchandiserPage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ----------------------------
    // BASE URL for loading images
    // ----------------------------
    final String baseUrl =
        "http://localhost:8080/images/roleMerchandiserManager/";
    final String? photoName = profile['photo'];
    final String? photoUrl = (photoName != null && photoName.isNotEmpty)
        ? "$baseUrl$photoName"
        : null;

    // ----------------------------
    // SCAFFOLD: Main screen layout
    // ----------------------------

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Merchandiser Profile',
          style: TextStyle(color: Colors.orangeAccent),
        ),
        backgroundColor: Colors.black12,
        centerTitle: true,
        elevation: 4,
      ),

      // ----------------------------
      // DRAWER: Side navigation menu
      // ----------------------------
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 🟣 Drawer Header with user info
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
              accountName: Text(
                profile['name'] ?? 'Unknown User',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(profile['user']?['email'] ?? 'N/A'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: (photoUrl != null)
                    ? NetworkImage(photoUrl)
                    : const AssetImage('assets/default_avatar.jpg')
                          as ImageProvider,
              ),
            ),
            // 🟣 Menu Items (you can add more later)
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),

            // 🔴 Logout Option
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.deepOrange),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.deepOrange)
              ),
              onTap: () async {
                await _authService.logout();
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => Login()),
                );
              },


            ),
            // ----------------------------
            // BODY: Main content area
            // ----------------------------
          ],
        ),
      ),
    );
  }
}
