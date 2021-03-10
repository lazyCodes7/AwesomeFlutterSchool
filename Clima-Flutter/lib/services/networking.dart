import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  String url;
  NetworkHelper(this.url);

  Future getData() async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      String data = response.body;
      final decodedData = jsonDecode(data);
      return decodedData;
    }
    else{
      print(response.statusCode);

    }
}

}