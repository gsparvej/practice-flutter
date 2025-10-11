import 'package:flutter/material.dart';
import 'package:registrationpractice/entity/buyer.dart';
import 'package:registrationpractice/merchandiser/buyer_details.dart';
import 'package:registrationpractice/merchandiser/uom_view.dart';
import 'package:registrationpractice/page/cut_bundle_page_save.dart';
import 'package:registrationpractice/page/cut_bundle_page_view.dart';
import 'package:registrationpractice/page/cutting_plan-view.dart';
import 'package:registrationpractice/page/loginpage.dart';
import 'package:registrationpractice/service/authservice.dart';
import 'package:registrationpractice/service/buyer_service.dart';

class MerchandiserPage extends StatelessWidget {
  final Map<String, dynamic> profile;
  final AuthService _authService = AuthService();
  final BuyerService buyerService = BuyerService();

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
              onTap: () async{
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View Buyer'),
              onTap: () async {
                Navigator.push(
                    context,
                MaterialPageRoute(
                    builder: (context) => BuyerDetails(),
                ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Save Cut Bundle'),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CutBundlePageSave(),
                    ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View Cut Bundle'),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CutBundlePageView(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View Cutting Plans'),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CuttingPlanPageView(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('View UOM'),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UomView(),
                  ),
                );
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
                Navigator.push(context,
                MaterialPageRoute(builder: (_) => Login()),
                );
              },


            ),



          ],
        ),
      ),

      // ----------------------------
      // BODY: Main content area
      // ----------------------------

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
                border: Border.all(
                  color: Colors.green,
                  width: 3,
                ),
              ),
              child: CircleAvatar(
                radius: 60, // image size
                backgroundColor: Colors.grey[200],
                backgroundImage: (photoUrl != null)
                ? NetworkImage(photoUrl) // from backend
                : const AssetImage('assets/default_avatar.png')
                  as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}
