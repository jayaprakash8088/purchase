class DrawerResponseModel {
  List<Table> table;

  DrawerResponseModel({required this.table});

  factory DrawerResponseModel.fromJson(Map<String, dynamic> json) {
    return DrawerResponseModel(
      table: (json['Table'] as List).map((i) => Table.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Table'] = table.map((v) => v.toJson()).toList();
    return data;
  }
}

class Table {
  String a;
  String b;
  double c;
  int d;

  Table({required this.a, required this.b, required this.c, required this.d});

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      a: json['A'],
      b: json['B'],
      c: json['C'],
      d: json['D'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['A'] = a;
    data['B'] = b;
    data['C'] = c;
    data['D'] = d;
    return data;
  }
}
