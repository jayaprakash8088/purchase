class DetailResponseModel {
    List<Table> table;

    DetailResponseModel({required this.table});

    factory DetailResponseModel.fromJson(Map<String, dynamic> json) {
        return DetailResponseModel(
            table: (json['Table'] as List).map((i) => Table.fromJson(i)).toList() ,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if (table != null) {
            data['Table'] = table.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Table {
    String a;
    double b;
    String c;
    String d;
    double e;
    String f;
    String g;
    String h;

    Table({required this.a, required this.b, required this.c, required this.d, required this.e, required this.f, required this.g,
      required this.h});

    factory Table.fromJson(Map<String, dynamic> json) {
        return Table(
            a: json['A'],
            b: json['B'],
            c: json['C'],
            d: json['D'],
            e: json['E'],
            f: json['F'],
            g: json['G'],
            h: json['H'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['A'] = a;
        data['B'] = b;
        data['C'] = c;
        data['D'] = d;
        data['E'] = e;
        data['F'] = f;
        data['G'] = g;
        data['H'] = h;
        return data;
    }
}