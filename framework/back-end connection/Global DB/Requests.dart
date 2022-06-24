import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


Future ApiService(
  {
    required final request_type, 
    required final url,
    FormData? formData
  }
) async{
  try {
    if(request_type == "get"){
      print(url.toString());
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> _model = json.decode(response.body);
        return _model;
      }
      else{
        return "Error saved";
      }
    }
    if(request_type == "post"){
      Dio dio = new Dio();
      dio.options.headers['content-Type'] =
          'multipart/form-data; application/json';
      var response = await Dio().post(
          url,
          data: formData);
      if (response.statusCode == 200) {
        List<dynamic> _model = json.decode(response.data);
        return _model;
      }
      else{
        return "Error saved";
      }
    }
    if(request_type == "put"){
      Dio dio = new Dio();
      dio.options.headers['content-Type'] =
          'multipart/form-data; application/json';
      var response = await Dio().put(
        url,
        data: formData);
      if (response.statusCode == 200) {
        List<dynamic> _model = json.decode(response.data);
        return _model;
      }
      else{
        return "Error saved";
      }
    }
    if(request_type == "delete"){
      Dio dio = new Dio();
      dio.options.headers['content-Type'] =
          'multipart/form-data; application/json';
      final response = await Dio().delete(url);
      if (response.statusCode == 200) {
        List<dynamic> _model = json.decode(response.data);
        return _model;
      }
      else{
        return "Error saved";
      }
    }
  } catch (e) {
    print(e.toString());
  }
}