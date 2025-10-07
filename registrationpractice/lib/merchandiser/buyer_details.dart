

import 'package:flutter/material.dart';
import 'package:registrationpractice/service/buyer_service.dart';

class BuyerDetails extends StatefulWidget {

  const BuyerDetails({Key? key}) : super(key: key);

  @override
  State<BuyerDetails> createState() => _MyAllBuyerState();
}

class _MyAllBuyerState extends State<BuyerDetails> {

  late Future<List<BuyerDetails>> buyer;

  @override
  void initState() {
    super.initState();
    buyer = BuyerService().fetchBuyers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Buyer List")),

      body: FutureBuilder<List<BuyerDetails>>(
        future: buyer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No buyers found."));
          } else {
            final buyers = snapshot.data!;
            return ListView.builder(
              itemCount: buyers.length,
              itemBuilder: (context, index) {
                final app = buyers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    title: Text(app.
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Buyer Name: ${app.name}"),
                        Text("Contact: ${app.}"),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}