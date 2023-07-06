class PharmacyModel {
  dynamic uId;
  dynamic district;
  dynamic pharmacyname;
  dynamic locationlink;
  dynamic locationtext;
  dynamic telephonenumber;
  dynamic rate;
  PharmacyModel({
    required this.district,
    required this.pharmacyname,
    required this.locationlink,
    required this.telephonenumber,
    required this.locationtext,
    required this.rate,
    required this.uId,

  });

  PharmacyModel.fromJson(Map<String, dynamic>? json)
  {
    district=json!['district'];
    pharmacyname= json['pharmacyname'];
    locationlink= json['locationlink'];
    locationtext= json['locationtext'];
    telephonenumber= json['telephonenumber'];
    rate= json['rate'];
    uId=json['uId'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'district':district,
      'pharmacyname':pharmacyname,
      'locationlink':locationlink,
      'locationlink':locationlink,
      'locationtext':locationtext,
      'rate':rate,
      'uId':uId,
    };
  }
}