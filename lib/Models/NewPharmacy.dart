class Pharmacy {
  dynamic email;
  dynamic district;
  dynamic pharmacyname;
  dynamic locationlink;
  dynamic locationtext;
  dynamic telephonenumber;
  dynamic rate;
  Pharmacy({
    required this.email,
    required this.district,
    required this.pharmacyname,
    required this.locationlink,
    required this.telephonenumber,
    required this.locationtext,
    required this.rate,

  });

  Pharmacy.fromJson(Map<String, dynamic> json)
  {

    email=json['email'];
    district=json['district'];
    pharmacyname= json['pharmacyname'];
    locationlink= json['locationlink'];
    locationtext= json['locationtext'];
    telephonenumber= json['telephonenumber'];
    rate= json['rate'];
  }
  Map<String, dynamic> toMap()
  {
    return {
      'email':email,
      'district':district,
      'pharmacyname':pharmacyname,
      'locationlink':locationlink,
      'locationlink':locationlink,
      'locationtext':locationtext,
      'rate':rate,
    };
  }
}