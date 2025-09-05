class ExampleModel {
  String? message;
  bool? success;
  int? status;
  List<Product>? product;

  ExampleModel({this.message, this.success, this.status, this.product});

  ExampleModel.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    success = json['success'] ?? false;
    status = json['status'] ?? 0;
    if (json['payload'] != null) {
      product = <Product>[];
      json['payload'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['success'] = success;
    data['status'] = status;
    if (product != null) {
      data['payload'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? name;
  double? price;
  bool? inStock;
  List<String>? tags;
  Dimensions? dimensions;
  WarehouseLocation? warehouseLocation;
  String? description;

  Product(
      {this.name,
      this.price,
      this.inStock,
      this.tags,
      this.dimensions,
      this.warehouseLocation,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    price = json['price'] ?? 0.0;
    inStock = json['inStock'] ?? false;
    tags = json['tags'].cast<String>();
    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;
    warehouseLocation = json['warehouseLocation'] != null
        ? WarehouseLocation.fromJson(json['warehouseLocation'])
        : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['inStock'] = inStock;
    data['tags'] = tags;
    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }
    if (warehouseLocation != null) {
      data['warehouseLocation'] = warehouseLocation!.toJson();
    }
    data['description'] = description;
    return data;
  }
}

class Dimensions {
  int? width;
  int? height;
  int? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['depth'] = depth;
    return data;
  }
}

class WarehouseLocation {
  double? latitude;
  double? longitude;

  WarehouseLocation({this.latitude, this.longitude});

  WarehouseLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
