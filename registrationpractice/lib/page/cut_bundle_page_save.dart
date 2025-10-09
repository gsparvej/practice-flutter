import 'package:flutter/material.dart';
import 'package:registrationpractice/entity/cut_bundle.dart';
import 'package:registrationpractice/entity/cutting_plan.dart';
import 'package:registrationpractice/service/cut_bundle_service.dart';

class CutBundlePageSave extends StatefulWidget {
  const CutBundlePageSave({super.key});

  @override
  State<CutBundlePageSave> createState() => _CutBundlePageSaveState();
}

class _CutBundlePageSaveState extends State<CutBundlePageSave> {
  final CutBundleService cutBundleService = CutBundleService();

  List<CuttingPlan> cuttingPlan = [];
  CuttingPlan? selectedCuttingPlan;

  final _bundleNoController = TextEditingController();
  final _sizeController = TextEditingController();
  final _colorController = TextEditingController();
  final _plannedQtyController = TextEditingController();
  final _cutBundleDateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCuttingPlan();
  }

  Future<void> loadCuttingPlan() async {
    cuttingPlan = await cutBundleService.getCuttingPlan();
    print(cuttingPlan.toString());
    setState(() {});
  }

  Future<void> saveCutBundle() async {
    if (selectedCuttingPlan == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required fields properly'),
        ),
      );
      return;
    }

    final cutbundle = CutBundle(
      bundleNo: _bundleNoController.text,
      size: _sizeController.text,
      color: _colorController.text,
      plannedQty: _plannedQtyController.hashCode,
      cutBundleDate: _cutBundleDateController.text,
      cuttingPlanId: selectedCuttingPlan!.id,
    );

    bool success = await cutBundleService.addCutBundle(cutbundle);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success ? 'Cut Bundle Saved Successfully' : 'Failed to Save',
        ),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Cut Bundle")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            DropdownButtonFormField<CuttingPlan>(
              value: selectedCuttingPlan,
              decoration: const InputDecoration(labelText: 'Cutting Plan Id'),
              items: cuttingPlan.map((c) {
                return DropdownMenuItem(value: c, child: Text(c.id as String));
              }).toList(),
              onChanged: (val) {
                setState(() => selectedCuttingPlan = val);
              },
            ),

            const SizedBox(height: 16),
            TextField(
              controller: _bundleNoController,
              decoration: const InputDecoration(labelText: 'Cut Bundle No'),
            ),
            TextField(
              controller: _sizeController,
              decoration: const InputDecoration(labelText: 'Size'),
            ),
            TextField(
              controller: _colorController,
              decoration: const InputDecoration(labelText: 'Color'),
            ),
            TextField(
              controller: _plannedQtyController,
              decoration: const InputDecoration(labelText: 'Planned Quantity'),
            ),
            TextField(
              controller: _cutBundleDateController,
              decoration: const InputDecoration(labelText: 'Cut Bundle Date'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveCutBundle,
              child: const Text('Save Address'),
            ),
          ],
        ),
      ),
    );
  }
}
