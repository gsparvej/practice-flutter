class ProductionOrder {
  int? id;
  int? planQty;
  dynamic? startDate;
  dynamic? endDate;
  dynamic? priority;
  dynamic? status;
  dynamic? description;
  dynamic? size;
  dynamic? bomStyle;
  dynamic? order;

  ProductionOrder({this.id, this.planQty, this.startDate, this.endDate, this.priority, this.status, this.description, this.size, this.bomStyle, this.order});

  factory ProductionOrder.fromJson(Map<String, dynamic> json) {
    return ProductionOrder(
      id: json['id'],
      planQty: json['planQty'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      priority: json['priority'],
      status: json['status'],
      description: json['description'],
      size: json['size'],
      bomStyle: json['bomStyle'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'planQty': planQty,
      'startDate': startDate,
      'endDate': endDate,
      'priority': priority,
      'status': status,
      'description': description,
      'size': size,
      'bomStyle': bomStyle,
      'order': order,
    };
  }
}