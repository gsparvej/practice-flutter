import 'package:flutter/material.dart';
import 'package:registrationpractice/entity/uom.dart';
import 'package:registrationpractice/service/uom_service.dart';


class UomView extends StatefulWidget {
  const UomView({Key? key}) : super(key: key);

  @override
  State<UomView> createState() => _UomViewState();
}

class _UomViewState extends State<UomView> {
  late Future<List<Uom>> uomList;

  @override
  void initState() {
    super.initState();
    uomList = UomService().fetchUom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All UOM List')),
      body: FutureBuilder<List<Uom>>(
        future: uomList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No UOM data available.'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final uom = data[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    title: Text('${uom.productName ?? 'N/A'} (${uom.size ?? 'N/A'})'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Body: ${uom.body ?? 0}, Sleeve: ${uom.sleeve ?? 0}, Pocket: ${uom.pocket ?? 0}'),
                        Text('Wastage: ${uom.wastage ?? 0}%, Shrinkage: ${uom.shrinkage ?? 0}%, Fabric: ${uom.baseFabric ?? 0} m'),
                      ],
                    ),
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
