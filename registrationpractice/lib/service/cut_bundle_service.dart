
import 'dart:convert';

import 'package:registrationpractice/entity/cut_bundle.dart';
import 'package:http/http.dart' as http;
import 'package:registrationpractice/entity/cutting_plan.dart';
class CutBundleService{
  static const String baseUrl = 'http://localhost:8080/api';

  Future<bool> addCutBundle(CutBundle cutBundle) async {


    final response = await http.post(
      Uri.parse(baseUrl+'/cutBundle'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cutBundle.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      print('Error: ${response.statusCode} ${response.body}');
      return false;
    }
  }

  Future<List<CuttingPlan>> getCuttingPlan() async {
    final response = await http.get(Uri.parse('$baseUrl/cutting_plan'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => CuttingPlan.fromJson(e)).toList();
    }
    throw Exception('Failed to load cutting plan');
  }




}