import 'package:http/http.dart' as http;
import 'package:peritosapp/data/network/http_exceptions.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class HttpMethodsType {
  final _baseUrl = 'https://allemantperitos.com.pe/appsgi/';

  Future<dynamic> get(String url) async {
    try {
      Uri _uri = Uri.parse(_baseUrl);
      return await http.get(_uri).then((response) => _returnResponse(response));
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> post(String apiUrl, dynamic body) async {
    print('Api Post, url $apiUrl');
/*     String _finalUrl = (_baseUrl + apiUrl);
 */
    final url = Uri.https(_baseUrl, apiUrl);

    /* Uri _uri = Uri.parse(_finalUrl); */
    print('Api Post, my $url');

    try {
      return await http
          .post(url, body: body)
          .then((response) => _returnResponse);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(String apiUrl, dynamic body) async {
    String _finalUrl = (_baseUrl + apiUrl);
    Uri _uri = Uri.parse(_finalUrl);
    try {
      return await http
          .put(_uri, body: body)
          .then((response) => _returnResponse(response));
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> delete(String apiUrl) async {
    String _finalUrl = (_baseUrl + apiUrl);
    Uri _uri = Uri.parse(_finalUrl);
    try {
      return await http
          .delete(_uri)
          .then((response) => _returnResponse(response));
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print('api get recieved!');
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }

   static Future post(
    Uri url, {
    Map<String, String>? headers,
    Map<String, String>? body,
  }) =>
      _helper(
        'POST',
        url,
        headers: headers,
        body: body,
      );

  static Future _helper(
    String method,
    Uri url, {
    Map<String, String>? headers,
    Map<String, String>? body,
  }) async {
    _logRequest(url, method, headers: headers, body: body);

    final request = http.Request(method, url);
    if (body != null) {
      request.bodyFields = body;
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }
    final streamedResponse = await request.send();

    final response = await http.Response.fromStream(streamedResponse);
    _logResponse(response);
    return _parse(response);
  }
}
