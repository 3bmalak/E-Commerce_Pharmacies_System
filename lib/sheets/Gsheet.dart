import 'package:gsheets/gsheets.dart';

import 'SheetsColumns.dart';

class FeedbackSheet{
  static String ID = "18VbRxyGlgOTtQR_Vk4kg4bIhTO3RNhNz__v1ZoCflK8";
  static const SheetCredentials= r'''  
  {
  "type": "service_account",
  "project_id": "graduation-project-7dda0",
  "private_key_id": "f8414d36920718f4ba1466a7148f44e092ea951f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC10zzWI/6trIBJ\nMuzHulZrI39Z0vqAc8ojJs3wrY3Baoyd69yznLBnEP+HZI/sq3f3ARnx1ZDhbFAW\neTM23E4zRCifYkI11D4o+OEnoHEns6pC+SbfiFGelvK8pQiPNlNkOO/HBu37itCx\ndRUfp+mZfe+6HveOB5Pn2u9XaPA70PDZJVvozSC7vknBwHi3Qm2DtTlQOS9AelmU\nbn5Hr24DJ/Q+iuo/UUlwEM23BNRRr0bhzamc3rka2UDQnbAw424X4aGBzJoBFSNC\npdFRdYrWqpjNhC1S09k97N24aSpXD16nRHN3VX+rA4B6VfsdEJFrXPr4AI0TALCr\nFIMr8KHTAgMBAAECggEAHjv/nBV6LkOb8BARbW4fxqBYIdtCSlp2sf0Bi6mLA9mF\ng7u1BFeOwboC3kRWO7g7h42IVJKlt8ZR/vACbcyZDaSiI0wBzypOzR4CxUXEQHd7\nXWL0GCwhHlTit4Rdyv/xQp4byPrvAb/lz0xfydbFslSi/fj+Qyt2vbwbG8GDCP7/\neAcsexTLYGba1+udz+kORrMQ4IyCXvCFl48OpktLjwX/kRJefnbQdbIaRY/z+xeo\nI6bJfxmdU5V/vCr43ztXG9t+pAS8gg6E0DxOBIucKavi5XsSx4xjsErVl9JzsN5E\nQQ5ccSRdqG2l1t3QsuSUNiSxGOyH1aszlgRPybnpGQKBgQDzWcu8XC1TMjk17TD7\nhsIvuUM1ELMa76vj8e1zcIDuly+OAqrOwGa76K63LCoqZMKJ8UT66mId5RO8CmzA\nDtdvIssHRv97flz2rt634zQ3PJlizxP0askKa8MPZibcqALrXnCVE3CgzANB0+90\n+ct3URgeEx5I48JHIML7XRcA7QKBgQC/RryYfPT4saEw1ObuB3T8E2i3VsVh45EY\nfXFucW82OStKgzZKmYRKEMs6V9dsxNFpidDwJYNWmGBXk7UdV0/uuGNqP5usYRZO\ngyKjjBUJZubv0R3ZFCmld9e+7UzgzVRyvJH+zd4eHUroywIL32GoNTM5HTmCwLVt\nv3lKRpGVvwKBgQC/rZopmp1k66lejZ7IcCPifVWvpaC99cx59mRnSlV0GQevHvC1\ne50wI54Cz7nCvKzzBGSmExoHnBmIQtnYCZithEVRTR4NgsHs2F67jy3g2E2lI6D/\nI2GJYMo7BeZUZc4u4Kti8PYE4c0q+6mghOU77VdG0R5IoYW0ityqK2/kHQKBgAN2\nIj+YM0602DfsAmnYVLOjHkgDF/tXhO6uhnj7MIoIqtHkYf0jnhNBDox1vn5HaYrB\nZbiS1Teh9kxfbe2kANxPFe18TTLnZuHw2ZWgGVlcNV2tqR6ekMpfytW3saZ30Mlq\nxDGaRCTDXvGritPwLPJAVDb6YmoNVrsvteA0Oro9AoGBAJHTdqKelYUMJgcjg1eV\nB7C9s9y4kWyjw4u/yII9qB4WsYMEBONA97Ifao++FOG/nJRIM1fgCxrEbL2M+w2+\nl2IksveEGLUAeTtrdj2QtKpXjkAvr6KL9ktO00BYGIlnI+8stVsyMqlw95lHMMnJ\nQdXN1A+UTpWyIuBi+CsuTbES\n-----END PRIVATE KEY-----\n",
  "client_email": "feedback-sheet@graduation-project-7dda0.iam.gserviceaccount.com",
  "client_id": "115075900660032842667",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/feedback-sheet%40graduation-project-7dda0.iam.gserviceaccount.com"
   }
   ''';

  static Worksheet? _userSheet;
  static final _GSheets = GSheets(SheetCredentials);

  static Future init() async {
    try{

      final spreadsheet = await _GSheets.spreadsheet(ID);

      _userSheet = await _getWorksheet(spreadsheet, title: "Feedbacks");
      final firstrow = SheetColumn.getColumns();
      _userSheet!.values.insertRow(1, firstrow);

    }
    catch(e){
      print(e);
    }
  }

  static Future<Worksheet> _getWorksheet(
      Spreadsheet spreadsheet, {
        required String title,
      }) async{
    try{
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String,dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}