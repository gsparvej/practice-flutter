class CuttingPlan {
  int? id;
  String? markerNo;
  int? fabricWidth;
  int? layCount;
  int? plannedPcs;
  double? fabricUsed;
  String? status;
  String? cuttingDate;
  int? actualPcs;
  int? markerEfficiency;
  double? fabricLength;
  int? markerCount;
  String? remarks;
  String? createdBy;
  String? description;
  int? markerOutput;

  CuttingPlan({
    this.id,
    required this.markerNo,
    required this.fabricWidth,
    required this.layCount,
    required this.plannedPcs,
    required this.fabricUsed,
    required this.status,
    required this.cuttingDate,
    required this.actualPcs,
    required this.markerEfficiency,
    required this.fabricLength,
    required this.markerCount,
    required this.remarks,
    required this.createdBy,
    required this.description,
    required this.markerOutput,
  });

  factory CuttingPlan.fromJson(Map<String, dynamic> json) {
    return CuttingPlan(
      id: json['id'],
      markerNo: json['markerNo'],
      fabricWidth: json['fabricWidth'],
      layCount: json['layCount'],
      plannedPcs: json['plannedPcs'],
      fabricUsed: (json['fabricUsed'] as num).toDouble(),
      status: json['status'],
      cuttingDate: json['cuttingDate'],
      actualPcs: json['actualPcs'],
      markerEfficiency: json['markerEfficiency'],
      fabricLength: (json['fabricLength'] as num).toDouble(),
      markerCount: json['markerCount'],
      remarks: json['remarks'],
      createdBy: json['createdBy'],
      description: json['description'],
      markerOutput: json['markerOutput'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'markerNo': markerNo,
      'fabricWidth': fabricWidth,
      'layCount': layCount,
      'plannedPcs': plannedPcs,
      'fabricUsed': fabricUsed,
      'status': status,
      'cuttingDate': cuttingDate,
      'actualPcs': actualPcs,
      'markerEfficiency': markerEfficiency,
      'fabricLength': fabricLength,
      'markerCount': markerCount,
      'remarks': remarks,
      'createdBy': createdBy,
      'description': description,
      'markerOutput': markerOutput,
    };
  }
}
