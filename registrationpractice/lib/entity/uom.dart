class Uom {
  int? id;
  dynamic? productName;
  String? size;
  int? body;
  int? sleeve;
  int? pocket;
  int? wastage;
  int? shrinkage;
  double? baseFabric;

  Uom({this.id, this.productName, this.size, this.body, this.sleeve, this.pocket, this.wastage, this.shrinkage, this.baseFabric});

  factory Uom.fromJson(Map<String, dynamic> json) {
    return Uom(
      id: json['id'],
      productName: json['productName'],
      size: json['size'],
      body: json['body'],
      sleeve: json['sleeve'],
      pocket: json['pocket'],
      wastage: json['wastage'],
      shrinkage: json['shrinkage'],
      baseFabric: json['baseFabric'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productName': productName,
      'size': size,
      'body': body,
      'sleeve': sleeve,
      'pocket': pocket,
      'wastage': wastage,
      'shrinkage': shrinkage,
      'baseFabric': baseFabric,
    };
  }
}