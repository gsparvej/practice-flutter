class CutBundle {
  int? id;
  String? bundleNo;
  String? size;
  String? color;
  int? plannedQty;
  String? cutBundleDate;
  int? cuttingPlanId;

  CutBundle({
    this.id,
    this.bundleNo,
    this.size,
    this.color,
    this.plannedQty,
    this.cutBundleDate,
    this.cuttingPlanId,
  });

  factory CutBundle.fromJson(Map<String, dynamic> json) {
    return CutBundle(
      id: json['id'],
      bundleNo: json['bundleNo'],
      size: json['size'],
      color: json['color'],
      plannedQty: json['plannedQty'],
      cutBundleDate: json['cutBundleDate'],
      cuttingPlanId: json['cuttingPlanId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bundleNo': bundleNo,
      'size': size,
      'color': color,
      'plannedQty': plannedQty,
      'cutBundleDate': cutBundleDate,
      'cuttingPlanId': cuttingPlanId,
    };
  }
}
