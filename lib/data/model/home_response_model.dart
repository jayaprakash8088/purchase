class HomeResponseModel {
  HomeResponseModel({
    required this.table,
  });
  late final List<MyTable> table;

  HomeResponseModel.fromJson(Map<String, dynamic> json){
    table = List.from(json['Table']).map((e)=>MyTable.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Table'] = table.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyTable {
  MyTable({
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    required this.E,
    required this.F,
    required this.G,
    required this.H,
    required this.I,
    required this.J,
    required this.K,
    required this.L,
    required this.M,
    required this.N,
    required this.O,
    required this.P,
    required this.Q,
    required this.R,
    required this.S,
  });
  late final String A;
  late final String B;
  late final String C;
  late final String D;
  late final String E;
  late final double F;
  late final String G;
  late final String H;
  late final double I;
  late final double J;
  late final double K;
  late final double L;
  late final String M;
  late final double? N;
  late final int O;
  late final String P;
  late final String Q;
  late final double R;
  late final double S;

  MyTable.fromJson(Map<String, dynamic> json){
    A = json['A'];
    B = json['B'];
    C = json['C'];
    D = json['D'];
    E = json['E'];
    F = json['F'];
    G = json['G'];
    H = json['H'];
    I = json['I'];
    J = json['J'];
    K = json['K'];
    L = json['L'];
    M = json['M'];
    N = json['N'];
    O = json['O'];
    P = json['P'];
    Q = json['Q'];
    R = json['R'];
    S = json['S'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['A'] = A;
    _data['B'] = B;
    _data['C'] = C;
    _data['D'] = D;
    _data['E'] = E;
    _data['F'] = F;
    _data['G'] = G;
    _data['H'] = H;
    _data['I'] = I;
    _data['J'] = J;
    _data['K'] = K;
    _data['L'] = L;
    _data['M'] = M;
    _data['N'] = N;
    _data['O'] = O;
    _data['P'] = P;
    _data['Q'] = Q;
    _data['R'] = R;
    _data['S'] = S;
    return _data;
  }
}