import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:oroscopo/Model/Sign.dart';

class SignDataManager {
  String segno;
  String data;
  String amore;
  String lavoro;
  String generale;

  SignDataManager({this.segno});

  Future<void> getSignData(String segno) async {
    var url = 'https://evening-scrubland-00798.herokuapp.com/oggi/' + segno;
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      this.data = jsonResponse['Data'];
      print("LETTO:\t\n" + jsonResponse["Amore"]);

      this.segno = segno;
      this.amore = jsonResponse["Amore"];
      this.lavoro = jsonResponse['Lavoro'];
      this.generale = jsonResponse['Generale'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Sign getData() {
    var sign =
        Sign(this.segno, this.data, this.amore, this.lavoro, this.generale);
    return sign;
  }
}
