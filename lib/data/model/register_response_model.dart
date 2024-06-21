class RegisterResponseModel {
  String cOMCODE;
  String iP;
  String pASSWORD;
  String uSERNAME;

  RegisterResponseModel(
      {required this.cOMCODE,
      required this.iP,
      required this.pASSWORD,
        required this.uSERNAME});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      cOMCODE: json['COMCODE'],
      iP: json['IP'],
      pASSWORD: json['PASSWORD'],
      uSERNAME: json['USERNAME'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['COMCODE'] = cOMCODE;
    data['IP'] = iP;
    data['PASSWORD'] = pASSWORD;
    data['USERNAME'] = uSERNAME;
    return data;
  }
}
