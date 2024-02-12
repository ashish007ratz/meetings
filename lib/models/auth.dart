import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;


class LoginCreds{
  String emailOrName ;
  String password ;
  String get passwordHash => sha256.convert(utf8.encode(password)).toString();
  LoginCreds(this.emailOrName,this.password);

  // Create body data
  Map<String,dynamic> get body => {
    'grant_type': 'password',
    'username': emailOrName,
    'password': passwordHash,
  };

  Future userLogIn()async{
    var url = Uri.parse("https://apiv2stg.promilo.com/user/oauth/token");
    var response = await http.post(url, body: body,headers: {
      'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var respBody = jsonDecode(response.body);
    if(response.statusCode == 200){

    }
    else throw "code: ${response.statusCode}, ${respBody['error']??respBody['status']['message'] ?? "Error authorizing user"}";
    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }
}