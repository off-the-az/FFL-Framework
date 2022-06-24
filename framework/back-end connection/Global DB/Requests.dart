import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mykowel/framework/back-end%20connection/Global%20DB/base.dart';

class ApiService {
  Future get_request(final endpoint, final endpoit1) async {
    try {
      var url = ApiConstants.baseUrl + endpoint + endpoit1.toString();
      print(url.toString());
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> _model = json.decode(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future post_request(final endpoint, FormData formData) async {
    try {
      var url = ApiConstants.baseUrl + endpoint ;
      Dio dio = new Dio();
      dio.options.headers['content-Type'] =
          'multipart/form-data; application/json';
      var response = await Dio().post(
          url,
          data: formData);
      if (response.statusCode == 202) {
        print("Work");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future put_request(final endpoint, FormData formData) async {
    try {
      var url = ApiConstants.baseUrl + endpoint;
      Dio dio = new Dio();
      dio.options.headers['content-Type'] =
          'multipart/form-data; application/json';
      var response = await Dio().put(
        url,
        data: formData);
    } catch (e) {
      print(e.toString());
    }
  }

  Future delete_request(final endpoint1, final endpoint2) async {
    try {
      var url = ApiConstants.baseUrl + endpoint1 + endpoint2;
      Dio dio = new Dio();
      dio.options.headers['content-Type'] =
          'multipart/form-data; application/json';
      final response = await Dio().delete(url);
      if (response.statusCode == 200) {
        print("Case deleted");
      }
      else{
        print("Error saved");
      }
    }catch (e) {
      print(e.toString());
    }
  }
}