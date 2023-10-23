import 'dart:convert';

import 'package:http/http.dart' ;

class APICalls{

  Future getDataFromApi({required String urlLink}) async {
    Uri url = Uri.parse(urlLink);

    Response response = await get(url);

    if(response.statusCode != 200) {
      print('call not successful');
      return;
    }

    return jsonDecode(response.body);
  }

}